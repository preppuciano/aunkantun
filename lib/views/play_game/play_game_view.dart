import 'package:aukantun/core/play_game/models/play_game_model.dart';
import 'package:aukantun/core/play_game/play_game_bloc.dart';
import 'package:aukantun/core/play_game/services/play_sound_manager.dart';
import 'package:aukantun/views/play_game/pages_view/play_page_view.dart';
import 'package:aukantun/views/play_game/pages_view/countdown_page_view.dart';
import 'package:aukantun/widgets/keep_alive_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayGameView extends StatefulWidget {
  final PlayGameModel playGame;
  const PlayGameView({super.key, required this.playGame});
  @override
  State<PlayGameView> createState() => _PlayGameViewState();
}

class _PlayGameViewState extends State<PlayGameView>
    with SingleTickerProviderStateMixin {
  late PlaySoundManager playSoundManager;
  late PlayGameBloc playGameBloc;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    playGameBloc = BlocProvider.of<PlayGameBloc>(context);
    pageController = PageController();
    playSoundManager = PlaySoundManager();
  }

  @override
  void dispose() {
    playSoundManager.release();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        KeepAliveView(
            child: PlayPageView(
          sounds: playSoundManager,
          playGame: widget.playGame,
          pageController: pageController,
        )),
        KeepAliveView(
            child: CountdownPageView(
          pageController: pageController,
          soundCounterdownFinish: () =>
              playSoundManager.playCounterdownFinish(),
        )),
      ],
    );
  }
}
