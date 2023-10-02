import 'package:flutter/material.dart';

class CustomCircle extends StatelessWidget {
  final String imagePath;
  final String text;
  final String? audioPath;
  final VoidCallback OnPressed;

  CustomCircle(
      {super.key,
      required this.imagePath,
      required this.text,
      required this.OnPressed,
      this.audioPath,
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(
              imagePath,
            ),
            radius: 45,
            child: IconButton(onPressed: OnPressed, icon: Icon(Icons.play_arrow)),
          ),
          SizedBox(height: 5,),
          Text(text,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}
