import 'package:flutter/foundation.dart';

class SelectedSongProvider extends ChangeNotifier {
  String? _selectedSong;

  String? get selectedSong => _selectedSong;

  void setSelectedSong(String song) {
    _selectedSong = song;
    notifyListeners();
  }
}
