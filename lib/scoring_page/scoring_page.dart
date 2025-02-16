import 'dart:io';

import 'package:flutter/material.dart';

class ScoringPage extends StatefulWidget {
  const ScoringPage({super.key});

  @override
  State<ScoringPage> createState() => _ScoringPageState();
}

class _ScoringPageState extends State<ScoringPage> {

  String currentSelected = "H";

  @override
  Widget build(BuildContext context) {

    int reefButtonSize = 110;

    return Scaffold(
      body: Stack(
        children: [
          //Field Image
          Container(
            color: Color.fromRGBO(62, 62, 62, 1),
            child: Center(
              child: Image(
                image: AssetImage("assets/field_image.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          //Status

          Row(
            children: [
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.blue),
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(8),
                child: Text("Robo T-Birds 1672"),
              )
            ],
          ),



        ],
      )
    );
  }
}
