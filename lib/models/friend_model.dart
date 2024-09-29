import 'package:aukantun/models/enums/gender_enum.dart';
import 'package:aukantun/utils/utils.dart';

class FriendModel {
  final String id;
  String name;
  Gender gender;
  int score;

  FriendModel({
    required this.name,
    required this.gender,
    required this.id,
  }) : score = 0;

  set setName(String value) {
    name = value;
  }

  set setGender(Gender value) {
    gender = value;
  }

  factory FriendModel.init() {
    return FriendModel(name: '', gender: Gender.male, id: getRandomString(10));
  }

  void increseScore({int value = 1}) {
    score = score + value;
  }

  void decreaseScore({int value = 1}) {
    score = score - value;
  }
}
