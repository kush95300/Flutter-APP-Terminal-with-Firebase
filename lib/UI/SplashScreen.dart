import 'package:Docker/UI/home.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      imageSrc: "docker.gif",
      home: my_app(),
      duration: 10000,
      imageSize: 200,
      backgroundColor: Colors.blueAccent,
      text: "DockGRAM",
      textStyle: TextStyle(fontSize: 30),
      textType: TextType.TyperAnimatedText,
    );
  }
}
