import 'dart:async';

import 'package:flutter/material.dart';

import '../widget/animation_builder.dart';
import 'dashboard.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> with TickerProviderStateMixin {
  ImageProvider preloadImage = const AssetImage('lib/assets/launcher_icon.png');
  late AnimationController animationController;

  @override
  void initState() {
    _startTime();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  _startTime() async {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
    var duration = const Duration(seconds: 4);
    return Timer(duration, routeDashboardMain);
  }

  routeDashboardMain() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Dashboard()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimationBuilderWidget(
                  animationController: animationController,
                  child: Image(
                    image: preloadImage,
                    height: 300,
                    width: 300,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
