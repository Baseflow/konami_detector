import 'dart:async';

import 'package:flutter/material.dart';

import '../konami_detector.dart';

/// A [KonamiCode] which contains a code and a callback.
class KonamiCode {
  const KonamiCode({
    required this.codes,
    required this.onMatch,
  });

  /// The code to match.
  final List<KonamiCodeInput> codes;

  /// The callback to call when the code is matched.
  final FutureOr<void> Function(BuildContext context) onMatch;

  /// Matches the code and executes the callback if code is a match.
  Future<bool> validate(
    BuildContext context, {
    required List<KonamiCodeInput> inputHistory,
  }) async {
    if (inputHistory.length < codes.length) {
      return false;
    }
    for (int index = 0; index < codes.length; index++) {
      final code = codes[index];
      final historyIndex = inputHistory.length - codes.length + index;
      final swipe = inputHistory[historyIndex];
      if (code != swipe) {
        return false;
      }
    }
    await onMatch(context);
    return true;
  }
}
