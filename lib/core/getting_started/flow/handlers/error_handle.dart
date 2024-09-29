import 'package:aukantun/core/getting_started/flow/handlers/base_handler.dart';
import 'package:aukantun/widgets/core_background.dart';
import 'package:flutter/material.dart';

class ErrorHandle extends BaseHandler {
  ErrorHandle(super.bloc) {
    // widget = Scaffold(
    //   body: CoreBackground(
    //     child: Text('ERROR HANDLE'),
    //   ),
    // );
  }

  @override
  void handle() {
    // TODO: implement handle
  }

  @override
  Widget get widget {
    return Scaffold(
      body: CoreBackground(
        child: Text('ERROR HANDLE'),
      ),
    );
  }
}
