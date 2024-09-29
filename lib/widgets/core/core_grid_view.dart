import 'package:flutter/material.dart';

class CoreGridView extends StatelessWidget {
  final List<Widget> children;
  const CoreGridView({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.all(0),
      shrinkWrap: true,
      addRepaintBoundaries: true,
      primary: false,
      childAspectRatio: 1 / 1.4,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: children,
    );
  }
}
