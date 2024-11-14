import 'dart:async';

import 'package:database_task/feature/home.dart';
import 'package:database_task/feature/registeration.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class splashAnimatedScreen extends StatefulWidget {
  const splashAnimatedScreen({super.key});

  @override
  State<splashAnimatedScreen> createState() => _splashAnimatedScreenState();
}

class _splashAnimatedScreenState extends State<splashAnimatedScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(
          seconds: 4,
        ), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => registerationLogin ()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset('assets/Animation - 1730518661091.json'),
      ),
    );
  }
}
