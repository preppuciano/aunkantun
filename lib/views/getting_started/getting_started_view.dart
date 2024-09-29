import 'package:aukantun/core/database/database_bloc.dart';
import 'package:aukantun/core/getting_started/bloc/getting_started_bloc.dart';
import 'package:aukantun/models/game_model/game_model.dart';
import 'package:aukantun/widgets/core_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GettingStartedView extends StatefulWidget {
  final GameModel game;
  const GettingStartedView({super.key, required this.game});

  @override
  State<GettingStartedView> createState() => _GettingStartedViewState();
}

class _GettingStartedViewState extends State<GettingStartedView> {
  late GettingStartedBloc gettingStartedBloc;
  late DatabaseBloc databaseBloc;

  @override
  void initState() {
    super.initState();
    databaseBloc = BlocProvider.of<DatabaseBloc>(context);
    gettingStartedBloc = BlocProvider.of<GettingStartedBloc>(context);
    gettingStartedBloc.add(GettingStartedInit(game: widget.game));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CoreBackground(
        child: BlocListener(
          bloc: gettingStartedBloc,
          listener: (context, state) {
            if (state is GettingStartedInitLoaded) {
              gettingStartedBloc.currentHandle
                  ?.pushPage(context, replacement: true);
            }
          },
          child: Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
