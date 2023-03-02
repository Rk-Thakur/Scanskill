import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:online_learning_app/core/constants/color.dart';
import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  const Video({Key? key}) : super(key: key);

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;
  bool isLoaded = false;

  @override
  void initState() {
    _initPlayer();
    super.initState();
  }

  void _initPlayer() async {
    videoPlayerController = VideoPlayerController.network(
      'https://joy1.videvo.net/videvo_files/video/free/2019-09/small_watermarked/190828_27_SuperTrees_HD_17_preview.webm',
    )..initialize().then((value) => setState(() {
          isLoaded = true;
        }));

    chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        looping: true,
        autoPlay: true,
        showControls: true,
        showOptions: true,
        zoomAndPan: true,
        allowFullScreen: true,
        additionalOptions: (context) {
          return [
            OptionItem(onTap: () {}, iconData: Icons.abc, title: 'Options 1'),
            OptionItem(onTap: () {}, iconData: Icons.abc, title: 'Options 1'),
            OptionItem(onTap: () {}, iconData: Icons.abc, title: 'Options 1'),
          ];
        });
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: chewieController != null
            ? Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Chewie(controller: chewieController!),
              )
            : Center(
                child: CircularProgressIndicator(
                  color: iconColor,
                ),
              ));
  }
}
