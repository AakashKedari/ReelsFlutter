import 'package:card_swiper/card_swiper.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:reelsapp/customWidgets/Options.dart';
import 'package:reelsapp/customWidgets/videoContent.dart';
import 'package:video_player/video_player.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
late VideoPlayerController _controller;


  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
        'assets/1.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {

          });
          _controller.play();
      });

  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Stack(
            children : [
              PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 5,
                itemBuilder: (context,index) {
                     _controller = VideoPlayerController.asset(
                        'assets/${index+1}.mp4')
                      ..initialize().then((_) {
                        _controller.play();
                        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
                      });
                     return InkWell(
                       onTap: (){
                         _controller.pause();
                         },
                       onDoubleTap: (){
                         _controller.play();
                       },
                       child: AspectRatio(
                           aspectRatio: _controller.value.aspectRatio,
                           child: VideoPlayer(_controller)
                       ),
                     );
                }
              ),

                      Padding(
                padding:  EdgeInsets.fromLTRB(Get.width * 0.05, Get.width * 0.05, Get.width * 0.05, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ShortZ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Icon(Icons.camera_alt,color: Colors.white,),
                  ],
                ),
              ),
                      OptionsScreen(textColour: Colors.white, isLiked: false),
            ]
          )
        ),
      );

  }

}
