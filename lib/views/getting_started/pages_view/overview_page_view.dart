import 'package:aukantun/config/app_localizations.dart';
import 'package:aukantun/core/getting_started/bloc/getting_started_bloc.dart';
import 'package:aukantun/core/play_game/play_game_bloc.dart';
import 'package:aukantun/utils/sound_manager.dart';
import 'package:aukantun/views/getting_started/widgets/play_progress_indicator.dart';
import 'package:aukantun/widgets/core/core_app_bar.dart';
import 'package:aukantun/widgets/core/core_padding.dart';
import 'package:aukantun/widgets/core_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class OverviewPageView extends StatefulWidget {
  const OverviewPageView({
    super.key,
  });
  @override
  State<OverviewPageView> createState() => _OverviewPageViewState();
}

class _OverviewPageViewState extends State<OverviewPageView> {
  late GettingStartedBloc gettingStartedBloc;
  late PlayGameBloc playGameBloc;

  @override
  void initState() {
    super.initState();
    gettingStartedBloc = BlocProvider.of<GettingStartedBloc>(context);
    playGameBloc = BlocProvider.of<PlayGameBloc>(context);
    playGameBloc.add(
      PlayGameStart(
        game: gettingStartedBloc.game!,
        decksBase: gettingStartedBloc.decksBase,
        decksCommunity: gettingStartedBloc.decksCommunity,
        friends: gettingStartedBloc.friends,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CoreBackground(
        child: Stack(
          children: [
            CoreAppBar(
              title: AppLocalizations.of(context)!
                  .translate('views.overview_view.title'),
              description: AppLocalizations.of(context)!
                  .translate('views.overview_view.description'),
              customTapBack: () {
                gettingStartedBloc.currentHandle =
                    gettingStartedBloc.currentHandle?.prev;
                Navigator.pop(context);
              },
            ),
            Align(
              alignment: Alignment.center,
              child: BlocConsumer(
                listener: (context, state) {
                  if (state is PlayGameLoaded) {
                    SoundManager().playReady();
                  }
                },
                bloc: playGameBloc,
                builder: (context, state) {
                  if (state is PlayGameLoaded) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CorePadding(
                          child: PlayProgressIndicator(
                            onTap: () {
                              GoRouter.of(context)
                                ..pop()
                                ..pop()
                                ..pop()
                                ..push('/play', extra: state.playGame);
                            },
                          ),
                        ),
                      ],
                    );
                  } else if (state is PlayGameLoading) {
                    return PlayProgressIndicator(progress: state.progress);
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
