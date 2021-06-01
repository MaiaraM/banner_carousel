import 'package:flutter/material.dart';

@immutable
abstract class AbstractIndicatorContainer extends StatelessWidget {
  final bool active;

  final Widget child;

  const AbstractIndicatorContainer({
    Key? key,
    required this.child,
    required this.active,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => child;
}
