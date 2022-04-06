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

  /// `Hi Welcome`
  String get welcomeText {
    return Intl.message(
      'Hi Welcome',
      name: 'welcomeText',
      desc: '',
      args: [],
    );
  }

  /// `View Wholesalers`
  String get viewWholesalers {
    return Intl.message(
      'View Wholesalers',
      name: 'viewWholesalers',
      desc: '',
      args: [],
    );
  }

  /// `Upload produce`
  String get uploadProduce {
    return Intl.message(
      'Upload produce',
      name: 'uploadProduce',
      desc: '',
      args: [],
    );
  }

  /// `Form`
  String get form {
    return Intl.message(
      'Form',
      name: 'form',
      desc: '',
      args: [],
    );
  }

  /// `profile`
  String get Profile {
    return Intl.message(
      'profile',
      name: 'Profile',
      desc: '',
      args: [],
    );
  }

  /// `Market prices`
  String get marketPrices {
    return Intl.message(
      'Market prices',
      name: 'marketPrices',
      desc: '',
      args: [],
    );
  }

  /// `Kissan Helpline Numbers`
  String get kissanHelplineNumbers {
    return Intl.message(
      'Kissan Helpline Numbers',
      name: 'kissanHelplineNumbers',
      desc: '',
      args: [],
    );
  }

  /// `How To Take Care Of Crops`
  String get howToTakeCareOfCrops {
    return Intl.message(
      'How To Take Care Of Crops',
      name: 'howToTakeCareOfCrops',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get aboutUs {
    return Intl.message(
      'About Us',
      name: 'aboutUs',
      desc: '',
      args: [],
    );
  }

  /// `Fruits`
  String get fruits {
    return Intl.message(
      'Fruits',
      name: 'fruits',
      desc: '',
      args: [],
    );
  }

  /// `Weight`
  String get weight {
    return Intl.message(
      'Weight',
      name: 'weight',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `The Department of Agriculture & Cooperation (DAC), Ministry of Agriculture, Govt. of India launched Kisan Call Centers on January 21, 2004 across the country to deliver extension services to the farming community.'\n                      'The purpose of these call centers is to respond to issues raised by farmers, instantly, in the local language.'\n                      ' There are call centers for every state which are expected to handle traffic from any part of the country.'\n                      ' Queries related to agriculture and allied sectors are being addressed through these call centers.'\n                      'A farmer from any part of the State can contact the Kisan Call Centre by dialing the toll free Telephone No. 1551 or 1800-180-1551 and present their problems/queries related to farming.'\n                      ' The operator at the Kisan Call centre will attempt to answer the problems/queries of the farmers immediately.'\n                      'In case the operator at the Call Centre is not able to address the farmers query immediately, the call will be forwarded to identified agricultural specialists.'`
  String get helplineDesc {
    return Intl.message(
      'The Department of Agriculture & Cooperation (DAC), Ministry of Agriculture, Govt. of India launched Kisan Call Centers on January 21, 2004 across the country to deliver extension services to the farming community.\'\n                      \'The purpose of these call centers is to respond to issues raised by farmers, instantly, in the local language.\'\n                      \' There are call centers for every state which are expected to handle traffic from any part of the country.\'\n                      \' Queries related to agriculture and allied sectors are being addressed through these call centers.\'\n                      \'A farmer from any part of the State can contact the Kisan Call Centre by dialing the toll free Telephone No. 1551 or 1800-180-1551 and present their problems/queries related to farming.\'\n                      \' The operator at the Kisan Call centre will attempt to answer the problems/queries of the farmers immediately.\'\n                      \'In case the operator at the Call Centre is not able to address the farmers query immediately, the call will be forwarded to identified agricultural specialists.\'',
      name: 'helplineDesc',
      desc: '',
      args: [],
    );
  }

  /// `Don't Refrigerate`
  String get tips1 {
    return Intl.message(
      'Don\'t Refrigerate',
      name: 'tips1',
      desc: '',
      args: [],
    );
  }

  /// `Store in a cool, dark place with relatively high humidity.`
  String get tips2 {
    return Intl.message(
      'Store in a cool, dark place with relatively high humidity.',
      name: 'tips2',
      desc: '',
      args: [],
    );
  }

  /// `Allow air circulation.`
  String get tips3 {
    return Intl.message(
      'Allow air circulation.',
      name: 'tips3',
      desc: '',
      args: [],
    );
  }

  /// `Keep separate from onions, bananas, and other ethylene-producing items.`
  String get tips4 {
    return Intl.message(
      'Keep separate from onions, bananas, and other ethylene-producing items.',
      name: 'tips4',
      desc: '',
      args: [],
    );
  }

  /// `'\n-Our main aim is to create a mobile application for farmers and wholesalers to carry out trade without the intervention of Mandi system.''\n-The application will provide a just price estimation of the fruit ''products based on quality assurance checks performed on the image of the product.''\n-To provide a smooth experience, a chatbot guide to help the farmers and wholesalers understand the workings of the app. ''\n-Along with this, a chat section to enable the two parties to discuss trades in private.'`
  String get aim {
    return Intl.message(
      '\'\n-Our main aim is to create a mobile application for farmers and wholesalers to carry out trade without the intervention of Mandi system.\'\'\n-The application will provide a just price estimation of the fruit \'\'products based on quality assurance checks performed on the image of the product.\'\'\n-To provide a smooth experience, a chatbot guide to help the farmers and wholesalers understand the workings of the app. \'\'\n-Along with this, a chat section to enable the two parties to discuss trades in private.\'',
      name: 'aim',
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
      Locale.fromSubtags(languageCode: 'hi'),
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
