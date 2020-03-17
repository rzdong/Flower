import 'package:flutter/widgets.dart';

extension WidgetExt on Widget {
  Container setPadding({
    Key key,
    EdgeInsetsGeometry padding
  }) {
    return Container(
      padding: padding,
      child: this,
    );
  }
}