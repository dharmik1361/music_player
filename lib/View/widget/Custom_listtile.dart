import 'package:flutter/material.dart';

class CustomeListTile extends StatelessWidget {
  final String imagepath;
  final String Title;
  final String Subtitle;
  final String audioPath;
  final VoidCallback OnTap;

   CustomeListTile({super.key,required this.imagepath,required this.Title,required this.Subtitle,required this.OnTap,required this.audioPath});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image(image: AssetImage(imagepath),),
      title: Text(Title,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
      subtitle: Text(Subtitle,style: TextStyle(color: Color(0xffA7A7A7)),),
      trailing: IconButton(onPressed: (){},icon: Icon(Icons.more_vert,color: Colors.white,)),
      onTap: OnTap
    );
  }
}
