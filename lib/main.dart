import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player/Provider/asset_music.dart';
import 'package:music_player/Provider/page_index_provider.dart';
import 'package:music_player/Provider/select_song.dart';
import 'package:music_player/Provider/song_provider.dart';
import 'package:music_player/Provider/tab_select.dart';
import 'package:music_player/View/music_splash.dart';
import 'package:music_player/utils/constant.dart';
import 'package:provider/provider.dart';

import 'View/music_home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AssetsAudioPlayer.setupNotificationsOpenAction((notification) {
    return true;
  });
  runApp(MusicPlayer());
}

class MusicPlayer extends StatelessWidget {
  const MusicPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => pageProvider(),
        ),
        ChangeNotifierProvider(create: (context) => AudioPlayerProvider(),),
        ChangeNotifierProvider(create: (context) => SelectedSongProvider(),),
        ChangeNotifierProvider(create: (context) => TabProvider(),),
        ChangeNotifierProvider(create: (context) => SongPlayingStateProvider(),)
      ],
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: Splash,
          routes: {
            Splash: (context) => MusicSplash(),
            homePage: (context) => MusicHome(),
          },
        );
      },
    );
  }
}
