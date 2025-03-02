import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:reefscape_scoring_robotbirds/button_state_manager.dart';
import 'package:reefscape_scoring_robotbirds/comms/comms.dart';
import 'package:reefscape_scoring_robotbirds/comms/comms_manager.dart';
import 'package:reefscape_scoring_robotbirds/scoring_page/branch_score.dart';
import 'package:reefscape_scoring_robotbirds/scoring_page/coral_station.dart';
import 'package:reefscape_scoring_robotbirds/scoring_page/reef_score.dart';
import 'package:reefscape_scoring_robotbirds/scoring_page/scoring_button.dart';
import 'package:reefscape_scoring_robotbirds/scoring_page/status_bar.dart';

class ScoringPage extends StatefulWidget {
  const ScoringPage({super.key});

  @override
  State<ScoringPage> createState() => _ScoringPageState();
}

class _ScoringPageState extends State<ScoringPage> {
  ButtonStateManager buttonState = ButtonManager.stateManager;
  CommsManager comms = CommsManager();
  @override
  void initState() {
    // TODO: implement initState
    comms.setupComms();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        //Reef Widget
        Container(
          color: Color.fromRGBO(62, 62, 62, 1),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(15, 400, 0, 0),
                child: Transform.scale(
                  scale: 1,
                  child: FittedBox(child: CoralStation(buttonState: buttonState, comms: comms.comms, left: true, rebuildCallback: () => setState(() {}),)),
                  ),
              ),
            ),
            FittedBox(fit:BoxFit.scaleDown ,child: Padding(
              padding: EdgeInsets.fromLTRB(Platform.isWindows ? 30 : 250, 90, 0, 30),
              child: ReefScoringWidget(buttonState: buttonState, comms: comms.comms,),
            )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 200, 20, 15),
                child: FittedBox(
                  child: BranchScoreWidget(buttonState: buttonState, comms: comms.comms,),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 400, 15, 0),
                child: Transform.scale(
                  scale: 1,
                  child: FittedBox(
                    child: CoralStation(buttonState: buttonState, comms: comms.comms, left: false, rebuildCallback: () => setState(() {})),
                  ),
                ),
              ),
            ),

          ],
        ),
        //Status
        StatusBar(
          color1: Colors.red,
          color2: Colors.orange,
          duration: 250,
          comms: comms,
        ),
      ],
    ));
  }
}
