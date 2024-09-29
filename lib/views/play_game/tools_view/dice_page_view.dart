import 'dart:async';
import 'package:aukantun/utils/utils.dart';
import 'package:aukantun/views/play_game/tools_view/widgets/dice_face.dart';
import 'package:aukantun/widgets/core/core_app_bar.dart';
import 'package:aukantun/widgets/core/core_button.dart';
import 'package:aukantun/widgets/core/core_padding.dart';
import 'package:aukantun/widgets/core_background.dart';
import 'package:flutter/material.dart';

class DicePageView extends StatefulWidget {
  final Function rollingDiceSound;
  const DicePageView({super.key, required this.rollingDiceSound});

  @override
  State<DicePageView> createState() => _DicePageViewState();
}

class _DicePageViewState extends State<DicePageView> {
  List<int> numbers = [1];
  int currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void rollingDice() {
    currentIndex = 0;
    numbers = List.generate(10, (index) => getRandomNumber(1, 6));
    _timer = Timer.periodic(
      Duration(milliseconds: 100),
      (timer) {
        if (currentIndex < numbers.length - 1) {
          setState(() {
            currentIndex++;
          });
        } else {
          timer.cancel();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CoreBackground(
      child: Stack(
        children: [
          CoreAppBar(title: 'Dice'),
          Center(child: DiceFace(number: numbers[currentIndex])),
          CorePadding(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CoreButton(
                text: 'Random',
                onPressed: () {
                  widget.rollingDiceSound();
                  rollingDice();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
