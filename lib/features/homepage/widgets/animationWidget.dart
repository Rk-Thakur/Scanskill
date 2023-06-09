import 'package:flutter/material.dart';

class OverlayAnimation extends StatefulWidget {
  const OverlayAnimation({Key? key}) : super(key: key);

  @override
  State<OverlayAnimation> createState() => _OverlayAnimationState();
}

class _OverlayAnimationState extends State<OverlayAnimation>
    with TickerProviderStateMixin {
  AnimationController? animation;
  Animation<double>? _fadeInFadeOut;
  @override
  void initState() {
    super.initState();
    animation = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _fadeInFadeOut = Tween<double>(begin: 0.0, end: 0.5).animate(animation!);

    animation!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animation!.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animation!.forward();
      }
    });
    animation!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: FadeTransition(
            opacity: _fadeInFadeOut!,
            child: Container(
              color: Colors.green,
              width: 100,
              height: 100,
            ),
          ),
        ),
      ),
    );
  }
}
