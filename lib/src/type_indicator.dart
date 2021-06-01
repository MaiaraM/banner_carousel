class TypeIndicator {
  final double _width;
  final double _widthExpanded;
  final double _height;
  final double _heightExpanded;
  final double _padding;
  final double _paddingExpanded;

  const TypeIndicator({
    required double width,
    required double height,
    required double padding,
  })   : _height = height,
        _width = width,
        _widthExpanded = width,
        _heightExpanded = height,
        _paddingExpanded = padding,
        _padding = padding;

  const TypeIndicator.animation({
    required double width,
    double? widthExpanded,
    required double height,
    double? heightExpanded,
    required double spaceBetween,
    double? spaceBetweenExpanded,
  })  : _height = height,
        _width = width,
        _widthExpanded = widthExpanded ?? width + 20,
        _heightExpanded = heightExpanded ?? height,
        _paddingExpanded = spaceBetweenExpanded ?? spaceBetween + 3,
        _padding = spaceBetween;

  double get width => _width;
  double get widthExpanded => _widthExpanded;
  double get height => _height;
  double get heightExpanded => _heightExpanded;
  double get padding => _padding;
  double get paddingExpanded => _paddingExpanded;
}
