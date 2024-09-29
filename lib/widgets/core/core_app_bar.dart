import 'package:aukantun/config/app_color.dart';
import 'package:aukantun/config/app_config.dart';
import 'package:aukantun/widgets/core/core_padding.dart';
import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';

class CoreAppBar extends StatelessWidget {
  final String title;
  final String? description;
  final IconData? actionIcon;
  final Function? actionTap;
  final Function? customTapBack;
  const CoreAppBar({
    super.key,
    this.title = "",
    this.actionIcon,
    this.actionTap,
    this.customTapBack,
    this.description,
  });

  bool get hasAction {
    return actionIcon != null;
  }

  bool get hasCustomLeading {
    return customTapBack != null;
  }

  @override
  Widget build(BuildContext context) {
    return CorePadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              hasCustomLeading
                  ? Container(
                      margin: EdgeInsets.only(right: 10),
                      child: CircleAvatar(
                        backgroundColor: AppColor.onBorderBackgroundColor,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back_rounded),
                          color: AppColor.softWhite,
                          onPressed: () => customTapBack?.call(),
                        ),
                      ),
                    )
                  : Navigator.canPop(context)
                      ? Container(
                          margin: EdgeInsets.only(right: 10),
                          child: CircleAvatar(
                            backgroundColor: AppColor.onBorderBackgroundColor,
                            child: IconButton(
                              icon: const Icon(Icons.arrow_back_rounded),
                              color: AppColor.softWhite,
                              onPressed: () {
                                if (Navigator.canPop(context)) {
                                  return Navigator.pop(context);
                                }
                              },
                            ),
                          ),
                        )
                      : Container(),
              Expanded(
                child: StrokeText(
                  text: title,
                  textStyle: TextStyle(
                    height: 1,
                    fontFamily: AppConfig.fontFamily,
                    fontSize: AppConfig.fontSizeXL,
                    color: Colors.white,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  strokeColor: AppColor.onBorderBackgroundColor,
                  strokeWidth: 10,
                ),
              ),
              hasAction
                  ? CircleAvatar(
                      backgroundColor: AppColor.onBorderBackgroundColor,
                      child: IconButton(
                        icon: Icon(actionIcon),
                        color: AppColor.softWhite,
                        onPressed:
                            actionTap != null ? () => actionTap!() : null,
                      ),
                    )
                  : Container()
            ],
          ),
          renderDescription()
        ],
      ),
    );
  }

  Widget renderDescription() {
    if (description != null) {
      return Container(
        margin: EdgeInsets.only(top: 5),
        child: Text(
          description!,
          style: TextStyle(
            fontSize: AppConfig.fontSizeMD,
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
