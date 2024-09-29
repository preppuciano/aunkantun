import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreRepository {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getGames() async {
    final querySnapshot = await db.collection('games').get();
    final docs = querySnapshot.docs;
    return docs.map((doc) => doc.data()).toList();
  }

  Future<void> addGame(Map<String, dynamic> data) async {
    await db.collection('games').add(data);
  }

  Future<void> addDeckBase(
      {required String gameId, required Map<String, dynamic> data}) async {
    await db.collection('games').doc(gameId).collection('base').add(data);
  }

  Future<void> addCard({
    required String gameId,
    required String deckId,
    required Map<String, dynamic> data,
  }) async {
    await db
        .collection('games')
        .doc(gameId)
        .collection('base')
        .doc(deckId)
        .collection('cards')
        .add(data);
  }

  Future<Map<String, dynamic>?> getGameById(String id) async {
    final documentSnapshot = await db.collection('games').doc(id).get();
    final doc = documentSnapshot.data();
    return doc;
  }

  Future<List<Map<String, dynamic>>> getDecksByDeckBaseId(
      {required String gameId, required String deckBaseId}) async {
    final querySnapshot = await db
        .collection('games')
        .doc(gameId)
        .collection('base')
        .doc(deckBaseId)
        .collection('decks')
        .get();
    final docs = querySnapshot.docs;
    return docs.map((doc) => doc.data()).toList();
  }

  Future<List<Map<String, dynamic>>> getDeckBaseByGameId(String gameId) async {
    final querySnapshot =
        await db.collection('games').doc(gameId).collection('base').get();
    final docs = querySnapshot.docs;
    return docs.map((doc) => doc.data()).toList();
  }

  Future<List<Map<String, dynamic>>> getCardsDeckBase(
      {required String gameId, required String deckId}) async {
    final querySnapshot = await db
        .collection('games')
        .doc(gameId)
        .collection('base')
        .doc(deckId)
        .collection('cards')
        .get();
    final docs = querySnapshot.docs;
    return docs.map((doc) => doc.data()).toList();
  }

  Future<List<Map<String, dynamic>>> getCardsDeckCommunity({
    required String gameId,
    required String deckBaseId,
    required String deckCommunityId,
  }) async {
    final querySnapshot = await db
        .collection('games')
        .doc(gameId)
        .collection('base')
        .doc(deckBaseId)
        .collection('decks')
        .doc(deckCommunityId)
        .collection('cards')
        .get();
    final docs = querySnapshot.docs;
    return docs.map((doc) => doc.data()).toList();
  }
}
