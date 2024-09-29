import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart'; // Asegúrate de tener la versión correcta

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MovieTween()
      ..tween(
        'opacity',
        Tween(begin: 0.0, end: 1.0),
        duration: Duration(milliseconds: 100),
      )
      ..tween(
        'translateY',
        Tween(begin: -30.0, end: 0.0),
        duration: Duration(milliseconds: 100),
        curve: Curves.easeOut,
      );

    return PlayAnimationBuilder<Movie>(
      tween: tween,
      duration: tween.duration,
      delay: Duration(milliseconds: (400 * delay).round()),
      builder: (context, value, child) {
        return Opacity(
          opacity: value.get('opacity'),
          child: Transform.translate(
            offset: Offset(0, value.get('translateY')),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
