import 'package:flutter/material.dart';

class AnimatedColorIcon extends ImplicitlyAnimatedWidget {

  final Widget icon;
  final double size;
  final Color color;

  const AnimatedColorIcon({
    Key? key,
    required this.color,
    required this.size,
    required this.icon,
    Curve curve = Curves.linear,
    required Duration duration,
    required VoidCallback onEnd,
  })  : super(key: key, curve: curve, duration: duration, onEnd: onEnd);


  @override
  _AnimatedContainerState createState() => _AnimatedContainerState();
}

class _AnimatedContainerState
    extends AnimatedWidgetBaseState<AnimatedColorIcon> {
    ColorTween _colorTween = ColorTween();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _colorTween = visitor(_colorTween, widget.color,
            (dynamic value) => ColorTween(begin: value as Color)) as ColorTween;
  }

  @override
  Widget build(BuildContext context) {
    return widget.icon;
  }
}
