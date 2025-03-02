import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:nt4/nt4.dart';
import 'package:reefscape_scoring_robotbirds/button_state_manager.dart';
import 'package:reefscape_scoring_robotbirds/comms/comms.dart';

class NT4Comms implements Comms {
  late NT4Client _client;

  late StreamIterator iterator;

  late NT4Topic _reefSidePub;

  late NT4Topic _coralLevelPub;
  late NT4Topic _algaeLevelPub;
  late NT4Topic _coralStationPub;


  String _currentSide = "A";
  int _currentLevel = 1;
  int _currentAlgae = 2;
  int _currentStation = 1;

  bool _connected = false;

  bool _rioUSB = false;
  late String _robotAddress;
  NT4Comms() {
    findRobotIP();
  }

  @override
  void init() {
    print('"Initalizing NT4"');
    _client = NT4Client(
      serverBaseAddress: _robotAddress,
      onConnect: () {
        print('"Connected to the Robot.');
        Future.delayed(const Duration(milliseconds: 200), () => sendAllData());
        _connected = true;
      },
      onDisconnect: () => _connected = false,
    );

    _reefSidePub = _client.publishNewTopic(
        '/AppScoring/ReefSide', NT4TypeStr.typeStr);

    _client.setProperties(_reefSidePub, false, true);

    _coralLevelPub = _client.publishNewTopic(
        '/AppScoring/CoralLevel', NT4TypeStr.typeInt);

    _client.setProperties(_coralLevelPub, false, true);

    _algaeLevelPub = _client.publishNewTopic(
        '/AppScoring/AlgaeLevel', NT4TypeStr.typeInt);

    _client.setProperties(_algaeLevelPub, false, true);
    _coralStationPub = _client.publishNewTopic(
        '/AppScoring/CoralStation', NT4TypeStr.typeInt);

    _client.setProperties(_coralStationPub, false, true);

    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (_connected) {
        sendAllData();
      }
    });
    iterator = StreamIterator(connectionStatus());
  }

  Stream<bool> connectionStatus() {
    return _client.connectionStatusStream().asBroadcastStream();
  }

  @override
  bool isConnected() {
    return _connected;
  }

  @override
  String onDataReceive(Function() callback) {
    // TODO: implement onDataReceive
    throw UnimplementedError();
  }

  @override
  void sendAllData() {
    sendData(ButtonManager.stateManager.currentSide, ButtonManager.stateManager.currentLevel, ButtonManager.stateManager.currentStation, ButtonManager.stateManager.currentAlgae);
  }

  @override
  void sendData(String reef, int level, int coralStation, int algae) {
    _currentSide = reef;
    _currentLevel = level;
    _currentAlgae = algae;
    _currentStation = coralStation;

    _client.addSample(_reefSidePub, reef);
    _client.addSample(_coralLevelPub, level);
    _client.addSample(_coralStationPub, coralStation);
    _client.addSample(_algaeLevelPub, algae);

  }

  @override
  CommsType getType() {
    return CommsType.nt4;
  }

  @override
  set rioUSB(bool rioUSB) {
    _rioUSB = rioUSB;
    findRobotIP();
    _client.setServerBaseAddress(_robotAddress);
    print('"Updated Robot IP to $_robotAddress');
  }

  void findRobotIP() {
    _robotAddress = kDebugMode ? "127.0.0.1": _rioUSB ? "172.22.11.2" : "10.16.72.2";
  }

  @override
  bool get rioUSB => _rioUSB;

  @override
  String get ipAddr => _robotAddress;

}