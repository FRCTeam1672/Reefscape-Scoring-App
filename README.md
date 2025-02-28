# Team 1672 REEFSCAPE Scoring App

The currently work in progress scoring app for our [2025-Robot](https://github.com/FRCTeam1672/Reefscape-Scoring-App), built using Flutter and NT4, designed to work on an external touchscreen monitor. 

Currently, only Windows based devices are supported, with Android tablet support being considered.
## App Usage

To build the application, ensure you have installed [Flutter for Windows](https://docs.flutter.dev/get-started/install/windows).

Then, change the ip in `lib/comms/nt4.dart` to your roboRIO ip.
```dart
void findRobotIP() {
    _robotAddress = _rioUSB ? "172.22.11.2" : "10.TE.AM.2";
  }
```

Then, simply run in the terminal `flutter build windows`. The compiled app will then publish to NT4 under the following topics:
* `/AppScoring/ReefSide`
* `/AppScoring/CoralLevel`
* `/AppScoring/AlgaeLevel`
* `/AppScoring/CoralStation` (unused in app)

Fetch these values using NT4 in your Robot program. They will be updated every 500ms.
