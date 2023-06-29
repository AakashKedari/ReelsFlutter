import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reelsapp/screens/HomePage.dart';
import 'package:reelsapp/screens/onlineVid.dart';

class DefaultPage extends StatefulWidget {
  const DefaultPage({super.key});

  @override
  State<DefaultPage> createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shortz',style: TextStyle(fontWeight: FontWeight.w500),),
        centerTitle: true,
      ),

      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                elevation: 10,
              ),
              onPressed: (){
            Get.to(MyHomePage());
          }, child: Text('AssetVideos')),
          ElevatedButton(onPressed: (){
            Get.to(
                 OnlindeVideos()
            );
          }, child: Text('OnlineVideos')),
        ],
      ),),
    );
  }
}
