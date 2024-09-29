import 'package:aukantun/models/card_model.dart';
import 'package:aukantun/models/deck_model/deck_model.dart';
import 'package:aukantun/models/game_model/game_model.dart';
import 'package:aukantun/repository/firestore_repository.dart';

class DatabaseService {
  late FirestoreRepository _firestoreRepository;
  static DatabaseService? _instance;

  factory DatabaseService() {
    if (_instance != null) {
      return _instance!;
    } else {
      return _instance = DatabaseService._();
    }
  }

  DatabaseService._() : _firestoreRepository = FirestoreRepository();

  Future<List<GameModel>> getGames() async {
    final data = await _firestoreRepository.getGames();
    final games = data.map((e) {
      try {
        return GameModel.fromMap(e);
      } catch (err) {
        print('🐛: $err');
        throw (e['id']);
      }
    }).toList();
    return games;
  }

  Future<void> addGame(GameModel game) async {
    await _firestoreRepository.addGame(game.toMap());
  }

  Future<GameModel> getGameById(String id) async {
    final doc = await _firestoreRepository.getGameById(id);
    if (doc != null) {
      GameModel game = GameModel.fromMap(doc);
      return game;
    } else {
      throw ('Error: The response contains no valid data. The value is null.');
    }
  }

  Future<List<DeckModel>> getDecksBaseByGameId(String gameId) async {
    final data = await _firestoreRepository.getDeckBaseByGameId(gameId);
    final decks = data.map((e) => DeckModel.fromMap(e)).toList();
    return decks;
  }

  Future<List<DeckModel>> getDecksByDeckBaseId(
      {required String gameId, required String deckBaseId}) async {
    final data = await _firestoreRepository.getDecksByDeckBaseId(
        gameId: gameId, deckBaseId: deckBaseId);
    final decks = data.map((e) => DeckModel.fromMap(e)).toList();
    return decks;
  }

  Future<List<CardModel>> getCardsDeckBase(
      {required String gameId, required DeckModel deck}) async {
    final data = await _firestoreRepository.getCardsDeckBase(
        gameId: gameId, deckId: deck.id);
    List<CardModel> decks = [];
    for (var d in data) {
      try {
        final card = CardModel.fromMapCover(d, deck: deck);
        decks.add(card);
      } catch (err) {
        print('🐛: $d');
      }
    }
    return decks;
  }

  Future<List<CardModel>> getCardsDeckCommunity({
    required String gameId,
    required String deckBaseId,
    required DeckModel deckCommunity,
  }) async {
    final data = await _firestoreRepository.getCardsDeckCommunity(
      gameId: gameId,
      deckBaseId: deckBaseId,
      deckCommunityId: deckCommunity.id,
    );
    final decks = data
        .map((e) => CardModel.fromMapCover(e, deck: deckCommunity))
        .toList();
    return decks;
  }

  Future<void> branchGame({required String gameId}) async {
    final dataGame = await _firestoreRepository.getGameById(gameId);

    final refGame = _firestoreRepository.db.collection('games').doc();
    final game = GameModel.fromMap(
        {...dataGame!, 'id': refGame.id, 'main': dataGame['id']});

    await refGame.set(game.toMap());
    print('📄: addGame');

    final dataDeckBase =
        await _firestoreRepository.getDeckBaseByGameId(dataGame['id']);

    for (var i in dataDeckBase) {
      final refDeckBase = _firestoreRepository.db
          .collection('games')
          .doc(game.id)
          .collection('base')
          .doc();

      final deckBase =
          DeckModel.fromMap({...i, 'gameId': game.id, 'id': refDeckBase.id});
      print('🐛');

      await refDeckBase.set(deckBase.toMap());
      print('📄: addDeckBase');

      final cards = await _firestoreRepository.getCardsDeckBase(
          gameId: dataGame['id'], deckId: i['id']);

      for (var j in cards) {
        final refCard = _firestoreRepository.db
            .collection('games')
            .doc(game.id)
            .collection('base')
            .doc(deckBase.id)
            .collection('cards')
            .doc();

        final card = CardModel.fromMap(
            {...j, 'id': refCard.id, 'gameId': game.id, 'deckId': deckBase.id});
        refCard.set(card.toMap());
        print('📄: addCard');
      }
    }
  }
}
