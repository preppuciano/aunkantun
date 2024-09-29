import 'package:aukantun/config/app_color.dart';
import 'package:aukantun/config/app_config.dart';
import 'package:aukantun/config/app_localizations.dart';
import 'package:aukantun/core/database/database_bloc.dart';
import 'package:aukantun/models/game_model/game_model.dart';
import 'package:aukantun/widgets/fade_animation.dart';
import 'package:aukantun/views/getting_started/getting_started_view.dart';
import 'package:aukantun/widgets/core/core_button.dart';
import 'package:aukantun/widgets/core/core_padding.dart';
import 'package:aukantun/widgets/core_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class GameView extends StatefulWidget {
  final String gameId;
  const GameView({super.key, required this.gameId});

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  late DatabaseBloc databaseBloc;

  @override
  void initState() {
    super.initState();
    databaseBloc = BlocProvider.of<DatabaseBloc>(context);
    databaseBloc.add(DatabaseFetchGame(gameId: widget.gameId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CoreBackground(
        child: BlocBuilder(
            bloc: databaseBloc,
            builder: (context, state) {
              if (state is DatabaseFetchedGame) {
                return Stack(
                  children: <Widget>[
                    GameDetails(game: state.game),
                    Positioned.fill(
                      child: WidgetAnimator(
                        atRestEffect: WidgetRestingEffects.fidget(),
                        child: Container(
                          margin: EdgeInsets.all(20),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: CoreButton(
                              heroTag: 'main',
                              text: AppLocalizations.of(context)!
                                  .translate('views.game_view.button_start'),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            GettingStartedView(
                                                game: state.game)));
                                // context.push('$location/getting-started');
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return GameDetails(game: GameModel.fake, isLoading: true);
              }
            }),
      ),
    );
  }
}

class GameDetails extends StatelessWidget {
  final GameModel game;
  final bool isLoading;
  const GameDetails({super.key, required this.game, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      effect: ShimmerEffect(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        duration: Duration(seconds: 1),
      ),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300,
            backgroundColor: AppColor.backgroundColor,
            foregroundColor: AppColor.softWhite,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(game.info.poster.url),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          colors: [
                        AppColor.backgroundColor,
                        Colors.black.withOpacity(.3)
                      ])),
                  child: CorePadding(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        StrokeText(
                          text: game.title,
                          textStyle: TextStyle(
                            height: 1,
                            fontFamily: AppConfig.fontFamily,
                            fontSize: AppConfig.fontSizeXL,
                            color: AppColor.softWhite,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          strokeColor: AppColor.darkNavyBlue,
                          strokeWidth: 5,
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              game.title,
                              style: TextStyle(
                                color: AppColor.softWhite,
                                fontSize: AppConfig.fontSizeMD,
                              ),
                            ),
                            SizedBox(width: 45),
                            Flexible(
                              child: FadeAnimation(
                                1.3,
                                Text(
                                  overflow: TextOverflow.ellipsis,
                                  game.author,
                                  style: TextStyle(
                                    color: AppColor.softWhite,
                                    fontSize: AppConfig.fontSizeMD,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              CorePadding(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      AppLocalizations.of(context)!
                          .translate('views.game_view.subtitle_description'),
                      style: TextStyle(
                        color: AppColor.softWhite,
                        fontSize: AppConfig.fontSizeLG,
                      ),
                    ),
                    Text(
                      game.info.description,
                      style: const TextStyle(
                        color: AppColor.softWhite,
                        fontSize: AppConfig.fontSizeMD,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      AppLocalizations.of(context)!
                          .translate('views.game_view.subtitle_instructions'),
                      style: TextStyle(
                        color: AppColor.softWhite,
                        fontSize: AppConfig.fontSizeLG,
                      ),
                    ),
                    Text(
                      game.info.instructions,
                      style: const TextStyle(
                        color: AppColor.softWhite,
                        fontSize: AppConfig.fontSizeMD,
                      ),
                    ),
                    // CoreButton(
                    //     buttonType: CoreButtonType.info,
                    //     text: 'COPY',
                    //     onPressed: () async {
                    //       await DatabaseService().branchGame(gameId: game.id);
                    //     }),
                    SizedBox(height: 100)
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
