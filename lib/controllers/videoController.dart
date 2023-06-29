import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class VController extends GetxController{

  VideoPlayerController? onlineVideoController;

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

  //Initialize Video Player
  void initializePlayer(String url) async {
     final fileInfo = await checkCacheFor(url);
     if (fileInfo == null) {
        onlineVideoController = VideoPlayerController.network(url,);
        onlineVideoController!.initialize().then((value) {
           cachedForUrl(url);
           onlineVideoController!.play();

        });
     } else {
        final file = fileInfo.file;
        onlineVideoController = VideoPlayerController.file(file);
        onlineVideoController!.initialize().then((value) {

        });
     }
  }

}