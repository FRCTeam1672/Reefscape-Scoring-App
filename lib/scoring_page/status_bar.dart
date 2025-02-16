import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:reefscape_scoring_robotbirds/comms/comms_manager.dart';

class StatusBar extends StatefulWidget {
  final Color color1;
  final Color color2;
  final int duration;
  final CommsManager comms;
  const StatusBar({super.key, required this.color1, required this.color2, required this.duration, required this.comms});

  @override
  State<StatusBar> createState() => _StatusBarState();
}

class _StatusBarState extends State<StatusBar> {
  Color color = Colors.grey;

  @override
  void initState() {
    scheduleBackground();
    super.initState();
  }

  void scheduleBackground() async {
    Timer.periodic(
      Duration(milliseconds: widget.duration),
      (timer) {
        setState(() {
          if(widget.comms.isConnected) {
            color = Colors.green[900]!;
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
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: Colors.blue),
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Text(
                widget.comms.isConnected ? "CONNECTED" : "NO COMMS",
                style: TextStyle(
                    fontFamily: "BebasNeue", fontSize: 30, color: color),
              ),
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
}
