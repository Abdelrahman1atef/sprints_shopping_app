// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Sign In`
  String get signIn {
    return Intl.message('Sign In', name: 'signIn', desc: '', args: []);
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message('Sign Up', name: 'signUp', desc: '', args: []);
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back`
  String get welcomeBack {
    return Intl.message(
      'Welcome Back',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Sign in to your account`
  String get signInSubtitle {
    return Intl.message(
      'Sign in to your account',
      name: 'signInSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message('Full Name', name: 'fullName', desc: '', args: []);
  }

  /// `Enter your full name`
  String get fullNameHint {
    return Intl.message(
      'Enter your full name',
      name: 'fullNameHint',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Enter your email`
  String get emailHint {
    return Intl.message(
      'Enter your email',
      name: 'emailHint',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Enter your password`
  String get passwordHint {
    return Intl.message(
      'Enter your password',
      name: 'passwordHint',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm your password`
  String get confirmPasswordHint {
    return Intl.message(
      'Confirm your password',
      name: 'confirmPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? `
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account? ',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account? `
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account? ',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get success {
    return Intl.message('Success', name: 'success', desc: '', args: []);
  }

  /// `Account created successfully`
  String get accountCreatedSuccessfully {
    return Intl.message(
      'Account created successfully',
      name: 'accountCreatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Account sign-in successfully`
  String get accountSignInSuccessfully {
    return Intl.message(
      'Account sign-in successfully',
      name: 'accountSignInSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message('Close', name: 'close', desc: '', args: []);
  }

  /// `Full name is required`
  String get validationFullNameRequired {
    return Intl.message(
      'Full name is required',
      name: 'validationFullNameRequired',
      desc: '',
      args: [],
    );
  }

  /// `Full name must be at least 2 characters`
  String get validationFullNameMin {
    return Intl.message(
      'Full name must be at least 2 characters',
      name: 'validationFullNameMin',
      desc: '',
      args: [],
    );
  }

  /// `First letter must be uppercase`
  String get validationFullNameUppercase {
    return Intl.message(
      'First letter must be uppercase',
      name: 'validationFullNameUppercase',
      desc: '',
      args: [],
    );
  }

  /// `Email is required`
  String get validationEmailRequired {
    return Intl.message(
      'Email is required',
      name: 'validationEmailRequired',
      desc: '',
      args: [],
    );
  }

  /// `Email must include @`
  String get validationEmailAt {
    return Intl.message(
      'Email must include @',
      name: 'validationEmailAt',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get validationEmailValid {
    return Intl.message(
      'Please enter a valid email',
      name: 'validationEmailValid',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get validationPasswordRequired {
    return Intl.message(
      'Password is required',
      name: 'validationPasswordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 6 characters`
  String get validationPasswordMin {
    return Intl.message(
      'Password must be at least 6 characters',
      name: 'validationPasswordMin',
      desc: '',
      args: [],
    );
  }

  /// `Please confirm your password`
  String get validationConfirmPasswordRequired {
    return Intl.message(
      'Please confirm your password',
      name: 'validationConfirmPasswordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get validationPasswordsNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'validationPasswordsNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Shopping App!`
  String get homeTitle {
    return Intl.message(
      'Welcome to Shopping App!',
      name: 'homeTitle',
      desc: '',
      args: [],
    );
  }

  /// `You have successfully signed in.`
  String get homeSubtitle {
    return Intl.message(
      'You have successfully signed in.',
      name: 'homeSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Feature 3: Main Shopping Screen\n(Coming Soon)`
  String get homeComingSoon {
    return Intl.message(
      'Feature 3: Main Shopping Screen\n(Coming Soon)',
      name: 'homeComingSoon',
      desc: '',
      args: [],
    );
  }

  /// `Your Premium Shopping Experience`
  String get welcomeTagline {
    return Intl.message(
      'Your Premium Shopping Experience',
      name: 'welcomeTagline',
      desc: '',
      args: [],
    );
  }

  /// `Our Products`
  String get ourProducts {
    return Intl.message(
      'Our Products',
      name: 'ourProducts',
      desc: '',
      args: [],
    );
  }

  /// `Featured Products`
  String get featuredProducts {
    return Intl.message(
      'Featured Products',
      name: 'featuredProducts',
      desc: '',
      args: [],
    );
  }

  /// `Shop Our Collection`
  String get shopOurCollection {
    return Intl.message(
      'Shop Our Collection',
      name: 'shopOurCollection',
      desc: '',
      args: [],
    );
  }

  /// `Hot Offers`
  String get hotOffers {
    return Intl.message('Hot Offers', name: 'hotOffers', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
