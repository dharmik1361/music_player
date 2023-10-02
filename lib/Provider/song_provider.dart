import 'package:flutter/material.dart';

class SongPlayingStateProvider extends ChangeNotifier {
  bool _isPlaying = false;

  bool get isPlaying => _isPlaying;

  void setIsPlaying(bool playing) {
    _isPlaying = playing;
    notifyListeners();
  }
}
