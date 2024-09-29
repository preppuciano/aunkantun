import 'package:aukantun/config/app_color.dart';
import 'package:aukantun/utils/sound_manager.dart';
import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';

enum CoreButtonType { primary, secondary, danger, info }

class CoreButton extends StatelessWidget {
  final SoundManager soundManager = SoundManager();
  final String text;
  final Function? onPressed;
  final CoreButtonType buttonType;
  final IconData? iconData;

  late final Color buttonColor;
  late final Color textColor;
  late final Color borderColor;
  late final LinearGradient gradientColor;
  final String? heroTag;

  CoreButton({
    super.key,
    required this.text,
    this.onPressed,
    this.buttonType = CoreButtonType.primary,
    this.iconData,
    this.heroTag,
  }) {
    if (buttonType == CoreButtonType.primary) {
      buttonColor = AppColor.primaryColor;
      textColor = AppColor.onPrimaryColor;
      borderColor = AppColor.primaryBorderColor;
      gradientColor = AppColor.primaryGradientColor;
    } else if (buttonType == CoreButtonType.secondary) {
      buttonColor = AppColor.secondaryColor;
      textColor = AppColor.onSecondaryColor;
      borderColor = AppColor.secondaryBorderColor;
      gradientColor = AppColor.secondaryGradientColor;
    } else if (buttonType == CoreButtonType.danger) {
      buttonColor = AppColor.dangerColor;
      textColor = AppColor.onDangerColor;
      borderColor = AppColor.dangerBorderColor;
      gradientColor = AppColor.dangerGradientColor;
    } else if (buttonType == CoreButtonType.info) {
      buttonColor = AppColor.infoColor;
      textColor = AppColor.onInfoColor;
      borderColor = AppColor.infoBorderColor;
      gradientColor = AppColor.infoGradientColor;
    } else {
      buttonColor = AppColor.primaryColor;
      textColor = AppColor.onPrimaryColor;
      borderColor = AppColor.primaryBorderColor;
      gradientColor = AppColor.primaryGradientColor;
    }
  }

  bool get isActive {
    return onPressed != null;
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isActive ? 1 : 0.5,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        width: double.infinity,
        height: 60,
        child: FloatingActionButton(
          heroTag: heroTag,
          onPressed: isActive
              ? () async {
                  await soundManager.playPrimaryButton();
                  onPressed?.call();
                }
              : null,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: Ink(
            decoration: BoxDecoration(
              border: Border.all(
                color: borderColor,
                width: 2,
                strokeAlign: BorderSide.strokeAlignInside,
              ),
              color: buttonColor,
              gradient: isActive ? gradientColor : null,
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
            child: Container(
              alignment: Alignment.center,
              child: FittedBox(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: StrokeText(
                    text: text,
                    strokeWidth: 5,
                    textStyle: const TextStyle(fontSize: 30),
                    strokeColor: borderColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
