import 'package:konami_detector/konami_detector.dart';

class TestCrashKonamiCode extends KonamiCode {
  TestCrashKonamiCode()
      : super(
          codes: const [
            KonamiCodeInput.up,
            KonamiCodeInput.up,
            KonamiCodeInput.down,
            KonamiCodeInput.down,
            KonamiCodeInput.up,
            KonamiCodeInput.up,
            KonamiCodeInput.down,
            KonamiCodeInput.down,
          ],
          onMatch: (_) {
            throw Exception('Test crash');
          },
        );
}
