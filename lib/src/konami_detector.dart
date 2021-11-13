import 'package:flutter/material.dart';
import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';

import '../konami_detector.dart';

/// A [SwipeDetector] that detects provided [KonamiCode]
class KonamiDetector extends StatefulWidget {
  const KonamiDetector({
    Key? key,
    required this.child,
    required this.codes,
  }) : super(key: key);

  /// The child widget
  final Widget child;

  /// A list of [KonamiCode]s to detect and handle
  final List<KonamiCode> codes;

  @override
  _KonamiDetectorState createState() => _KonamiDetectorState();
}

class _KonamiDetectorState extends State<KonamiDetector> {
  _KonamiDetectorState() : _inputHistory = [];

  final List<KonamiCodeInput> _inputHistory;

  @override
  Widget build(
    BuildContext context,
  ) {
    if (widget.codes.isEmpty) {
      return widget.child;
    }
    return SwipeDetector(
      child: widget.child,
      onSwipe: (direction) async {
        final input = direction.toKonamiCodeInput();
        _inputHistory.add(input);
        for (final code in widget.codes) {
          final executed = await code.validate(
            context,
            inputHistory: _inputHistory,
          );
          if (executed) {
            _inputHistory.clear();
            break;
          }
        }
      },
    );
  }
}
