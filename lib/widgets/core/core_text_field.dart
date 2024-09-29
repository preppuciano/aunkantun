import 'package:aukantun/config/app_color.dart';
import 'package:aukantun/config/app_config.dart';
import 'package:flutter/material.dart';

class CoreTextField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final String? hintText;
  final bool? enabled;
  final Color? fillColor;
  final Color? prefixIconColor;
  final Color? prefixIconContainerColor;
  final Function? onTapPrefixIcon;
  final IconData? prefixIcon;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final String? suffixText;
  const CoreTextField({
    super.key,
    this.textEditingController,
    this.hintText,
    this.onChanged,
    this.enabled,
    this.onSubmitted,
    this.prefixIcon,
    this.prefixIconColor,
    this.prefixIconContainerColor,
    this.validator,
    this.textInputAction,
    this.onTapPrefixIcon,
    this.fillColor = AppColor.softWhite,
    this.keyboardType = TextInputType.text,
    this.suffixText,
  });

  bool get isEditable => enabled ?? false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          if (prefixIcon != null)
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () => isEditable ? onTapPrefixIcon?.call() : null,
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: prefixIconContainerColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  child: FittedBox(
                    child: Icon(
                      prefixIcon,
                      color: AppColor.charcoalColor,
                    ),
                  ),
                ),
              ),
            ),
          Expanded(
            flex: 8,
            child: Container(
              decoration: BoxDecoration(
                color: fillColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                onFieldSubmitted: (value) {
                  onSubmitted?.call(value);
                },
                enabled: enabled,
                controller: textEditingController,
                onChanged: onChanged,
                keyboardType: keyboardType,
                textInputAction: textInputAction,
                decoration: InputDecoration(
                  isDense: true,
                  filled: false,
                  suffixText: suffixText,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: TextStyle(
                    color: AppColor.graySpace,
                    fontSize: AppConfig.fontSizeLG,
                  ),
                  errorStyle: TextStyle(
                    fontSize: AppConfig.fontSizeMD,
                    fontFamily: AppConfig.londrinaSolid,
                    color: AppColor.crimsonRed.withOpacity(0.5),
                  ),
                ),
                style: TextStyle(
                  color: AppColor.charcoalColor,
                  fontSize: AppConfig.fontSizeLG,
                  height: 1,
                ),
                validator: (value) {
                  return validator?.call(value);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
