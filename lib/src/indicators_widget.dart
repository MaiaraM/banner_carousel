import 'package:flutter/material.dart';

import 'indicator_animated_widget.dart';
import 'indicator_model.dart';

class CarouselIndicatorWidget extends StatelessWidget {
  final bool active;
  final bool animation;
  final Color color;
  final double dotBorderRadius;
  final IndicatorModel sizeIndicator;

  const CarouselIndicatorWidget({
    Key? key,
    this.active = false,
    this.animation = true,
    required this.color,
    this.dotBorderRadius = 8.0,
    required this.sizeIndicator,
  }) : super(key: key);

  bool get _doAnimation => active && animation;
  double get _width =>
      _doAnimation ? sizeIndicator.widthExpanded : sizeIndicator.width;
  double get _padding =>
      _doAnimation ? sizeIndicator.paddingExpanded : sizeIndicator.padding;
  double get _height =>
      _doAnimation ? sizeIndicator.heightExpanded : sizeIndicator.height;

  @override
  Widget build(BuildContext context) {
    return IndicatorAnimatedWidget(
        padding: _padding,
        width: _width,
        height: _height,
        color: color,
        dotBorderRadius: dotBorderRadius);
  }
}
