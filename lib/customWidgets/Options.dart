import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OptionsScreen extends StatefulWidget {
  late Color textColour ;
  bool isLiked;

  OptionsScreen({required this.textColour,required this.isLiked});
  @override
  State<OptionsScreen> createState() => _OptionsScreenState();
}

class _OptionsScreenState extends State<OptionsScreen> {
   bool isliked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.fromLTRB(Get.width * 0.03, 0, Get.width * 0.03, Get.width * 0.05),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: Get.height * 0.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(height: Get.height * 0.15),
                  Row(
                    children: [
                      CircleAvatar(
                        child: Icon(Icons.person, size: 25),
                        radius: 16,
                      ),
                      SizedBox(width: 6),
                      Text('Random User_ 01',style: TextStyle(color: widget.textColour,fontSize: 15),),
                      SizedBox(width: 10),
                      Icon(Icons.verified, size: 20,color: widget.textColour,),
                      SizedBox(width: 6),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Follow',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 6),
                  Text('Flutter is beautiful and fast 💙❤💛 ..',style: TextStyle(color: widget.textColour,),),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        Icons.music_note,
                        size: 15,
                        color: widget.textColour,
                      ),
                      Text('Original Audio - some music track--',style: TextStyle(color: widget.textColour),),
                    ],
                  ),
                ],
              ),

      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

            IconButton(
              onPressed: (){
                if(isliked == false){
                  setState(() {
                    isliked = true;
                  });

                }
                else {
                  setState(() {
                    isliked = false;
                  });

                }
              },
             icon : isliked ?
      Icon(

        Icons.favorite_outlined,color: Colors.red,size: 30,) : Icon(Icons.favorite_outline,color: widget.textColour,)),



          Text('30K',style: TextStyle(color: widget.textColour),),
          SizedBox(height: Get.height * 0.03),
          Icon(Icons.comment_rounded,color: widget.textColour,size: 30,),
          Text('115',style: TextStyle(color: widget.textColour),),
          SizedBox(height: Get.height * 0.03),
          Icon(Icons.send,color: widget.textColour,size: 30,),
          SizedBox(height: Get.height * 0.03),
          Icon(Icons.more_vert,color: widget.textColour,size: 30,),
        ],
      )


            ],
          ),
        ],
      ),
    );
  }
}