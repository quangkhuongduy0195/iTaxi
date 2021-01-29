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
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome Back!`
  String get WelcomeBack {
    return Intl.message(
      'Welcome Back!',
      name: 'WelcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Aboard!`
  String get WelcomeAboard {
    return Intl.message(
      'Welcome Aboard!',
      name: 'WelcomeAboard',
      desc: '',
      args: [],
    );
  }

  /// `Login To Continue Using iTaxi`
  String get LoginToContinueUsingITaxi {
    return Intl.message(
      'Login To Continue Using iTaxi',
      name: 'LoginToContinueUsingITaxi',
      desc: '',
      args: [],
    );
  }

  /// `Sign up with iTaxi in simple steps`
  String get SignUpWithITaxiInSimpleSteps {
    return Intl.message(
      'Sign up with iTaxi in simple steps',
      name: 'SignUpWithITaxiInSimpleSteps',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get Email {
    return Intl.message(
      'Email',
      name: 'Email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message(
      'Password',
      name: 'Password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get ForgotPassword {
    return Intl.message(
      'Forgot password?',
      name: 'ForgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get Login {
    return Intl.message(
      'Log in',
      name: 'Login',
      desc: '',
      args: [],
    );
  }

  /// `New User? `
  String get NewUser {
    return Intl.message(
      'New User? ',
      name: 'NewUser',
      desc: '',
      args: [],
    );
  }

  /// `Sign up for a new account`
  String get SignUpForNewAccount {
    return Intl.message(
      'Sign up for a new account',
      name: 'SignUpForNewAccount',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get Name {
    return Intl.message(
      'Name',
      name: 'Name',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get PhoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'PhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get SignUp {
    return Intl.message(
      'Sign up',
      name: 'SignUp',
      desc: '',
      args: [],
    );
  }

  /// `Already a user? `
  String get AlreadyUser {
    return Intl.message(
      'Already a user? ',
      name: 'AlreadyUser',
      desc: '',
      args: [],
    );
  }

  /// `LoginNow`
  String get LoginNow {
    return Intl.message(
      'LoginNow',
      name: 'LoginNow',
      desc: '',
      args: [],
    );
  }

  /// `Invalid name`
  String get InvalidName {
    return Intl.message(
      'Invalid name',
      name: 'InvalidName',
      desc: '',
      args: [],
    );
  }

  /// `Invalid phone number`
  String get InvalidPhoneNumber {
    return Intl.message(
      'Invalid phone number',
      name: 'InvalidPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email`
  String get InvalidEmail {
    return Intl.message(
      'Invalid email',
      name: 'InvalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Invalid password`
  String get InvalidPassword {
    return Intl.message(
      'Invalid password',
      name: 'InvalidPassword',
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
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}