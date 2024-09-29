import 'package:aukantun/models/enums/turn_mode_enum.dart';

class OptionsGameMap {
  final bool dice;
  final bool scoreBoard;
  final bool randomNumbers;
  final bool countDown;
  final TurnMode turnMode;

  OptionsGameMap({
    required this.dice,
    required this.scoreBoard,
    required this.randomNumbers,
    required this.countDown,
    required this.turnMode,
  });

  // Convert a Movie object into a Map object
  Map<String, dynamic> toMap() {
    return {
      'dice': dice,
      'scoreBoard': scoreBoard,
      'randomNumbers': randomNumbers,
      'countDown': countDown,
      'turnMode': TurnModeHelper.turnModeToString(turnMode),
    };
  }

  // Create a Movie object from a Map object
  factory OptionsGameMap.fromMap(Map<String, dynamic> map) {
    return OptionsGameMap(
      dice: map['dice'],
      scoreBoard: map['scoreBoard'],
      randomNumbers: map['randomNumbers'],
      countDown: map['countDown'],
      turnMode: TurnModeHelper.stringToTurnMode(map['turnMode']),
    );
  }
}
