import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_player/View/music_home.dart';
import 'package:music_player/utils/constant.dart';

class MusicSplash extends StatefulWidget {
  const MusicSplash({super.key});

  @override
  State<MusicSplash> createState() => _MusicSplashState();
}

class _MusicSplashState extends State<MusicSplash> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),() => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MusicHome(),)),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1A1A1A),
      body: Center(
        child: SvgPicture.asset("assets/image/yt.svg",height: 70,width: 70,)
      ),
    );
  }
}
