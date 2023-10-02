import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String text;

  const CustomContainer({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () {

        },
        child: Container(
          height: 40,
          width: 100,
          decoration: BoxDecoration(
              color: Colors.transparent.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20)),
          child: Center(
              child: Text(
            text,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
