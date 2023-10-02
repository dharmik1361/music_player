  // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

  import 'package:carousel_slider/carousel_slider.dart';
  import 'package:flutter/material.dart';
  import 'package:assets_audio_player/assets_audio_player.dart';
  import 'package:marquee/marquee.dart';
  import 'package:music_player/View/widget/Custom_listtile.dart';
  import 'package:music_player/View/widget/circle_song.dart';

  import '../widget/top_app_widget.dart';

  List<Audio> files = [
    Audio(
      "assets/music/dj.mp3",
      metas: Metas(
          title: "Dil Jhoom",
          artist: "Mithoon and Arijit",
          album: "Gadar 2",
          image: MetasImage.asset("assets/image/DJ.jpg")),
    ),
    Audio(
      "assets/music/ch.mp3",
      metas: Metas(
          title: "Chaleya",
          artist: "Arijit",
          album: "Jawan",
          image: MetasImage.asset("assets/image/CH.jpg")),
    ),
    Audio(
      "assets/music/jm.mp3",
      metas: Metas(
          title: "Jind Meriye",
          artist: "Sachet Tandon",
          album: "Jeressy",
          image: MetasImage.asset("assets/image/JM.jpg")),
    ),
    Audio(
      "assets/music/sr.mp3",
      metas: Metas(
          title: "Sang Rahiyo",
          artist: "Ranveer Alahbadiya",
          album: "Sang Rahiyo",
          image: MetasImage.asset("assets/image/SR.jpg")),
    ),
    Audio(
      "assets/music/tm.mp3",
      metas: Metas(
          title: "Tum Mile",
          artist: "Atif",
          album: "murder",
          image: MetasImage.asset("assets/image/TM.jpg")),
    ),
    Audio(
      "assets/music/akds.mp3",
      metas: Metas(
          title: "Abhi Kuch Dino Se ",
          artist: "Mohit Chauhan",
          album: "Dil To bachha Hai",
          image: MetasImage.asset("assets/image/AKDS.jpg")),
    ),
    Audio(
      "assets/music/knph.mp3",
      metas: Metas(
          title: "Kaho Na Pyaar Hai",
          artist: "Madhoor Sharma",
          album: "murder",
          image: MetasImage.asset("assets/image/KNPH.jpg")),
    ),
    Audio(
      "assets/music/heeriye.mp3",
      metas: Metas(
          title: "Heeriye",
          artist: "Arijit",
          album: "Heeriye",
          image: MetasImage.asset("assets/image/HE.jpg")),
    ),
    Audio(
      "assets/music/th2.mp3",
      metas: Metas(
          title: "Teri Hogiyaa 2",
          artist: "Vishal Mishra",
          album: "Broken With Beautiful",
          image: MetasImage.asset("assets/image/TH2.jpg")),
    ),
    Audio(
      "assets/music/ypnkh.mp3",
      metas: Metas(
          title: "Ye Pyaar Nahi To Kya Hai",
          artist: "Rahul Jain",
          album: "Ye Pyaar Nahi To Kya Hai",
          image: MetasImage.asset("assets/image/YPNTK.jpg")),
    ),
  ];

  class Home extends StatefulWidget {
    const Home({Key? key}) : super(key: key);

    @override
    _HomeState createState() => _HomeState();
  }

  class _HomeState extends State<Home> {
    late AssetsAudioPlayer _assetsAudioPlayer;
    int currentSongIndex = 0; // current song index

    @override
    void initState() {
      super.initState();
      _assetsAudioPlayer = AssetsAudioPlayer.newPlayer();

      // Load the first song initially
      _assetsAudioPlayer.open(
        Playlist(audios: files),
        autoStart: false, // Don't auto-play initially
      );
    }

    void _playSong(int index) {
      _assetsAudioPlayer.open(
        Playlist(
          audios: [files[index]],
        ),
        autoStart: true, // Auto-play the selected song
        showNotification: true,
      );
    }

    void _showCustomBottomSheet(
      BuildContext context,
      Audio audio,
    ) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          _assetsAudioPlayer.open(
            Playlist(audios: [audio]),
            autoStart: true, // Auto-play the selected song
          );
          currentSongIndex = files.indexOf(audio);
          _playSong(currentSongIndex);

          return Container(
            height: MediaQuery.sizeOf(context).height * 0.9,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff8E0E00),
                  Color(0xff1F1C18),
                ]
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 20,
                ),
                StreamBuilder(
                    stream: _assetsAudioPlayer.current,
                    builder: (context, snapshot) {
                      return SizedBox(
                        height: 30,
                        width: MediaQuery.sizeOf(context).width * 0.5,
                        child: Marquee(
                          text: files[currentSongIndex].metas.title ?? "",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          blankSpace: 5,
                          pauseAfterRound: Duration(seconds: 1),
                        ),
                      );
                    }),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Container(
                    height: 150,
                    width: 150,
                    child: StreamBuilder(
                        stream: _assetsAudioPlayer.current,
                        builder: (context, snapshot) {
                          return Image.asset(
                              files[currentSongIndex].metas.image?.path ?? "");
                        }),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                StreamBuilder(
                    stream: _assetsAudioPlayer.current,
                    builder: (context, snapshot) {
                      return Text(files[currentSongIndex].metas.artist ?? "",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold));
                    }),
                SizedBox(
                  height: 30,
                ),
                StreamBuilder<Duration?>(
                  stream: _assetsAudioPlayer.currentPosition,
                  builder: (context, snapshot) {
                    Duration duration = snapshot.data ?? Duration(seconds: 0);
                    return Column(
                      children: [
                        Slider(
                          value: duration.inSeconds.toDouble(),
                          min: 0,
                          max: (_assetsAudioPlayer
                                      .current.value?.audio.duration.inSeconds ??
                                  0)
                              .toDouble(),
                          onChanged: (value) {
                            _assetsAudioPlayer
                                .seek(Duration(seconds: value.toInt()));
                          },
                          activeColor: Colors.white,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  "${duration.inMinutes % 60}:${duration.inSeconds % 60}"),
                              Text(
                                  "${_assetsAudioPlayer.current.value?.audio.duration.inMinutes ?? 0.0}")
                            ],
                          ),
                        )
                      ],
                    );
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.loop),
                      ),
                      IconButton(
                        onPressed: () {
                          if (currentSongIndex > 0) {
                            currentSongIndex--;
                          } else {
                            currentSongIndex = files.length - 1;
                          }
                          _playSong(currentSongIndex);
                        },
                        icon: Icon(Icons.skip_previous),
                      ),
                      StreamBuilder<bool>(
                        stream: _assetsAudioPlayer.isPlaying,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            bool isPlaying = snapshot.data ?? false;
                            return FloatingActionButton(
                              backgroundColor: Colors.black,
                                child:
                                    Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                                onPressed: () {
                                  _assetsAudioPlayer.playOrPause();
                                });
                          } else {
                            return Text("no content");
                          }
                        },
                      ),
                      IconButton(
                        onPressed: () {
                          if (currentSongIndex < files.length - 1) {
                            currentSongIndex++;
                          } else {
                            currentSongIndex = 0;
                          }
                          _playSong(currentSongIndex);
                        },
                        icon: Icon(Icons.skip_next),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.repeat),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,)
              ],
            ),
          );
        },
      );
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Container(
                height: MediaQuery.sizeOf(context).height * 1.1,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0xff8E0E00),
                    Color(0xff1F1C18),
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          CustomContainer(
                            text: "Relex",
                          ),
                          CustomContainer(
                            text: "Commute",
                          ),
                          CustomContainer(
                            text: "Focus",
                          ),
                          CustomContainer(
                            text: "Energise",
                          ),
                          CustomContainer(
                            text: "Romance",
                          ),
                          CustomContainer(
                            text: "Sleep",
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: files.length > 5 ? 5 : files.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  final audio = files[index];
                                  return CustomCircle(
                                    imagePath: audio.metas.image?.path ?? "",
                                    text: audio.metas.title ?? "",
                                    audioPath: audio.path,
                                    OnPressed: () {
                                      _showCustomBottomSheet(context, audio);
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: files.length - 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final audio = files[index + 5];
                            return CustomCircle(
                              imagePath: audio.metas.image?.path ?? "",
                              text: audio.metas.title ?? "",
                              audioPath: audio.path,
                              OnPressed: () {
                                _showCustomBottomSheet(context, audio);
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "START RADIO BASED ON A SONG",
                            style: TextStyle(
                                color: Color(0xffA7A7A7),
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Quick Picks",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                        ),
                      ],
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                        height: MediaQuery.sizeOf(context).height * 0.5,
                        autoPlay: false,
                        enlargeCenterPage: false,
                        enableInfiniteScroll: false,
                      ),
                      items: [
                        Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: files.length > 5 ? 5 : files.length,
                                itemBuilder: (context, index) {
                                  final audio = files[index];
                                  return CustomeListTile(
                                    imagepath: audio.metas.image?.path ?? "",
                                    Title: audio.metas.title ?? "",
                                    Subtitle: audio.metas.artist ?? "",
                                    OnTap: () {
                                      _showCustomBottomSheet(context, audio);
                                    },
                                    audioPath: audio.path,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount:
                                    files.length - 5 > 5 ? 5 : files.length - 5,
                                itemBuilder: (context, index) {
                                  final audio = files[index + 5];
                                  return CustomeListTile(
                                    imagepath: audio.metas.image?.path ?? "",
                                    Title: audio.metas.title ?? "",
                                    Subtitle: audio.metas.artist ?? "",
                                    OnTap: () {
                                      _showCustomBottomSheet(context, audio);
                                    },
                                    audioPath: audio.path,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.20,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff8E0E00),
                        Color(0xff1F1C18),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter
                    )
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          StreamBuilder(
                              stream: _assetsAudioPlayer.current,
                              builder: (context, snapshot) {
                                return Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        files[currentSongIndex].metas.image?.path ?? "",
                                      ),
                                    ),
                                    color: Colors.black,
                                  ),
                                );
                              }
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              StreamBuilder(
                                  stream: _assetsAudioPlayer.current,
                                  builder: (context, snapshot) {
                                    return Text(
                                      files[currentSongIndex].metas.title ?? "",
                                      style: TextStyle(
                                          color: Colors.white, fontWeight: FontWeight.bold),
                                    );
                                  }
                              ),
                              StreamBuilder(
                                  stream: _assetsAudioPlayer.current,
                                  builder: (context, snapshot) {
                                    return Text(
                                      files[currentSongIndex].metas.artist ?? "",
                                      style: TextStyle(color: Colors.white),
                                    );
                                  }
                              ),
                            ],
                          ),
                          SizedBox(width: 20,),
                          StreamBuilder<bool>(
                            stream: _assetsAudioPlayer.isPlaying,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                bool isPlaying = snapshot.data ?? false;
                                return IconButton(
                                  onPressed: () {
                                    _assetsAudioPlayer.playOrPause();
                                  },
                                  icon: isPlaying
                                      ? Icon(Icons.pause,color: Colors.white,)
                                      : Icon(Icons.play_arrow,color: Colors.white,),
                                );
                              } else {
                                return Text("no content");
                              }
                            },
                          ),
                          IconButton(
                            onPressed: () {
                              if (currentSongIndex < files.length - 1) {
                                currentSongIndex++;
                              } else {
                                currentSongIndex = 0;
                              }
                              _playSong(currentSongIndex);
                            },
                            icon: Icon(Icons.skip_next,color: Colors.white,),
                          ),
                        ],
                      ),
                      // StreamBuilder<Duration>(
                      //     stream: _assetsAudioPlayer.currentPosition,
                      //     builder: (context, snapshot) {
                      //       Duration duration = snapshot.data ?? Duration(seconds: 1);
                      //       print("data== ${_assetsAudioPlayer.current.hasValue}");
                      //       return Slider(
                      //         value: duration.inSeconds.toDouble(),
                      //         min: 0,
                      //         max: (_assetsAudioPlayer
                      //             .current.value?.audio.duration.inSeconds ??
                      //             1)
                      //             .toDouble(),
                      //         onChanged: (value) {
                      //           _assetsAudioPlayer
                      //               .seek(Duration(seconds: value.toInt()));
                      //         },
                      //         activeColor: Colors.white,
                      //       );
                      //     }
                      // ),
                    ],
                  ),
                ),
              ),
            )

          ],
        ),
      );
    }

    @override
    void dispose() {
      _assetsAudioPlayer.dispose();
      super.dispose();
    }
  }

