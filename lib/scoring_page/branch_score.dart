import 'package:flutter/material.dart';
import 'package:reefscape_scoring_robotbirds/scoring_page/scoring_button.dart';

import '../button_state_manager.dart';
import '../comms/comms.dart';

class BranchScoreWidget extends StatefulWidget {
  final ButtonStateManager buttonState;
  final Comms comms;

  const BranchScoreWidget(
      {super.key, required this.buttonState, required this.comms});

  @override
  State<BranchScoreWidget> createState() => _BranchScoreWidgetState();
}

class _BranchScoreWidgetState extends State<BranchScoreWidget> {
  @override
  Widget build(BuildContext context) {
    ButtonStateManager buttonState = widget.buttonState;

    Map<String, List<double>> coords = {
      //name top  left
      "1": [630, 70],
      "2": [500, 70],
      "3": [350, 70],
      "4": [140, 70],
      "A0": [570, 350],
      "A2": [430, 180],
      "A3": [250, 180],
    };
    return Stack(
      children: [
        Center(
          child: Image(
            image: AssetImage("assets/reef_branch_image.png"),
            fit: BoxFit.cover,
          ),
        ),
        ScoringButton(
          coords: coords,
          buttonState: buttonState,
          name: "1",
          reef: false,
          callback: () => setState(() {}),
          comms: widget.comms,
        ),
        ScoringButton(
          coords: coords,
          buttonState: buttonState,
          name: "2",
          reef: false,
          callback: () => setState(() {}),
          comms: widget.comms,
        ),

        ScoringButton(
            coords: coords,
            buttonState: buttonState,
            reef: false,
            name: "3",
            callback: () => setState(() {}),
            comms: widget.comms),

        ScoringButton(
            coords: coords,
            buttonState: buttonState,
            reef: false,
            name: "4",
            callback: () => setState(() {}),
            comms: widget.comms),

        //Algae
        ScoringButton(
            coords: coords,
            buttonState: buttonState,
            reef: false,
            algae: true,
            name: "A0",
            comms: widget.comms,
            callback: () => setState(() {})),
        ScoringButton(
          coords: coords,
          buttonState: buttonState,
          reef: false,
          algae: true,
          name: "A2",
          comms: widget.comms,
          callback: () => setState(() {}),
        ),
        //Algae
        ScoringButton(
          coords: coords,
          buttonState: buttonState,
          reef: false,
          algae: true,
          name: "A3",
          comms: widget.comms,
          callback: () => setState(() {}),
        ),
      ],
    );
  }
}
