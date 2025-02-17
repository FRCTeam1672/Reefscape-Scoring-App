class ButtonStateManager{
  String _currentSide = "A";
  int _currentLevel = 1;
  int _currentAlgae = 2;


  String get currentSide {
    return _currentSide;
  }

  set currentSide(String current) {
    _currentSide = current;
  }

  int get currentLevel {
    return _currentLevel;
  }

  set currentLevel(int current) {
    print("Updated level.");
    _currentLevel = current;
  }

  int get currentAlgae {
    return _currentAlgae;
  }

  set currentAlgae(int current) {
    print("Updated algae.");
    _currentAlgae = current;
  }

}
class ButtonManager {
  static final ButtonStateManager _stateManager = ButtonStateManager();
  static ButtonStateManager get stateManager {
    return _stateManager;
  }
}