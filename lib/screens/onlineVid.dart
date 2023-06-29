
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reelsapp/controllers/videoController.dart';
import 'package:reelsapp/customWidgets/videoContent.dart';
import '../services/videoAPIs.dart';
import '../customWidgets/Options.dart';

class OnlindeVideos extends StatefulWidget {
  const OnlindeVideos({super.key});

  @override
  State<OnlindeVideos> createState() => _OnlindeVideosState();
}

class _OnlindeVideosState extends State<OnlindeVideos> {

  // Initialising VController instance first time
   VController vController = Get.put(VController());

   // When we pull down the refresh widget
  Future<void> _refreshData() async {
    await Future.delayed(Duration(seconds: 2));
     vController.assignRandomSetIndexNo();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Scaffold(
          body: Stack(
            children:[
                RefreshIndicator(
                  onRefresh: _refreshData,
                  child: PageView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: urlSet[vController.setIndexNo.value].length,
                  itemBuilder: (context, index){
                     return Obx( () =>  FeedItem(url: urlSet[vController.setIndexNo.value][index]));
                                                },),),
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
            ],
          ),
        ),
      ),
    );
  }
}
