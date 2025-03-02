import 'package:flutter/material.dart';
import 'package:reefscape_scoring_robotbirds/button_state_manager.dart';

import '../comms/comms.dart';

class ReefscapeButton extends StatefulWidget {
  final ButtonStateManager buttonState;
  final String name;
  final Function() callback;
  final Map<String, List<double>> coords;
  final bool reef;
  final bool algae;
  final bool coralStation;
  final Comms comms;
  final Widget? customButtonChild;
  const ReefscapeButton({super.key, required this.buttonState, required this.name, required this.callback, required this.coords, required this.reef, this.customButtonChild, this.algae = false, required this.comms, this.coralStation = false});

  @override
  State<ReefscapeButton> createState() => _ReefscapeButtonState();
}

class _ReefscapeButtonState extends State<ReefscapeButton> {
  @override
  Widget build(BuildContext context) {
    Color color;
    if(widget.reef) {
      color = widget.buttonState.currentSide == widget.name ? Colors.green : Colors.white;
    }
    else if(widget.algae) {
      color = widget.buttonState.currentAlgae == int.parse(widget.name.replaceAll("A", "")) ? Colors.blue : Colors.white;
    }
    else if(widget.coralStation) {
      color = widget.buttonState.currentStation == int.parse(widget.name) ? Colors.purpleAccent : Colors.white;
    }
    else {
      color = widget.buttonState.currentLevel == int.parse(widget.name) ? Colors.green : Colors.white;
    }

    return Positioned(
      top:  widget.coords[widget.name]![0],
      left: widget.coords[widget.name]![1],
      child: FloatingActionButton.large(
        onPressed: () {
          if(widget.reef) {
            widget.buttonState.currentSide = widget.name;
          }
          else if(widget.algae) {
            widget.buttonState.currentAlgae = int.parse(widget.name.replaceAll("A", ""));
          }
          else if(widget.coralStation) {
            widget.buttonState.currentStation = int.parse(widget.name);
          }
          else {
            widget.buttonState.currentLevel = int.parse(widget.name);

          }
          widget.comms.sendAllData();
          widget.callback();
        },
        backgroundColor: color,
        child: widget.customButtonChild ?? Text(widget.name == "A0" ? "P" : widget.reef || widget.algae ? widget.name : widget.coralStation ? "S${widget.name}" : "L${widget.name}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
      ),
    );
  }
}
