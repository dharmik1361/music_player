import 'package:flutter/material.dart';
import 'package:music_player/View/widget/video_container.dart';

class Library extends StatefulWidget {
  const Library({Key? key}) : super(key: key);

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              ClickableImage(
                imageAsset:
                    "https://storage.googleapis.com/gtv-videos-bucket/sample/images/BigBuckBunny.jpg",
                videoUrl:
                    "https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
              ),
              ClickableImage(
                imageAsset:
                    "https://storage.googleapis.com/gtv-videos-bucket/sample/images/ElephantsDream.jpg",
                videoUrl:
                    "https://storage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
              ),
              ClickableImage(
                imageAsset:
                "https://storage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerBlazes.jpg",
                videoUrl:
                "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
              ),
              ClickableImage(
                imageAsset:
                "https://storage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerEscapes.jpg",
                videoUrl:
                "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
