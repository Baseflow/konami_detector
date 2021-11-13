import 'package:konami_detector/konami_detector.dart';

import '../dialogs/show_device_info_dialog.dart';

class ShowDeviceInfoKonamiCode extends KonamiCode {
  ShowDeviceInfoKonamiCode()
      : super(
          codes: const [
            KonamiCodeInput.up,
            KonamiCodeInput.up,
            KonamiCodeInput.down,
            KonamiCodeInput.down,
            KonamiCodeInput.left,
            KonamiCodeInput.right,
          ],
          onMatch: showDeviceInfoDialog,
        );
}
