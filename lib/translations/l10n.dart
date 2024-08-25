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

  /// `Create`
  String get actionableCreate {
    return Intl.message(
      'Create',
      name: 'actionableCreate',
      desc: '',
      args: [],
    );
  }

  /// `Create with your imagination`
  String get actionableCreateDescription {
    return Intl.message(
      'Create with your imagination',
      name: 'actionableCreateDescription',
      desc: '',
      args: [],
    );
  }

  /// `Discover`
  String get actionableDiscover {
    return Intl.message(
      'Discover',
      name: 'actionableDiscover',
      desc: '',
      args: [],
    );
  }

  /// `Discover new paths`
  String get actionableDiscoverDescription {
    return Intl.message(
      'Discover new paths',
      name: 'actionableDiscoverDescription',
      desc: '',
      args: [],
    );
  }

  /// `Explore`
  String get actionableExplore {
    return Intl.message(
      'Explore',
      name: 'actionableExplore',
      desc: '',
      args: [],
    );
  }

  /// `Explore The world and its wonders`
  String get actionableExploreDescription {
    return Intl.message(
      'Explore The world and its wonders',
      name: 'actionableExploreDescription',
      desc: '',
      args: [],
    );
  }

  /// `Learn`
  String get actionableLearn {
    return Intl.message(
      'Learn',
      name: 'actionableLearn',
      desc: '',
      args: [],
    );
  }

  /// `Learn as you know not all`
  String get actionableLearnDescription {
    return Intl.message(
      'Learn as you know not all',
      name: 'actionableLearnDescription',
      desc: '',
      args: [],
    );
  }

  /// `Master`
  String get actionableMaster {
    return Intl.message(
      'Master',
      name: 'actionableMaster',
      desc: '',
      args: [],
    );
  }

  /// `Master your own craft`
  String get actionableMasterDescription {
    return Intl.message(
      'Master your own craft',
      name: 'actionableMasterDescription',
      desc: '',
      args: [],
    );
  }

  /// `Tune`
  String get actionableTune {
    return Intl.message(
      'Tune',
      name: 'actionableTune',
      desc: '',
      args: [],
    );
  }

  /// `Tune your craft`
  String get actionableTuneDescription {
    return Intl.message(
      'Tune your craft',
      name: 'actionableTuneDescription',
      desc: '',
      args: [],
    );
  }

  /// `Dart Shooter 🎯`
  String get bioDartShooter {
    return Intl.message(
      'Dart Shooter 🎯',
      name: 'bioDartShooter',
      desc: '',
      args: [],
    );
  }

  /// `Joy Machine 😎`
  String get bioJoyMachine {
    return Intl.message(
      'Joy Machine 😎',
      name: 'bioJoyMachine',
      desc: '',
      args: [],
    );
  }

  /// `LOUD introvert 🗿`
  String get bioLoudIntrovert {
    return Intl.message(
      'LOUD introvert 🗿',
      name: 'bioLoudIntrovert',
      desc: '',
      args: [],
    );
  }

  /// `Matrix BURNER 🔥`
  String get bioMatrixBurner {
    return Intl.message(
      'Matrix BURNER 🔥',
      name: 'bioMatrixBurner',
      desc: '',
      args: [],
    );
  }

  /// `OTAKU Overlord 🤫`
  String get bioOtakuOverlord {
    return Intl.message(
      'OTAKU Overlord 🤫',
      name: 'bioOtakuOverlord',
      desc: '',
      args: [],
    );
  }

  /// `Software Craftsman ⚒️`
  String get bioSoftwareCraftsman {
    return Intl.message(
      'Software Craftsman ⚒️',
      name: 'bioSoftwareCraftsman',
      desc: '',
      args: [],
    );
  }

  /// `Storyteller 📚`
  String get bioStoryteller {
    return Intl.message(
      'Storyteller 📚',
      name: 'bioStoryteller',
      desc: '',
      args: [],
    );
  }

  /// `WEEB Master 🍱`
  String get bioWeebMaster {
    return Intl.message(
      'WEEB Master 🍱',
      name: 'bioWeebMaster',
      desc: '',
      args: [],
    );
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

  /// `I'm > my name`
  String get imGreaterThanMyName {
    return Intl.message(
      'I\'m > my name',
      name: 'imGreaterThanMyName',
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

  /// `My Motto`
  String get myMotto {
    return Intl.message(
      'My Motto',
      name: 'myMotto',
      desc: '',
      args: [],
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

  /// `Júlio Tati's a curious being interested in the human mind. As for what he spends his on, he helps translate and transform ideas to usable products in form of well engineered software.`
  String get shortBio {
    return Intl.message(
      'Júlio Tati\'s a curious being interested in the human mind. As for what he spends his on, he helps translate and transform ideas to usable products in form of well engineered software.',
      name: 'shortBio',
      desc: '',
      args: [],
    );
  }

  /// `TL;DR`
  String get tldr {
    return Intl.message(
      'TL;DR',
      name: 'tldr',
      desc: '',
      args: [],
    );
  }

  /// `Changing how the world moves through Software Craftsmanship for BMW BIMMERS at Critical TechWorks as a Rockstar Developer (Mobile Software Engineer) in Portugal Lisbon.`
  String get tldrCaption {
    return Intl.message(
      'Changing how the world moves through Software Craftsmanship for BMW BIMMERS at Critical TechWorks as a Rockstar Developer (Mobile Software Engineer) in Portugal Lisbon.',
      name: 'tldrCaption',
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
