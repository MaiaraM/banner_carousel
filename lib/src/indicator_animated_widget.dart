import 'package:flutter/material.dart';

class IndicatorAnimatedWidget extends StatelessWidget {
  const IndicatorAnimatedWidget({
    Key? key,
    required double padding,
    required double width,
    required double height,
    required Color color,
    required this.dotBorderRadius,
  })   : _padding = padding,
        _width = width,
        _height = height,
        _color = color,
        super(key: key);

  final double _padding;
  final double _width;
  final double _height;
  final Color _color;
  final double dotBorderRadius;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.symmetric(horizontal: _padding),
      width: _width,
      height: _height,
      decoration: BoxDecoration(
        color: _color,
        borderRadius: BorderRadius.circular(dotBorderRadius),
      ),
      duration: Duration(milliseconds: 800),
      curve: Curves.fastOutSlowIn,
    );
  }
}
