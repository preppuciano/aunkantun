import 'dart:math';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:aukantun/config/app_color.dart';
import 'package:aukantun/config/app_config.dart';
import 'package:aukantun/core/play_game/models/deck_play_model.dart';
import 'package:aukantun/core/play_game/models/play_game_model.dart';
import 'package:aukantun/core/play_game/play_game_bloc.dart';
import 'package:aukantun/core/play_game/services/play_sound_manager.dart';
import 'package:aukantun/models/card_model.dart';
import 'package:aukantun/models/deck_model/deck_model.dart';
import 'package:aukantun/models/enums/turn_mode_enum.dart';
import 'package:aukantun/views/play_game/tools_view/dice_page_view.dart';
import 'package:aukantun/views/play_game/tools_view/score_board_view.dart';
import 'package:aukantun/widgets/fade_animation.dart';
import 'package:aukantun/widgets/core/core_app_bar.dart';
import 'package:aukantun/widgets/core_background.dart';
import 'package:aukantun/widgets/playing_card/playing_card.dart';
import 'package:aukantun/widgets/playing_card/render_card_cover.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PlayPageView extends StatefulWidget {
  final PageController pageController;
  final PlayGameModel playGame;
  final PlaySoundManager sounds;
  const PlayPageView({
    super.key,
    required this.playGame,
    required this.pageController,
    required this.sounds,
  });
  @override
  State<PlayPageView> createState() => _PlayPageViewState();
}

class _PlayPageViewState extends State<PlayPageView>
    with SingleTickerProviderStateMixin {
  late PlayGameBloc playGameBloc;
  late AnimationController _controller;
  int indexDeck = 0;
  bool isRotating = false;
  List<int?> sounds = List.filled(4, null);
  int totalTurns = 1;

  GlobalKey<CircularMenuState> circularMenuKey = GlobalKey<CircularMenuState>();

  @override
  void initState() {
    super.initState();
    playGameBloc = BlocProvider.of<PlayGameBloc>(context);
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    ); // Hace que la animación se repita continuamente
  }

  List<CardModel> get currentCards {
    return widget.playGame.decks[indexDeck].cards;
  }

  DeckModel get currentDeck {
    return widget.playGame.decks[indexDeck].deck;
  }

  DeckPlayModel get currentPlayDeck {
    return widget.playGame.decks[indexDeck];
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CoreBackground(
      child: CircularMenu(
        key: circularMenuKey,
        toggleButtonBoxShadow: const [],
        alignment: Alignment.bottomRight,
        radius: 100,
        curve: Curves.bounceOut,
        reverseCurve: Curves.fastOutSlowIn,
        startingAngleInRadian: pi,
        endingAngleInRadian: 3 * pi / 2,
        toggleButtonOnPressed: () {
          //callback
        },
        toggleButtonColor: AppColor.deepSkyBlue,
        toggleButtonIconColor: Colors.white,
        toggleButtonMargin: 10.0,
        toggleButtonPadding: 10.0,
        toggleButtonSize: 40.0,
        items: [
          CircularMenuItem(
            boxShadow: const [],
            icon: Icons.shuffle,
            color: AppColor.crimsonRed,
            onTap: () async {
              await widget.sounds.playCardsShuffle();
              setState(() {
                currentCards.shuffle();
                _controller.forward(from: 0.0);
                circularMenuKey.currentState?.reverseAnimation();
              });
            },
          ),
          CircularMenuItem(
            boxShadow: const [],
            icon: Icons.casino,
            color: AppColor.crimsonRed,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DicePageView(
                          rollingDiceSound: widget.sounds.playRollingDice)));
            },
          ),
          CircularMenuItem(
            boxShadow: const [],
            icon: Icons.timer,
            color: AppColor.crimsonRed,
            onTap: () {
              widget.pageController.nextPage(
                  duration: Duration(milliseconds: 250), curve: Curves.ease);
            },
          ),
          CircularMenuItem(
            boxShadow: const [],
            icon: Icons.scoreboard_rounded,
            color: AppColor.crimsonRed,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ScoreBoardView(playGame: widget.playGame)));
            },
          )
        ],
        backgroundWidget: Column(
          children: [
            CoreAppBar(
              title: '${playGameBloc.game?.title}',
              description: widget.playGame.game.options.turnMode ==
                      TurnMode.normal
                  ? 'TURNO: ${widget.playGame.getCurrentTurn(totalTurns).name}'
                  : null,
              actionIcon: Icons.settings,
              actionTap: () {
                context.push('/settings');
              },
            ),
            widget.playGame.decks.length > 1
                ? Flexible(
                    flex: 3,
                    child: FadeAnimation(1.5, cardsCarouselSlider()),
                  )
                : Container(),
            Flexible(
              flex: 10,
              child: FadeAnimation(
                1.6,
                Container(
                  margin: EdgeInsets.all(50),
                  child: Column(
                    children: [
                      Text(
                        currentDeck.name,
                        style: TextStyle(fontSize: AppConfig.fontSizeLG),
                      ),
                      Text(
                        '${currentPlayDeck.cards.length}/${currentPlayDeck.count}',
                        style: TextStyle(fontSize: AppConfig.fontSizeMD),
                      ),
                      Flexible(child: swiperCards()),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget swiperCards() {
    int backgroundCardCount = 3;
    return RotationTransition(
      turns: _controller,
      child: AspectRatio(
        aspectRatio: 1 / 1.4,
        child: AppinioSwiper(
          loop: currentPlayDeck.deck.options.infiniteCards,
          key: ValueKey('${currentPlayDeck.deck.id}-${currentCards.length}'),
          cardCount: currentCards.isEmpty ? 1 : currentCards.length,
          backgroundCardCount: min(currentCards.length, backgroundCardCount),
          backgroundCardScale: 1,
          swipeOptions:
              SwipeOptions.only(down: false, left: true, right: true, up: true),
          backgroundCardOffset: Offset(-10, 10),
          invertAngleOnBottomDrag: true,
          onEnd: () {},
          onSwipeEnd: (a, b, c) async {
            bool isDrew = a != b;
            if (isDrew) {
              await widget.sounds.playCardSwipe();
              if (currentDeck.options.isCountedNextTurn) {
                totalTurns++;
              }
              if (!currentPlayDeck.deck.options.infiniteCards) {
                currentPlayDeck.removeCard(currentCards[a]);
              }
            }
            setState(() {});
          },
          cardBuilder: (BuildContext context, int index) {
            currentPlayDeck.info();
            if (currentCards.isNotEmpty) {
              return PlayingCard(
                key: currentPlayDeck.deck.options.resetVisibility
                    ? ValueKey(currentCards[index].id)
                    : null,
                card: currentCards[index],
                deck: currentDeck,
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Sin Cartas', textAlign: TextAlign.center),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget cardsCarouselSlider() {
    return LayoutBuilder(
      builder: (context, constraints) {
        const aspectRatio = 1 / 1.4;
        final carouselHeight = constraints.maxHeight;
        final cardWidth = carouselHeight * aspectRatio;
        final carouselWidth = constraints.maxWidth;
        return Container(
          width: double.infinity,
          color: AppColor.softWhite.withOpacity(0.1),
          child: CarouselSlider(
            options: CarouselOptions(
              enableInfiniteScroll: false,
              viewportFraction: cardWidth / carouselWidth,
            ),
            items: widget.playGame.decks.map(
              (deck) {
                int index = widget.playGame.decks
                    .indexWhere((e) => e.deck.id == deck.deck.id);
                return GestureDetector(
                  child: RenderCardCover.carousel(
                    isSelected:
                        currentDeck.id == widget.playGame.decks[index].deck.id,
                    deck: widget.playGame.decks[index].deck,
                    card: widget.playGame.decks[index].allCards.first,
                  ),
                  onTap: () {
                    if (index != -1) {
                      setState(() => indexDeck = index);
                    }
                  },
                );
              },
            ).toList(),
          ),
        );
      },
    );
  }
}
