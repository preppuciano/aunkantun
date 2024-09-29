import 'package:aukantun/core/getting_started/flow/handlers/base_handler.dart';
import 'package:aukantun/views/getting_started/pages_view/add_friends_page_view.dart';
import 'package:flutter/material.dart';

class AddFriendsHandle extends BaseHandler {
  AddFriendsHandle(super.bloc) {
    // widget = AddFriendsPageView();
  }

  @override
  void handle() {
    // TODO: implement handle
  }

  @override
  Widget get widget {
    return AddFriendsPageView();
  }
}
