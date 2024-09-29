import 'package:aukantun/config/app_assets.dart';
import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

class SoundManager {
  static SoundManager? _instance;
  late Soundpool pool;
  int? primaryButton;
  int? secondaryButton;
  int? tertiaryButton;
  int? switchButton;
  int? ready;

  factory SoundManager() {
    if (_instance != null) {
      return _instance!;
    } else {
      return _instance = SoundManager._();
    }
  }

  SoundManager._() {
    pool = Soundpool(streamType: StreamType.music);
    init();
  }

  Future<void> init() async {
    primaryButton = await rootBundle
        .load(AppAssets.soundButtonPrimary)
        .then((ByteData soundData) => pool.load(soundData));
    secondaryButton = await rootBundle
        .load(AppAssets.soundButtonSecondary)
        .then((ByteData soundData) => pool.load(soundData));
    tertiaryButton = await rootBundle
        .load(AppAssets.soundButtonTertiary)
        .then((ByteData soundData) => pool.load(soundData));
    switchButton = await rootBundle
        .load(AppAssets.soundSwitchButton)
        .then((ByteData soundData) => pool.load(soundData));
    ready = await rootBundle
        .load(AppAssets.soundReady)
        .then((ByteData soundData) => pool.load(soundData));
  }

  void release() {
    pool.release();
  }

  // Reproduce el sonido
  Future<void> playPrimaryButton() async {
    if (primaryButton != null) {
      await pool.play(primaryButton!);
    }
  }

  Future<void> playSecondaryButton() async {
    if (secondaryButton != null) {
      await pool.play(secondaryButton!);
    }
  }

  Future<void> playTertiaryButton() async {
    if (tertiaryButton != null) {
      await pool.play(tertiaryButton!);
    }
  }

  Future<void> playSwitchButton() async {
    if (switchButton != null) {
      await pool.play(switchButton!);
    }
  }

  Future<void> playReady() async {
    if (ready != null) {
      await pool.play(ready!);
    }
  }
}
