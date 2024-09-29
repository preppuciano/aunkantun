import 'package:flutter/material.dart';

class CorePadding extends StatelessWidget {
  final Widget child;
  final bool setHorizontal;
  final bool setVertical;

  final bool setTop;
  final bool setLeft;
  final bool setRight;
  final bool setBottom;

  const CorePadding({
    required this.child,
    this.setVertical = true,
    this.setHorizontal = true,
    this.setTop = true,
    this.setBottom = true,
    this.setLeft = true,
    this.setRight = true,
    super.key,
  });

  double get horizontalValue {
    return 10;
  }

  double get verticalValue {
    return 10;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: setRight && setHorizontal ? horizontalValue : 0,
        left: setLeft && setHorizontal ? horizontalValue : 0,
        top: setTop && setVertical ? verticalValue : 0,
        bottom: setBottom && setVertical ? verticalValue : 0,
      ),
      child: child,
    );
  }
}
