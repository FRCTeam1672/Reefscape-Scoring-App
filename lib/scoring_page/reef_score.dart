import 'package:flutter/material.dart';
import 'package:reefscape_scoring_robotbirds/button_state_manager.dart';
import 'package:reefscape_scoring_robotbirds/scoring_page/scoring_button.dart';

class ReefScoringWidget extends StatefulWidget {
  final ButtonStateManager buttonState;
  const ReefScoringWidget({super.key, required this.buttonState});

  @override
  State<ReefScoringWidget> createState() => _ReefScoringWidgetState();
}

class _ReefScoringWidgetState extends State<ReefScoringWidget> {
  @override
  Widget build(BuildContext context) {
    ButtonStateManager buttonState = widget.buttonState;

    //String - Name
    // List -> [top,left] - coordinates
    Map<String, List<double>> coords = {
      //name top  left
      "H": [80, 210],
      "G": [80, 340],

      "F": [150, 480],
      "E": [270, 545],

      "I": [150, 65],
      "J": [270, 0],

      "K": [420, 0],
      "L": [540, 65],

      "C": [420, 545],
      "D": [540, 480],

      "A": [600, 210],
      "B": [600, 340],
    };

    return Stack(
      children: [
        Center(
          child: Image(
            image: AssetImage("assets/field_image.png"),
            fit: BoxFit.cover,
          ),
        ),
        ScoringButton(
          coords: coords,
          buttonState: buttonState,
          name: "H",
          reef: true,
          callback: () => setState(() {}),
        ),
        ScoringButton(
          coords: coords,
          buttonState: buttonState,
          name: "G",
          reef: true,

          callback: () => setState(() {}),
        ),


        ScoringButton(
          coords: coords,
          buttonState: buttonState,
          reef: true,
          name: "F",
          callback: () => setState(() {}),
        ),
        ScoringButton(
          coords: coords,
          buttonState: buttonState,
          reef: true,
          name: "E",
          callback: () => setState(() {}),
        ),


        ScoringButton(
          coords: coords,
          buttonState: buttonState,
          reef: true,
          name: "I",
          callback: () => setState(() {}),
        ),
        ScoringButton(
          coords: coords,
          buttonState: buttonState,
          reef: true,
          name: "J",
          callback: () => setState(() {}),
        ),

        ScoringButton(
          coords: coords,
          buttonState: buttonState,
          reef: true,
          name: "K",
          callback: () => setState(() {}),
        ),
        ScoringButton(
          coords: coords,
          buttonState: buttonState,
          reef: true,
          name: "L",
          callback: () => setState(() {}),
        ),


        ScoringButton(
          coords: coords,
          buttonState: buttonState,
          reef: true,
          name: "C",
          callback: () => setState(() {}),
        ),
        ScoringButton(
          coords: coords,
          buttonState: buttonState,
          reef: true,
          name: "D",
          callback: () => setState(() {}),
        ),


        ScoringButton(
          coords: coords,
          buttonState: buttonState,
          reef: true,
          name: "A",
          callback: () => setState(() {}),
        ),
        ScoringButton(
          coords: coords,
          buttonState: buttonState,
          reef: true,
          name: "B",
          callback: () => setState(() {}),
        ),
      ],
    );
  }
}
