import 'package:flutter/material.dart';

class GradientIconMask extends StatelessWidget {
  const GradientIconMask({
    super.key,
    required this.icon,
    required this.colors,
  });
  final Widget icon;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => RadialGradient(
        center: Alignment.bottomCenter,
        radius: 0.5,
        colors: colors,
        tileMode: TileMode.clamp,
        
      ).createShader(bounds),
      child: icon,
    );
  }
}
