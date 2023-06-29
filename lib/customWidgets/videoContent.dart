import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'Options.dart';

class FeedItem extends StatefulWidget {
  //Url to play video
  PageController _pageController = PageController();
  final String url;
   FeedItem({Key? key, required this.url}) : super(key: key);

  @override
  State<FeedItem> createState() => _FeedItemState();
}

class _FeedItemState extends State<FeedItem> {
  //player controller
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    //initialize player
    initializePlayer(widget.url);
  }

  @override
  void didUpdateWidget(covariant FeedItem oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    initializePlayer(widget.url);
  }

//Initialize Video Player
  void initializePlayer(String url) async {
    final fileInfo = await checkCacheFor(url);
    if (fileInfo == null) {
      _controller = VideoPlayerController.network(url,);
      _controller!.initialize().then((value) {
        cachedForUrl(url);
        setState(() {
          _controller!.play();
        });
      });
    } else {
      final file = fileInfo.file;
      _controller = VideoPlayerController.file(file);
      _controller!.initialize().then((value) {
        setState(() {
          _controller!.play();
        });
      });
    }
  }

//: check for cache
  Future<FileInfo?> checkCacheFor(String url) async {
    final FileInfo? value = await DefaultCacheManager().getFileFromCache(url);
    return value;
  }

//:cached Url Data
  void cachedForUrl(String url) async {
    await DefaultCacheManager().getSingleFile(url).then((value) {

    });
  }

//:Dispose
  @override
  void dispose() {
    if (_controller != null) {
      _controller!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (_controller == null)
        ? const Text('')
        : ((_controller!.value.isInitialized)
        ? Stack(children : [

          InkWell(
              onTap : (){
                _controller!.pause();
              },
              onDoubleTap: (){
                _controller!.play();
              },
              child: VideoPlayer(_controller!)),
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

    ])
        : Center(child: const Text('')));
  }
}



