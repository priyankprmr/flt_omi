import 'package:flutter/material.dart' show EdgeInsetsGeometry, Padding, Widget;

extension PaddingExtension on Widget {
  Widget padding(EdgeInsetsGeometry padding) =>
      Padding(padding: padding, child: this);
}
