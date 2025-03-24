# Team 1672 REEFSCAPE Scoring App

![Reefscape Scoring App Example](/img/project.png)

The Reefscape Scoring App for our [2025-Robot](https://github.com/FRCTeam1672/2025-Robot), built using Flutter and NT4, designed to work on an external touchscreen monitor, and a winner of the FIRST Mid-Atlantic Innovation in Controls Awards. 

Currently, only Windows based devices are supported, with Android tablet support being considered.
## App Usage

To build the application, ensure you have installed [Flutter for Windows](https://docs.flutter.dev/get-started/install/windows).

Then, change the ip in `lib/comms/nt4.dart` to your roboRIO ip.
```dart
void findRobotIP() {
    _robotAddress = kDebugMode ? "127.0.0.1": _rioUSB ? "172.22.11.2" : "10.TE.AM.2";
  }
```
where `TE.AM` is your team's number. For example, 1672 would be `10.16.72.2`.

Then, simply run in the terminal `flutter build windows`. The compiled app will then be found in the following folder `build/windows/x64/runner/Release/` (make sure to have ALL the files in that folder, not just the .exe) be then publish to NT4 under the following topics:
* `/AppScoring/ReefSide`
* `/AppScoring/CoralLevel`
* `/AppScoring/AlgaeLevel`
* `/AppScoring/CoralStation`

Fetch these values using NT4 in your Robot program. They will be updated every 500ms.
