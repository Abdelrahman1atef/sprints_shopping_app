import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
  static SharedPreferences? sharedPreferences;
  static final Map<String, dynamic> _fallbackStorage = {};

  static Future<void> init() async {
    try {
      sharedPreferences =
          await SharedPreferences.getInstance();
    } catch (e) {
      print('Failed to initialize SharedPreferences: $e');
      sharedPreferences = null;
    }
  }

  static dynamic getData({required String key}) {
    try {
      if (sharedPreferences != null) {
        return sharedPreferences!.get(key);
      } else {
        // Fallback to in-memory storage
        return _fallbackStorage[key];
      }
    } catch (e) {
      print('Error getting data: $e');
      // Fallback to in-memory storage
      return _fallbackStorage[key];
    }
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    try {
      if (sharedPreferences != null) {
        if (value is String)
          return await sharedPreferences!.setString(
            key,
            value,
          );
        if (value is int)
          return await sharedPreferences!.setInt(
            key,
            value,
          );
        if (value is bool)
          return await sharedPreferences!.setBool(
            key,
            value,
          );
        return await sharedPreferences!.setDouble(
          key,
          value,
        );
      } else {
        // Fallback to in-memory storage
        _fallbackStorage[key] = value;
        return true;
      }
    } catch (e) {
      print('Error saving data: $e');
      // Fallback to in-memory storage
      _fallbackStorage[key] = value;
      return true;
    }
  }

  static Future<bool> removeData({
    required String key,
  }) async {
    try {
      if (sharedPreferences != null) {
        return sharedPreferences!.remove(key);
      } else {
        // Fallback to in-memory storage
        _fallbackStorage.remove(key);
        return true;
      }
    } catch (e) {
      print('Error removing data: $e');
      // Fallback to in-memory storage
      _fallbackStorage.remove(key);
      return true;
    }
  }
}

class LocaleProvider extends ChangeNotifier {
  static const String _localeKey = 'selected_locale';
  Locale _locale = const Locale('en');

  Locale get locale => _locale;

  LocaleProvider() {
    _loadSavedLocale();
  }

  Future<void> _loadSavedLocale() async {
    try {
      // Ensure CashHelper is initialized
      if (CashHelper.sharedPreferences == null) {
        await CashHelper.init();
      }

      final savedLanguageCode = CashHelper.getData(
        key: _localeKey,
      );
      if (savedLanguageCode != null) {
        _locale = Locale(savedLanguageCode);
        notifyListeners();
      }
    } catch (e) {
      print('Error loading saved locale: $e');
      // Keep default locale (en)
    }
  }

  Future<void> toggleLocale() async {
    try {
      final newLanguageCode = _locale.languageCode == 'en'
          ? 'ar'
          : 'en';
      _locale = Locale(newLanguageCode);

      // Save to SharedPreferences using CashHelper
      await CashHelper.saveData(
        key: _localeKey,
        value: newLanguageCode,
      );

      notifyListeners();
    } catch (e) {
      print('Error toggling locale: $e');
    }
  }

  Future<void> setLocale(String languageCode) async {
    try {
      _locale = Locale(languageCode);

      // Save to SharedPreferences using CashHelper
      await CashHelper.saveData(
        key: _localeKey,
        value: languageCode,
      );

      notifyListeners();
    } catch (e) {
      print('Error setting locale: $e');
    }
  }
}
