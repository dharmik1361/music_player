

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class AudioPlayerProvider extends ChangeNotifier {
  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();

  void playAudio(String assetPath) {
    audioPlayer.open(Audio(assetPath));
    audioPlayer.play();
  }

  void pauseAudio() {
    audioPlayer.pause();
  }

  void resumeAudio() {
    audioPlayer.play();
  }

  void stopAudio() {
    audioPlayer.stop();
  }
}
