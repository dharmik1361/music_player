// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_player/View/Tab_Widget/Home.dart';
import 'package:music_player/View/Tab_Widget/library.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class MusicHome extends StatefulWidget {
  const MusicHome({Key? key}) : super(key: key);

  @override
  State<MusicHome> createState() => _MusicHomeState();
}

class _MusicHomeState extends State<MusicHome> {
  int _selectedScreenIndex = 0;
  StreamController<bool> _connectionStatusController = StreamController<bool>();

  Stream<bool> get connectionStatusStream => _connectionStatusController.stream;

  Future<void> _updateConnection() async {
    final connetivityResult = await Connectivity().checkConnectivity();
    _connectionStatusController
        .add(connetivityResult != ConnectivityResult.none);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _updateConnection();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      _connectionStatusController.add(result != ConnectivityResult.none);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff8E0E00),
        elevation: 0,
        actions: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: SvgPicture.asset("assets/image/yt.svg"),
              ),
              SizedBox(width: 170),
              Icon(Icons.cast, color: Colors.white),
              SizedBox(width: 30),
              Icon(Icons.search_rounded, color: Colors.white),
              SizedBox(width: 20),
              Icon(Icons.person, color: Colors.white),
            ],
          ),
        ],
      ),
      body: StreamBuilder(
        stream: connectionStatusStream,
        initialData: true,
        builder: (context, snapshot) {
          final isConnect = snapshot.data ?? false;

          if (isConnect) {
            return _selectedScreenIndex == 0
                ? Home() // Display Home screen when index is 0
                : Library();
          } else {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    "Connect to the Internet",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontSize: 25),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CircularProgressIndicator(
                    color: Colors.redAccent,
                  )
                ],
              ),
            );
          }
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xff1F1C18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.audiotrack_outlined),
              color: _selectedScreenIndex == 0 ? Colors.white : Colors.grey,
              onPressed: () {
                setState(() {
                  _selectedScreenIndex = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.video_camera_back_outlined),
              color: _selectedScreenIndex == 1 ? Colors.white : Colors.grey,
              onPressed: () {
                setState(() {
                  _selectedScreenIndex = 1;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
