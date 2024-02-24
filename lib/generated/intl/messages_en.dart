// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(year) =>
      "Craft by @Juliotati | ${year} © All rights reserved";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "craftedByAndAllRightsReserved": m0,
        "longBio": MessageLookupByLibrary.simpleMessage(
            "I’m someone who embraces change, advocates for the long term, loves to have things in order but when things are not in order, I devote myself into ferociously (with care), cleaning up before proceeding, and I’m proactively learning and refining skills.\nSolving problems and learning how to learn is one of the things I appreciate and value the most.\n\nFrom a very young age I have always been driven by self-motivation and work ethic beyond what people would expect, and this to me has become an embedded habit/behavior when I want, have, or need to get something done, which has always set me apart from many in the eyes of those that have watched me."),
        "longBioTitle": MessageLookupByLibrary.simpleMessage("A little more"),
        "myName": MessageLookupByLibrary.simpleMessage("Júlio Tati"),
        "shortBio": MessageLookupByLibrary.simpleMessage(
            "Júlio Tati\'s a curious being interested in the human mind. As for what he spends his on, he helps translate and transform ideas to usable products in form of well engineered software."),
        "shortBioCaption": MessageLookupByLibrary.simpleMessage(
            "Currently based in Portugal and specializing in mobile development with Dart / Flutter. Advocating for the long term, proactively learning and refining skills."),
        "shortBioGreeting": MessageLookupByLibrary.simpleMessage("Hi there!"),
        "shortBioWho": MessageLookupByLibrary.simpleMessage("I\'m Júlio,")
      };
}
