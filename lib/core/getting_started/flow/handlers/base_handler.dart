import 'package:aukantun/core/getting_started/bloc/getting_started_bloc.dart';
import 'package:flutter/material.dart';

abstract class BaseHandler {
  GettingStartedBloc bloc;
  late Widget widget;

  BaseHandler(this.bloc);

  late BaseHandler? next;
  late BaseHandler? prev;
  void setNext(BaseHandler handler) {
    next = handler;
  }

  void setPrev(BaseHandler handler) {
    prev = handler;
  }

  void handle();

  Future<void> pushPage(BuildContext context, {bool replacement = false}) {
    if (replacement) {
      return Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => widget));
    } else {
      return Navigator.push(
          context, MaterialPageRoute(builder: (context) => widget));
    }
  }
}
