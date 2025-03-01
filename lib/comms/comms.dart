abstract class Comms {
  void init();

  bool isConnected();

  void sendData(String reef, int level, int coralStation, int algae);

  void sendAllData();

  String onDataReceive(Function() callback);

  CommsType getType();

  set rioUSB(bool manualLocalHost);

  bool get rioUSB;

  String get ipAddr;
}
enum CommsType {
  usb,
  nt4,
}