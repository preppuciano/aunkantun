import 'package:aukantun/models/card_cover_model.dart';
import 'package:aukantun/models/deck_model/options_deck_map.dart';
import 'package:aukantun/models/enums/deck_type_enum.dart';
import 'package:aukantun/models/enums/mime_type_enum.dart';
import 'package:aukantun/models/enums/source_type_enum.dart';
import 'package:aukantun/models/file_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DeckModel {
  final String id;
  final String? gameId;
  final String? deckBaseId;
  final String description;
  final String name;
  final bool isRequired;
  final int index;
  final int cardCount;
  final DeckType deckType;
  final OptionsDeckMap options;
  final CardCoverModel? _cardCover;

  DeckModel({
    required this.id,
    required this.gameId,
    required this.deckBaseId,
    required this.description,
    required this.name,
    required this.isRequired,
    required this.index,
    required this.cardCount,
    required this.deckType,
    required this.options,
    CardCoverModel? cardCover,
  }) : _cardCover = cardCover;

  CardCoverModel get cardCover {
    if (_cardCover != null) {
      return _cardCover;
    } else {
      return CardCoverModel.init();
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'gameId': gameId,
      'deckBaseId': deckBaseId,
      'description': description,
      'name': name,
      'isRequired': isRequired,
      'index': index,
      'cardCount': cardCount,
      'deckType': DeckTypeHelper.deckTypeToString(deckType),
      'options': options.toMap(),
      'cardCover': _cardCover?.toMap(),
    };
  }

  // Create a Movie object from a Map object
  factory DeckModel.fromMap(Map<String, dynamic> map) {
    return DeckModel(
      id: map['id'],
      gameId: map['gameId'],
      deckBaseId: map['deckBaseId'],
      description: map['description'],
      name: map['name'],
      isRequired: map['isRequired'],
      index: map['index'],
      cardCount: map['cardCount'],
      options: map['options'] != null
          ? OptionsDeckMap.fromMap(map['options'])
          : OptionsDeckMap.init(),
      deckType: DeckTypeHelper.stringToDeckType(map['deckType']),
      cardCover: map['cardCover'] != null
          ? CardCoverModel.fromMap(map['cardCover'])
          : null,
    );
  }

  // Convert a Firestore document snapshot into a Movie object
  factory DeckModel.fromDocument(DocumentSnapshot doc) {
    return DeckModel.fromMap(doc.data() as Map<String, dynamic>);
  }

  static DeckModel get fake {
    return DeckModel(
      id: 'id',
      gameId: 'gameId',
      deckBaseId: 'deckBaseId',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      name: 'Lorem ipsum dolor',
      isRequired: true,
      index: 1,
      cardCount: 10,
      deckType: DeckType.base,
      options: OptionsDeckMap(infiniteCards: false),
      cardCover: CardCoverModel(
        file: FileModel(
          url: 'url',
          mimeType: MimeType.png,
          sourceType: SourceType.network,
        ),
      ),
    );
  }
}
