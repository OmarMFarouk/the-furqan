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
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Al-Furqan`
  String get appTitle {
    return Intl.message(
      'Al-Furqan',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Alsalamu Alaykum`
  String get Hello {
    return Intl.message(
      'Alsalamu Alaykum',
      name: 'Hello',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get header1 {
    return Intl.message(
      'Sign in',
      name: 'header1',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get header2 {
    return Intl.message(
      'Sign up',
      name: 'header2',
      desc: '',
      args: [],
    );
  }

  /// `name`
  String get name {
    return Intl.message(
      'name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `e-mail`
  String get email {
    return Intl.message(
      'e-mail',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `password`
  String get password {
    return Intl.message(
      'password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get login_question {
    return Intl.message(
      'Don\'t have an account?',
      name: 'login_question',
      desc: '',
      args: [],
    );
  }

  /// `Register here`
  String get login_answer {
    return Intl.message(
      'Register here',
      name: 'login_answer',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get register_question {
    return Intl.message(
      'Already have an account?',
      name: 'register_question',
      desc: '',
      args: [],
    );
  }

  /// `Login here`
  String get register_answer {
    return Intl.message(
      'Login here',
      name: 'register_answer',
      desc: '',
      args: [],
    );
  }

  /// `Last Read`
  String get last_read {
    return Intl.message(
      'Last Read',
      name: 'last_read',
      desc: '',
      args: [],
    );
  }

  /// `Surahs`
  String get Surahs {
    return Intl.message(
      'Surahs',
      name: 'Surahs',
      desc: '',
      args: [],
    );
  }

  /// `Verse Interpretation`
  String get interpretation {
    return Intl.message(
      'Verse Interpretation',
      name: 'interpretation',
      desc: '',
      args: [],
    );
  }

  /// `Okay`
  String get okay {
    return Intl.message(
      'Okay',
      name: 'okay',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Privacy & Security`
  String get privary {
    return Intl.message(
      'Privacy & Security',
      name: 'privary',
      desc: '',
      args: [],
    );
  }

  /// `Help & Support`
  String get help {
    return Intl.message(
      'Help & Support',
      name: 'help',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Choose Language`
  String get choose {
    return Intl.message(
      'Choose Language',
      name: 'choose',
      desc: '',
      args: [],
    );
  }

  /// `App Language`
  String get appLang {
    return Intl.message(
      'App Language',
      name: 'appLang',
      desc: '',
      args: [],
    );
  }

  /// `Font Size`
  String get font {
    return Intl.message(
      'Font Size',
      name: 'font',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
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
