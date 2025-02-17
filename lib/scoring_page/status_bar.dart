import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gradient_animation_text/flutter_gradient_animation_text.dart';
import 'package:reefscape_scoring_robotbirds/comms/comms_manager.dart';

class StatusBar extends StatefulWidget {
  final Color color1;
  final Color color2;
  final int duration;
  final CommsManager comms;

  const StatusBar(
      {super.key,
      required this.color1,
      required this.color2,
      required this.duration,
      required this.comms});

  @override
  State<StatusBar> createState() => _StatusBarState();
}

class _StatusBarState extends State<StatusBar>
    with SingleTickerProviderStateMixin {
  Color color = Colors.grey;

  @override
  @mustCallSuper
  void initState() {
    scheduleBackground();
    super.initState();
  }

  void scheduleBackground() async {
    Timer.periodic(
      Duration(milliseconds: widget.duration),
      (timer) {
        setState(() {
          if (widget.comms.comms.isConnected()) {
            // color = Color.fromRGBO(0, 255, 0, 1);
          } else {
            color = color == widget.color1 ? widget.color2 : widget.color1;
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: Colors.blue),
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Image.asset("assets/team_logo.png", scale: 7),
              Text(
                "Robo T-Birds 1672",
                style: TextStyle(fontFamily: "BebasNeue", fontSize: 36),
              ),
              SizedBox(
                width: 15,
              ),
              Image.asset(
                "assets/reefscape_logo.png",
                scale: 30,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                "Scoring System",
                style: TextStyle(fontFamily: "BebasNeue", fontSize: 36),
              ),
            ],
          ),
        ),
        getReconnectButton(),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: Colors.blue),
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              getConnectedText(),
              SizedBox(
                width: 50,
              ),
              Text(
                "Mode: ${Platform.isWindows ? "Windows (NT4)" : "USB"}",
                style: TextStyle(fontFamily: "BebasNeue", fontSize: 30),
              )
              // SizedBox(width: 15,),
            ],
          ),
        )
      ],
    );
  }

  Widget getReconnectButton() {
    if (widget.comms.comms.isConnected()) return const SizedBox.shrink();
    return FilledButton(
        onPressed: () {
          widget.comms.setupComms();
          setState(() {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                    "Attempted to reconnect by re-initializing comms. ${Platform.isWindows ? "\nReconnecting to NT4 on 10.16.72.2." : "Reopening USB Connection"}")));
          });
        },
        child: Text("Re-init Comms"));
  }

  Widget getConnectedText() {
    if (!widget.comms.comms.isConnected()) {
      return Text(
        "NO COMMS",
        style: TextStyle(fontFamily: "BebasNeue", fontSize: 30, color: color),
      );
    } else {
      return GradientAnimationText(
        text: Text(
          'CONNECTED',
          style: TextStyle(
              fontFamily: "BebasNeue", fontSize: 30
          ),
        ),
        colors: [
          Color(0xff8f00ff),  // violet
          Colors.green,
          Colors.yellow,
          Colors.orange,
          Colors.red,
        ],
        duration: Duration(milliseconds: 1000),
      );
    }
  }
}
