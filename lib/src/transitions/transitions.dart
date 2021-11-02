
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class ShakeTransition extends StatelessWidget {

  const ShakeTransition({
    Key? key,
    this.duration = const Duration(milliseconds: 900),
    this.offset = 140.0,
    this.child,
    this.axis = Axis.horizontal,
  }) : super(key: key);

  final Widget? child;
  final Duration duration;
  final double offset;
  final Axis axis;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      child: child,
      duration: duration,
      curve: Curves.easeOutQuint,
      tween: Tween(begin: 1.0, end: 0.0),
      builder: (context, value, child) {
        return Transform.translate(
          offset: axis == Axis.horizontal
              ? Offset(value * offset, 0.0)
              : Offset(0.0,value * offset),
          child: child,
        );
      },
    );
  }
}

enum _AniProps { opacity, translateX }

class FadeTransition extends StatelessWidget {

  FadeTransition({
    required this.child,
    this.duration = const Duration(milliseconds: 900),
    this.axis = Axis.horizontal,
  });

  final Duration duration;
  final Widget child;
  final Axis axis;

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<_AniProps>()
      ..add(_AniProps.opacity, Tween(begin: 0.0, end: 1.0))
      ..add(
        _AniProps.translateX,
        Tween(begin: 30.0, end: 0.0),
        Duration(milliseconds: 200),
        // Curves.fastOutSlowIn,
        Curves.bounceOut,
      );

    return PlayAnimation<MultiTweenValues<_AniProps>>(
      delay: duration,
      duration: duration,
      tween: tween,
      child: child,
      // curve: ,
      builder: (context, child, value) => Opacity(
        opacity: value.get(_AniProps.opacity),
        child: Transform.translate(
          offset: axis == Axis.horizontal
              ? Offset(value.get(_AniProps.translateX), 0)
              : Offset(0, value.get(_AniProps.translateX)),
          child: child,
        ),
      ),
    );
  }
}