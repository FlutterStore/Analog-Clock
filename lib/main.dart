import 'dart:async';

import 'package:flutter/material.dart';
import 'package:analog_clock/analog_clock.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      print(timer.tick);
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Analong Clock",style: TextStyle(fontSize: 15),),
      ),
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.white),
          child: SafeArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                darkClock,
              ],
            ),
          ),
        ),
      );
  }

  Widget get darkClock {
    return AnalogClock.dark(
      width: 250.0,
      datetime: DateTime.now(),
      key: const GlobalObjectKey(2),
      decoration:
      const BoxDecoration(color: Colors.black, shape: BoxShape.circle));
  }
}
