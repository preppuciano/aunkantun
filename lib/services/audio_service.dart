import 'package:aukantun/config/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioService with ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> initialize() async {
    // Cargar la música desde un archivo local o una URL
    await _audioPlayer.setAsset(AppAssets.soundBackground);
    // await _audioPlayer.setUrl(
    //     'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3');

    // Reproducir en bucle
    _audioPlayer.setVolume(0.3);
    _audioPlayer.setLoopMode(LoopMode.one);
    // Iniciar la reproducción
    await _audioPlayer.play();
  }

  AudioPlayer get audioPlayer => _audioPlayer;

  Future<void> play() async {
    await _audioPlayer.play();
  }

  Future<void> pause() async {
    await _audioPlayer.pause();
  }

  Future<void> stop() async {
    await _audioPlayer.stop();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
