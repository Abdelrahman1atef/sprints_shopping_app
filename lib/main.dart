import 'package:flutter/material.dart';
import 'package:sprints_shopping_app/sprints_shopping_app.dart';
import 'package:sprints_shopping_app/core/providers/locale_provider.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    
    // Initialize CashHelper
    await CashHelper.init();
    
    runApp(const SprintsShoppingApp());
  } catch (e) {
    print('Error initializing app: $e');
    // Still run the app even if SharedPreferences fails
    runApp(const SprintsShoppingApp());
  }
}
