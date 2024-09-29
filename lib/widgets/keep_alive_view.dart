import 'package:flutter/material.dart';

class KeepAliveView extends StatefulWidget {
  const KeepAliveView({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  _KeepAliveViewState createState() => _KeepAliveViewState();
}

class _KeepAliveViewState extends State<KeepAliveView>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    /// Dont't forget this
    super.build(context);

    return widget.child;
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
