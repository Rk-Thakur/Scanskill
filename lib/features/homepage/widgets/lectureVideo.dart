import 'package:flutter/material.dart';
import 'package:online_learning_app/core/constants/color.dart';
import 'package:online_learning_app/features/homepage/widgets/appBarWidget.dart';
import 'package:video_player/video_player.dart';

class LectureVideo extends StatefulWidget {
  const LectureVideo({Key? key}) : super(key: key);

  @override
  State<LectureVideo> createState() => _LectureVideoState();
}

class _LectureVideoState extends State<LectureVideo> {
  late VideoPlayerController videoPlayerController;
  bool isLoaded = false;
  @override
  void initState() {
    videoPlayerController = VideoPlayerController.network(
      'https://joy1.videvo.net/videvo_files/video/free/2019-09/small_watermarked/190828_27_SuperTrees_HD_17_preview.webm',
    )..initialize().then((value) => setState(() {
          isLoaded = true;
        }));
    // videoPlayerController.play();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: appBarWidget(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              isLoaded
                  ? Container(
                      width: videoPlayerController.value.size.width,
                      height: videoPlayerController.value.size.height,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: VideoPlayer(videoPlayerController),
                    )
                  : Center(
                      child: CircularProgressIndicator(
                        color: primaryColor,
                      ),
                    ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            videoPlayerController.play();
                          });
                        },
                        child: Text('Play')),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            videoPlayerController.pause();
                          });
                        },
                        child: Text('Pause')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
