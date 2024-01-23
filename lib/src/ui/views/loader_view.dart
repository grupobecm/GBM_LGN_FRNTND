import 'package:flutter/material.dart';
import 'dart:math' as math;

class LoaderView extends StatefulWidget {
  const LoaderView({super.key});

  @override
  State<LoaderView> createState() => _SplashLayoutState();
}

class _SplashLayoutState extends State<LoaderView> with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animationController.forward();
    _animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
     _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            final double angle = _animationController.value * 2.0 * math.pi;
            final transform = Matrix4.rotationY(angle);
            return Transform(
              transform: transform,
              alignment: Alignment.center,
              child: Image.asset(
                'assets/icons/logo.png',
              ),
            );
          },
        ),
      ),
    );
  }
}
