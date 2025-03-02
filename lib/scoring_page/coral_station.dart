import 'package:flutter/material.dart';
import 'package:reefscape_scoring_robotbirds/scoring_page/scoring_button.dart';

import '../button_state_manager.dart';
import '../comms/comms.dart';

class CoralStation extends StatefulWidget {
  final ButtonStateManager buttonState;
  final Comms comms;
  final bool left;
  final Function rebuildCallback;
  const CoralStation({super.key, required this.buttonState, required this.comms, required this.left, required this.rebuildCallback});

  @override
  State<CoralStation> createState() => _CoralStationState();
}

class _CoralStationState extends State<CoralStation> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    ButtonStateManager buttonState = widget.buttonState;

    Map<String, List<double>> coords = {
      //name top  left
      "1": [50, 120],
      "2": [160, 200],
      "3": [280, 260],
      "4": [270, 40],
      "5": [150, 120],
      "6": [30, 200],
    };

    if(widget.left) {
      return Stack(
        children: [
          Center(
            child: Image(
              image: AssetImage("assets/coral_station_left.png"),
              fit: BoxFit.cover,
            ),
          ),
          ReefscapeButton(
              coords: coords,
              buttonState: buttonState,
              reef: false,

              coralStation: true,
              name: "1",
              comms: widget.comms,
              callback: () => setState(() {widget.rebuildCallback();})),
          ReefscapeButton(
            coords: coords,
            buttonState: buttonState,
            reef: false,
            algae: false,
            coralStation: true,
            name: "2",
            comms: widget.comms,
            callback: () => setState(() {widget.rebuildCallback();}),
          ),
          ReefscapeButton(
            coords: coords,
            buttonState: buttonState,
            reef: false,
            algae: false,
            coralStation: true,
            name: "3",
            comms: widget.comms,
            callback: () => setState(() {widget.rebuildCallback();}),
          ),
        ],
      );
    }
    else {
      return Stack(
        children: [
          Center(
            child: Image(
              image: AssetImage("assets/coral_station_right.png"),
              fit: BoxFit.cover,
            ),
          ),
          ReefscapeButton(
              coords: coords,
              buttonState: buttonState,
              reef: false,

              coralStation: true,
              name: "4",
              comms: widget.comms,
              callback: () => setState(() {widget.rebuildCallback();})),
          ReefscapeButton(
              coords: coords,
              buttonState: buttonState,
              reef: false,
              algae: false,
              coralStation: true,
              name: "5",
              comms: widget.comms,
            callback: () => setState(() {widget.rebuildCallback();}),
          ),
          ReefscapeButton(
            coords: coords,
            buttonState: buttonState,
            reef: false,
            algae: false,
            coralStation: true,
            name: "6",
            comms: widget.comms,
            callback: () => setState(() {widget.rebuildCallback();}),
          ),
        ],
      );
    }


  }
}
