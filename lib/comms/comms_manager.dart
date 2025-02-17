import 'dart:io';

import 'package:reefscape_scoring_robotbirds/comms/comms.dart';
import 'package:reefscape_scoring_robotbirds/comms/nt4_comms.dart';
import 'package:reefscape_scoring_robotbirds/comms/usb_comms.dart';

class CommsManager {
  late Comms _comms;
  void setupComms() {
    if(Platform.isWindows) _comms = NT4Comms();
    if(Platform.isAndroid) _comms = USBComms();
    _comms.init();
  }

  Comms get comms {
    return _comms;
  }

}