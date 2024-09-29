import 'package:flutter/material.dart';

enum Gender {
  male('male', Icons.person_rounded, Color(0xff3273a5)),
  female('female', Icons.person_2_rounded, Color(0xffEC0E6E)),
  other('other', Icons.pets, Color(0xffffffff));

  const Gender(this.key, this.icon, this.color);
  final String key;
  final IconData icon;
  final Color color;
}

class GenderHelper {
  // Helper function to convert enum to String
  static String deckTypeToString(Gender type) {
    return type.key;
  }

  // Helper function to convert String to enum
  static Gender stringToGender(String type) {
    return Gender.values.firstWhere((e) => deckTypeToString(e) == type);
  }
}
