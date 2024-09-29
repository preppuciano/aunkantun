import 'package:aukantun/core/getting_started/bloc/getting_started_bloc.dart';
import 'package:aukantun/core/getting_started/flow/handlers/add_friends_handle.dart';
import 'package:aukantun/core/getting_started/flow/handlers/base_handler.dart';
import 'package:aukantun/core/getting_started/flow/handlers/error_handle.dart';
import 'package:aukantun/core/getting_started/flow/handlers/overview_handle.dart';
import 'package:aukantun/core/getting_started/flow/handlers/select_decks_handle.dart';

class GettingStartedFlow {
  late GettingStartedBloc bloc;

  late ErrorHandle error;
  late SelectDecksHandle step1;
  late AddFriendsHandle step2;
  late OverviewHandle step3;

  GettingStartedFlow({required this.bloc}) {
    // SelectDeskHandle <-> AddFriendsHandle <-> OverviewHandle
    error = ErrorHandle(bloc);
    step1 = SelectDecksHandle(bloc);
    step2 = AddFriendsHandle(bloc);
    step3 = OverviewHandle(bloc);

    step1.setPrev(error);
    step1.setNext(step2);
    step2.setPrev(step1);
    step2.setNext(step3);
    step3.setPrev(step2);
    step3.setNext(error);
  }

  BaseHandler get first => step1;
  BaseHandler get last => step3;

  int get length => 3;
}
