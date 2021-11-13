import 'package:flutter_swipe_detector/flutter_swipe_detector.dart';

/// The direction in which the user swiped.
enum KonamiCodeInput {
  up,
  down,
  left,
  right,
}

/// The [SwipeDirection] extensions
extension SwipeDirectionX on SwipeDirection {
  KonamiCodeInput toKonamiCodeInput() {
    switch (this) {
      case SwipeDirection.up:
        return KonamiCodeInput.up;
      case SwipeDirection.down:
        return KonamiCodeInput.down;
      case SwipeDirection.left:
        return KonamiCodeInput.left;
      case SwipeDirection.right:
        return KonamiCodeInput.right;
      default:
        throw Exception('Unknown swipe direction: $this');
    }
  }
}
