import 'package:reefscape_scoring_robotbirds/comms/comms.dart';

class USBComms implements Comms{

  @override
  bool isConnected() {
    return false;
  }

  @override
  String onDataReceive(Function() callback) {
    return "";
  }

  @override
  void sendData(String reef, int level, int coralStation, int algae) {

  }

  @override
  CommsType getType() {
    return CommsType.usb;
  }

  @override
  void init() {
  }


  @override
  void sendAllData() {

  }

  @override
  bool get rioUSB => false;

  @override
  set rioUSB(bool manualLocalHost) {
    // TODO: implement manualLocalHost
  }

  @override
  // TODO: implement ipAddr
  String get ipAddr => throw UnimplementedError();

}