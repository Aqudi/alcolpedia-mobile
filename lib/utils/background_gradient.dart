import 'package:flutter/material.dart';

class BackgroundGradient extends LinearGradient {
  AlignmentGeometry begin;
  AlignmentGeometry end;

  BackgroundGradient({
    @required List<Color> colors,
    this.begin = Alignment.topLeft,
    this.end = Alignment.topRight,
  }) : super(
          begin: begin,
          end: end,
          colors: _buildColors(colors),
          stops: _buildStops(colors),
        );

  static List<Color> _buildColors(List<Color> colors) {
    return colors.fold<List<Color>>(<Color>[],
        (List<Color> list, Color color) => list..addAll(<Color>[color, color]));
  }

  static List<double> _buildStops(List<Color> colors) {
    final List<double> stops = <double>[0.0];

    for (int i = 1, len = colors.length; i < len; i++) {
      stops.add(i / colors.length);
      stops.add(i / colors.length);
    }

    return stops..add(1.0);
  }
}
