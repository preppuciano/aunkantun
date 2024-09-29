import 'package:aukantun/core/getting_started/flow/handlers/base_handler.dart';
import 'package:aukantun/views/getting_started/pages_view/overview_page_view.dart';
import 'package:flutter/material.dart';

class OverviewHandle extends BaseHandler {
  OverviewHandle(super.bloc) {
    // widget = OverviewPageView();
  }

  @override
  void handle() {
    // TODO: implement handle
  }

  @override
  Widget get widget {
    return OverviewPageView();
  }
}
