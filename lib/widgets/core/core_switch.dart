import 'package:aukantun/utils/sound_manager.dart';
import 'package:flutter/material.dart';

class CoreSwitch extends StatelessWidget {
  final bool value;
  final Function(bool)? onChanged;

  const CoreSwitch({super.key, required this.value, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      onChanged: (value) {
        SoundManager().playSwitchButton();
        onChanged?.call(value);
      },
    );
  }
}
