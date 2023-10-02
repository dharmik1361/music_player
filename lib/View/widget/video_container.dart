import 'package:flutter/material.dart';
import 'package:music_player/View/video_play.dart';

class ClickableImage extends StatelessWidget {
  final String imageAsset; // Image asset path
  final String videoUrl; // Video URL

  ClickableImage({Key? key, required this.imageAsset, required this.videoUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Video(
                videoUrl: videoUrl,
              ),
            ),
          );
        },
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.95,
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Image(image: NetworkImage(imageAsset), fit: BoxFit.cover),
            ),
            Text("data",style: TextStyle(color: Colors.white),)
          ],
        ),
      ),
    );
  }
}
