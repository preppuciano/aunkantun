import 'package:aukantun/core/deck_list/deck_list_bloc.dart';
import 'package:aukantun/core/getting_started/flow/handlers/base_handler.dart';
import 'package:aukantun/services/database_service.dart';
import 'package:aukantun/views/getting_started/pages_view/select_decks_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectDecksHandle extends BaseHandler {
  SelectDecksHandle(super.bloc) : super();

  @override
  void handle() {
    // TODO: implement handle
  }

  @override
  Widget get widget {
    return SelectDecksPageView(game: bloc.game!);
  }

  @override
  Future<void> pushPage(BuildContext context, {bool replacement = false}) {
    if (replacement) {
      return Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                DeckListBloc(databaseService: DatabaseService()),
            child: widget,
          ),
        ),
      );
    } else {
      return Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                DeckListBloc(databaseService: DatabaseService()),
            child: widget,
          ),
        ),
      );
    }
  }
}
