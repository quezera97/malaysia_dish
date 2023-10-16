import 'dart:math';

import 'package:flutter/material.dart';

class AnimationBuilderWidget extends StatelessWidget {
  final AnimationController animationController;
  final Widget child;

  const AnimationBuilderWidget({
    super.key,
    required this.animationController,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Transform.rotate(
          angle: animationController.value * 2 * pi,
          child: child,
        );
      },
      child: child,
    );
  }
}
