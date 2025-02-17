import 'package:flutter/material.dart';
import 'package:reefscape_scoring_robotbirds/button_state_manager.dart';

import '../comms/comms.dart';

class ScoringButton extends StatefulWidget {
  final ButtonStateManager buttonState;
  final String name;
  final Function() callback;
  final Map<String, List<double>> coords;
  final bool reef;
  final bool algae;
  final Comms comms;
  final Widget? customButtonChild;
  ScoringButton({super.key, required this.buttonState, required this.name, required this.callback, required this.coords, required this.reef, this.customButtonChild, this.algae = false, required this.comms});

  @override
  State<ScoringButton> createState() => _ScoringButtonState();
}

class _ScoringButtonState extends State<ScoringButton> {
  @override
  Widget build(BuildContext context) {
    Color color;
    if(widget.reef) {
      color = widget.buttonState.currentSide == widget.name ? Colors.green : Colors.white;
    }
    else if(widget.algae) {
      color = widget.buttonState.currentAlgae == int.parse(widget.name.replaceAll("A", "")) ? Colors.blue : Colors.white;
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
          else {
            widget.buttonState.currentLevel = int.parse(widget.name);

          }
          widget.comms.sendAllData();
          widget.callback();
        },
        backgroundColor: color,
        child: widget.customButtonChild ?? Text(widget.name == "A0" ? "P" : widget.reef || widget.algae ? widget.name : "L${widget.name}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
      ),
    );
  }
}
