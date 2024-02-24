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

class AppLocal {
  AppLocal();

  static AppLocal? _current;

  static AppLocal get current {
    assert(_current != null,
        'No instance of AppLocal was loaded. Try to initialize the AppLocal delegate before accessing AppLocal.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocal> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocal();
      AppLocal._current = instance;

      return instance;
    });
  }

  static AppLocal of(BuildContext context) {
    final instance = AppLocal.maybeOf(context);
    assert(instance != null,
        'No instance of AppLocal present in the widget tree. Did you add AppLocal.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocal? maybeOf(BuildContext context) {
    return Localizations.of<AppLocal>(context, AppLocal);
  }

  /// `Craft by @Juliotati | {year} © All rights reserved`
  String craftedByAndAllRightsReserved(Object year) {
    return Intl.message(
      'Craft by @Juliotati | $year © All rights reserved',
      name: 'craftedByAndAllRightsReserved',
      desc: '',
      args: [year],
    );
  }

  /// `Júlio Tati`
  String get myName {
    return Intl.message(
      'Júlio Tati',
      name: 'myName',
      desc: '',
      args: [],
    );
  }

  /// `A little more`
  String get longBioTitle {
    return Intl.message(
      'A little more',
      name: 'longBioTitle',
      desc: '',
      args: [],
    );
  }

  /// `I’m someone who embraces change, advocates for the long term, loves to have things in order but when things are not in order, I devote myself into ferociously (with care), cleaning up before proceeding, and I’m proactively learning and refining skills.\nSolving problems and learning how to learn is one of the things I appreciate and value the most.\n\nFrom a very young age I have always been driven by self-motivation and work ethic beyond what people would expect, and this to me has become an embedded habit/behavior when I want, have, or need to get something done, which has always set me apart from many in the eyes of those that have watched me.`
  String get longBio {
    return Intl.message(
      'I’m someone who embraces change, advocates for the long term, loves to have things in order but when things are not in order, I devote myself into ferociously (with care), cleaning up before proceeding, and I’m proactively learning and refining skills.\nSolving problems and learning how to learn is one of the things I appreciate and value the most.\n\nFrom a very young age I have always been driven by self-motivation and work ethic beyond what people would expect, and this to me has become an embedded habit/behavior when I want, have, or need to get something done, which has always set me apart from many in the eyes of those that have watched me.',
      name: 'longBio',
      desc: '',
      args: [],
    );
  }

  /// `Hi there!`
  String get shortBioGreeting {
    return Intl.message(
      'Hi there!',
      name: 'shortBioGreeting',
      desc: '',
      args: [],
    );
  }

  /// `I'm Júlio,`
  String get shortBioWho {
    return Intl.message(
      'I\'m Júlio,',
      name: 'shortBioWho',
      desc: '',
      args: [],
    );
  }

  /// `Currently based in Portugal and specializing in mobile development with Dart / Flutter. Advocating for the long term, proactively learning and refining skills.`
  String get shortBioCaption {
    return Intl.message(
      'Currently based in Portugal and specializing in mobile development with Dart / Flutter. Advocating for the long term, proactively learning and refining skills.',
      name: 'shortBioCaption',
      desc: '',
      args: [],
    );
  }

  /// `Júlio Tati's a curious being interested in the human mind. As for what he spends his on, he helps translate and transform ideas to usable products in form of well engineered software.`
  String get shortBio {
    return Intl.message(
      'Júlio Tati\'s a curious being interested in the human mind. As for what he spends his on, he helps translate and transform ideas to usable products in form of well engineered software.',
      name: 'shortBio',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocal> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'pt'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocal> load(Locale locale) => AppLocal.load(locale);
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
