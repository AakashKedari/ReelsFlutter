import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:reelsapp/customWidgets/videoContent.dart';
import 'package:video_player/video_player.dart';
import '../services/videoAPIs.dart';
import '../customWidgets/Options.dart';

class OnlindeVideos extends StatefulWidget {
  const OnlindeVideos({super.key});

  @override
  State<OnlindeVideos> createState() => _OnlindeVideosState();
}

class _OnlindeVideosState extends State<OnlindeVideos> {
  Random random = new Random();
   int randomNumber =0 ;
  Future<void> _refreshData() async {

    await Future.delayed(Duration(seconds: 2));
      // randomNumber = random.nextInt(3);

    setState(() {
      // Navigator.pop;
      randomNumber = 1;
      print(randomNumber);
    });
  }

  @override
  Widget build(BuildContext context) {

    // randomNumber = random.nextInt(3);
    // print(randomNumber);
    // print(endpoints[randomNumber!]);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children:[
              RefreshIndicator(
                onRefresh: _refreshData,
                child: PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: urlSet[randomNumber].length,
                itemBuilder: (context, index){
                   return FeedItem(url: urlSet[randomNumber][index]);
    },
        //             onPageChanged: (index){
        //
        // }
                ),
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
        ),
      ),
    );
  }


}
