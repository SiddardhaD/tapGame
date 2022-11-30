import 'dart:async';

import "package:flutter/material.dart";

import '../images/baby.dart';
import 'barriers.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static double _birdYAxis = 1;
  double time = 0;
  double height = 0;
  double initialHeight = _birdYAxis;
  bool isGameStarted = false;
  bool isTapped = false;
  static double barrierOneXaxis = 1;
  double barrierTwoXaxis = barrierOneXaxis + 1.5;

  void jump() {
    setState(() {
      // debugPrint("Clearing the time and intialHeight");
      time = 0;
      initialHeight = _birdYAxis;
    });
  }

  void startGame() {
    isGameStarted = true;
    // debugPrint("isStarted = $isGameStarted");
    Timer.periodic(Duration(milliseconds: 60), (timer) {
      time += 0.05;
      height = -4.9 * time * time + 2.8 * time;
      setState(() {
        barrierOneXaxis -= 0.1;
        barrierTwoXaxis -= 0.1;
        _birdYAxis = initialHeight - height;
      });
      setState(() {
        if (barrierOneXaxis < -1.1) {
          barrierOneXaxis += 2.2;
        } else {
          barrierOneXaxis -= 0.05;
        }
        setState(() {
          if (barrierTwoXaxis < -1.1) {
            barrierTwoXaxis += 2.2;
          } else {
            barrierOneXaxis -= 0.05;
          }
        });
        if (_birdYAxis > 0.9) {
          timer.cancel();
          setState(() {
            isGameStarted = false;
          });
          jump();
          // debugPrint("isStarted = $isGameStarted");
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
            flex: 3,
            child: Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    debugPrint("Height is $_birdYAxis");
                    isTapped = true;
                    if (isGameStarted) {
                      jump();
                    } else {
                      startGame();
                    }
                  },
                  child: AnimatedContainer(
                    alignment: Alignment(0, _birdYAxis),
                    duration: Duration(milliseconds: 0),
                    color: Colors.blue,
                    child: _birdYAxis < 1 ? BabyImage() : BabyCryImage(),
                  ),
                ),
                isTapped == false
                    ? Container(
                        alignment: Alignment(0, -0.5),
                        child: Text(
                          "T a p   t o   P l a y ",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    : Container(),
                AnimatedContainer(
                  alignment: Alignment(barrierOneXaxis, 1.1),
                  duration: Duration(milliseconds: 5),
                  child: Container(
                    height: 50,
                    width: 20,
                    color: Colors.amber,
                  ),
                ),
                // AnimatedContainer(
                //   alignment: Alignment(barrierOneXaxis, -1.1),
                //   duration: Duration(milliseconds: 5),
                //   child: Container(
                //     height: 250,
                //     width: 50,
                //     color: Colors.amber,
                //   ),
                // ),
                // AnimatedContainer(
                //   alignment: Alignment(barrierTwoXaxis, -1.1),
                //   duration: Duration(milliseconds: 5),
                //   child: Container(
                //     height: 200,
                //     width: 50,
                //     color: Colors.amber,
                //   ),
                // ),
                AnimatedContainer(
                  alignment: Alignment(barrierTwoXaxis, 1.1),
                  duration: Duration(milliseconds: 5),
                  child: Container(
                    height: 70,
                    width: 30,
                    color: Colors.amber,
                  ),
                ),
              ],
            )),
        Container(
          color: Colors.green,
          height: 10,
        ),
        Expanded(
            child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.brown,
          child: const Center(
              child: Text(
            "Make Dragon Fly",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          )),
        ))
      ]),
    );
  }
}
