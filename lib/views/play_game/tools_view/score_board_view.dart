import 'package:aukantun/config/app_color.dart';
import 'package:aukantun/config/app_config.dart';
import 'package:aukantun/config/app_localizations.dart';
import 'package:aukantun/core/play_game/models/play_game_model.dart';
import 'package:aukantun/widgets/core/core_app_bar.dart';
import 'package:aukantun/widgets/core/core_padding.dart';
import 'package:aukantun/widgets/core_background.dart';
import 'package:aukantun/widgets/new_friend_item.dart';
import 'package:flutter/material.dart';

class ScoreBoardView extends StatefulWidget {
  final PlayGameModel playGame;
  const ScoreBoardView({super.key, required this.playGame});

  @override
  State<ScoreBoardView> createState() => _ScoreBoardViewState();
}

class _ScoreBoardViewState extends State<ScoreBoardView> {
  double height = 50;
  @override
  Widget build(BuildContext context) {
    return CoreBackground(
        child: SingleChildScrollView(
      child: Column(
        children: [
          CoreAppBar(
            title: AppLocalizations.of(context)!
                .translate('views.score_board_view.title'),
            description: AppLocalizations.of(context)!
                .translate('views.score_board_view.description'),
          ),
          CorePadding(
            child: Column(
              children: [
                ...widget.playGame.friends.map(
                  (friend) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      key: ValueKey(friend.id),
                      children: [
                        Expanded(
                          flex: 10,
                          child: NewFriendItem(friend: friend),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          flex: 5,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 5,
                                child: GestureDetector(
                                  child: Container(
                                    height: height,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        bottomLeft: Radius.circular(5),
                                      ),
                                      color: AppColor.crimsonRed,
                                    ),
                                    child: Icon(
                                      color: AppColor.softWhite,
                                      Icons.arrow_downward_rounded,
                                      size: 30,
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      friend.decreaseScore();
                                      widget.playGame.sortFriends();
                                    });
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 6,
                                child: Container(
                                  height: height,
                                  decoration: BoxDecoration(
                                    color: AppColor.softWhite,
                                  ),
                                  child: Center(
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      '${friend.score > 99 ? "+99" : friend.score}',
                                      style: TextStyle(
                                          color: AppColor.charcoalColor,
                                          fontSize: AppConfig.fontSizeMD),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: GestureDetector(
                                  child: Container(
                                    height: height,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(5),
                                        bottomRight: Radius.circular(5),
                                      ),
                                      color: AppColor.appleGreen,
                                    ),
                                    child: Icon(
                                      color: AppColor.softWhite,
                                      Icons.arrow_upward,
                                      size: 30,
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      friend.increseScore();
                                      widget.playGame.sortFriends();
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
