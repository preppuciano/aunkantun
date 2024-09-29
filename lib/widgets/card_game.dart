import 'package:aukantun/config/app_color.dart';
import 'package:aukantun/config/app_config.dart';
import 'package:aukantun/config/app_localizations.dart';
import 'package:aukantun/models/game_model/game_model.dart';
import 'package:aukantun/utils/sound_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CardGame extends StatelessWidget {
  final bool isLoading;
  final GameModel game;
  const CardGame({
    super.key,
    required this.game,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      effect: ShimmerEffect(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        duration: Duration(seconds: 1),
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColor.softWhite,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ]),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 60,
                            height: 60,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                game.icon.url,
                                fit: BoxFit.cover,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Skeleton.ignore(
                                    child: Center(
                                      child: _imageProgress(loadingProgress),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    game.info.name,
                                    style: const TextStyle(
                                      height: 1,
                                      color: AppColor.charcoalColor,
                                      fontSize: AppConfig.fontSizeLG,
                                    ),
                                  ),
                                  Text(
                                    game.info.description,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: AppConfig.fontSizeMD,
                                      color: AppColor.graySpace,
                                      height: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColor.graySpace.withOpacity(0.3),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "#${game.id.substring(0, 6)}",
                            style: TextStyle(
                              color: AppColor.charcoalColor,
                              fontSize: AppConfig.fontSizeSM,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColor.graySpace.withOpacity(0.3),
                      ),
                      child: Row(
                        children: [
                          Text(
                            game.author,
                            style: TextStyle(
                              color: AppColor.charcoalColor,
                              fontSize: AppConfig.fontSizeSM,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Skeleton.ignore(
                  child: GestureDetector(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColor.primaryColor),
                      child: StrokeText(
                        text: AppLocalizations.of(context)!
                            .translate('widgets.card_game.button_play'),
                        strokeColor: AppColor.charcoalColor,
                        strokeWidth: 4,
                        textStyle: TextStyle(fontSize: AppConfig.fontSizeMD),
                      ),
                    ),
                    onTap: () {
                      SoundManager().playSecondaryButton();
                      context.push('/games/${game.id}', extra: game);
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  CircularProgressIndicator _imageProgress(ImageChunkEvent loadingProgress) {
    return CircularProgressIndicator(
      value: loadingProgress.expectedTotalBytes != null
          ? loadingProgress.cumulativeBytesLoaded /
              loadingProgress.expectedTotalBytes!
          : null,
    );
  }
}
