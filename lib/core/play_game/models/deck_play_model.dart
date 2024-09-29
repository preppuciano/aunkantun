import 'dart:math';

import 'package:aukantun/models/card_model.dart';
import 'package:aukantun/models/deck_model/deck_model.dart';

class DeckPlayModel {
  final DeckModel deck;
  final List<CardModel> cards;
  late List<CardModel> cardsRemoved;

  DeckPlayModel({required this.deck, required this.cards}) {
    cardsRemoved = [];
  }

  int get count {
    return cards.length + cardsRemoved.length;
  }

  List<CardModel> get allCards {
    return [...cards, ...cardsRemoved];
  }

  void shuffle() {
    var random = Random();
    for (var i = cards.length - 1; i > 0; i--) {
      var j = random.nextInt(i + 1);
      var temp = cards[i];
      cards[i] = cards[j];
      cards[j] = temp;
    }
  }

  void removeCard(CardModel card) {
    cards.removeWhere((e) => e.id == card.id);
    cardsRemoved.add(card);
  }

  void reset() {
    cards.addAll(cardsRemoved);
    cardsRemoved.clear();
  }

  void sort() {
    cards.sort((a, b) => a.index.compareTo(b.index));
  }

  void info() {
    print('🃏 count cards: ${cards.length}');
    print('🃏 count cards removed: ${cardsRemoved.length}');
  }
}
