import 'package:aukantun/models/enums/mime_type_enum.dart';
import 'package:aukantun/models/enums/source_type_enum.dart';
import 'package:aukantun/models/enums/turn_mode_enum.dart';
import 'package:aukantun/models/file_model.dart';
import 'package:aukantun/models/game_model/info_game_map.dart';
import 'package:aukantun/models/game_model/options_game_map.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GameModel {
  final String id;
  final String title;
  final String author;
  final InfoGameMap info;
  final OptionsGameMap options;
  final FileModel icon;
  final bool isEnabled;
  final bool isVisble;
  final int index;
  final String lang;
  final String? main;

  GameModel({
    required this.id,
    required this.title,
    required this.author,
    required this.info,
    required this.options,
    required this.icon,
    required this.isEnabled,
    required this.isVisble,
    required this.index,
    required this.lang,
    this.main,
  });

  // Convert a Movie object into a Map object
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'isEnabled': isEnabled,
      'isVisble': isVisble,
      'index': index,
      'info': info.toMap(),
      'options': options.toMap(),
      'icon': icon.toMap(),
      'lang': lang,
      'main': main,
    };
  }

  // Create a Movie object from a Map object
  factory GameModel.fromMap(Map<String, dynamic> map) {
    return GameModel(
      id: map['id'],
      title: map['title'],
      author: map['author'],
      isEnabled: map['isEnabled'],
      isVisble: map['isVisble'],
      index: map['index'],
      info: InfoGameMap.fromMap(map['info']),
      options: OptionsGameMap.fromMap(map['options']),
      icon: FileModel.fromMap(map['icon']),
      lang: map['lang'],
      main: map['main'],
    );
  }

  // Convert a Firestore document snapshot into a Movie object
  factory GameModel.fromDocument(DocumentSnapshot doc) {
    return GameModel.fromMap(doc.data() as Map<String, dynamic>);
  }

  static GameModel get fake {
    return GameModel(
      id: '1123123',
      title: 'Amigos de Mierda',
      author: 'Aukantun',
      info: InfoGameMap(
        description:
            'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        instructions: 'instructions',
        name: 'Amigos de Mierda',
        bodyHTML: 'bodyHTML',
        poster: FileModel(
            mimeType: MimeType.png,
            sourceType: SourceType.network,
            url:
                'https://www.google.com/images/branding/googlelogo/2x/googlelogo_light_color_272x92dp.png'),
        duration: 11,
        numberPlayers: 1,
        minimumAge: 1,
      ),
      options: OptionsGameMap(
        dice: true,
        scoreBoard: true,
        randomNumbers: true,
        countDown: true,
        turnMode: TurnMode.normal,
      ),
      icon: FileModel(
          mimeType: MimeType.png,
          sourceType: SourceType.network,
          url:
              'https://www.google.com/images/branding/googlelogo/2x/googlelogo_light_color_272x92dp.png'),
      isEnabled: true,
      isVisble: true,
      index: 1,
      lang: "es",
    );
  }
}
