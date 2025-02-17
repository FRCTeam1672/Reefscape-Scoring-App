import 'package:reefscape_scoring_robotbirds/comms/comms.dart';

class USBComms implements Comms{
  @override
  bool isConnected() {
    // TODO: implement isConnected
    throw UnimplementedError();
  }

  @override
  String onDataReceive(Function() callback) {
    // TODO: implement onDataReceive
    throw UnimplementedError();
  }

  @override
  void sendData(String reef, int level, int coralStation, int algae) {
    // TODO: implement sendData
  }

  @override
  CommsType getType() {
    return CommsType.usb;
  }

  @override
  void init() {
    // TODO: implement init
  }

  @override
  void sendAllData() {
    // TODO: implement sendAllData
  }

}