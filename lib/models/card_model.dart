import 'package:aukantun/models/card_cover_model.dart';
import 'package:aukantun/models/deck_model/deck_model.dart';

class CardModel {
  final String id;
  final String? content;
  final String? gameId;
  final String? deckId;
  final String? deckBaseId;
  final String? contentHTML;
  final int index;
  final CardCoverModel? _cover;

  CardModel({
    required this.id,
    required this.content,
    required this.gameId,
    required this.deckId,
    required this.deckBaseId,
    required this.contentHTML,
    required this.index,
    CardCoverModel? cover,
  }) : _cover = cover;

  CardCoverModel get cover {
    if (_cover != null) {
      return _cover;
    } else {
      return CardCoverModel.init();
    }
  }

  // Convert a Movie object into a Map object
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
      'gameId': gameId,
      'deckId': deckId,
      'deckBaseId': deckBaseId,
      'contentHTML': contentHTML,
      'index': index,
      'cover': _cover?.toMap()
    };
  }

  factory CardModel.fromMap(Map<String, dynamic> map) {
    return CardModel(
      id: map['id'],
      content: map['content'],
      gameId: map['gameId'],
      deckId: map['deckId'],
      deckBaseId: map['deckBaseId'],
      contentHTML: map['contentHTML'],
      index: map['index'],
      cover: map['cover'] != null ? CardCoverModel.fromMap(map['cover']) : null,
    );
  }

  factory CardModel.fromMapCover(Map<String, dynamic> map,
      {required DeckModel deck}) {
    return CardModel(
      id: map['id'],
      content: map['content'],
      gameId: map['gameId'],
      deckId: map['deckId'],
      deckBaseId: map['deckBaseId'],
      contentHTML: map['contentHTML'],
      index: map['index'],
      cover: map['cover'] != null
          ? CardCoverModel.fromMap(map['cover'])
          : deck.cardCover,
    );
  }
}
