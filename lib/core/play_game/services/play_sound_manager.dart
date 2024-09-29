import 'package:aukantun/config/app_assets.dart';
import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

class PlaySoundManager {
  late Soundpool pool;
  int? cardSwipe;
  int? cardsShuffle;
  int? counterdownFinish;
  int? rollingDice;

  PlaySoundManager() {
    pool = Soundpool(streamType: StreamType.music);
    init();
  }

  Future<void> init() async {
    cardSwipe = await rootBundle
        .load(AppAssets.soundCardsSwipe)
        .then((ByteData soundData) => pool.load(soundData));
    cardsShuffle = await rootBundle
        .load(AppAssets.soundCardsShuffle)
        .then((ByteData soundData) => pool.load(soundData));
    counterdownFinish = await rootBundle
        .load(AppAssets.soundCounterdownFinish)
        .then((ByteData soundData) => pool.load(soundData));
    rollingDice = await rootBundle
        .load(AppAssets.soundRollDice)
        .then((ByteData soundData) => pool.load(soundData));
  }

  void release() {
    pool.release();
  }

  // Reproduce el sonido
  Future<void> playCardSwipe() async {
    if (cardSwipe != null) {
      await pool.play(cardSwipe!);
    }
  }

  Future<void> playCardsShuffle() async {
    if (cardsShuffle != null) {
      await pool.play(cardsShuffle!);
    }
  }

  Future<void> playCounterdownFinish() async {
    if (counterdownFinish != null) {
      await pool.play(counterdownFinish!);
    }
  }

  Future<void> playRollingDice() async {
    if (rollingDice != null) {
      await pool.play(rollingDice!);
    }
  }
}
