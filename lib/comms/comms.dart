abstract class Comms {
  bool isConnected();
  void sendData(String reef, int level, int coralStation);
  String onDataReceive(Function() callback);
  CommsType getType();
}
enum CommsType {
  usb,
  tcp,
}