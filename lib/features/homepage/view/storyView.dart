import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_learning_app/core/constants/color.dart';
import 'package:online_learning_app/features/homepage/bloc/catergory_bloc.dart';
import 'package:online_learning_app/features/homepage/models/category_by_id_content.dart';
import 'package:online_learning_app/features/homepage/models/content_story.dart';
import 'package:online_learning_app/features/homepage/models/story_model.dart';
import 'package:online_learning_app/features/homepage/view/quizPlay.dart';
import 'package:online_learning_app/features/mediaType/htmlType.dart';

import 'package:video_player/video_player.dart';

class StoryViewPage extends StatefulWidget {
  StoryViewPage({Key? key}) : super(key: key);

  @override
  State<StoryViewPage> createState() => _StoryViewPageState();
}

class _StoryViewPageState extends State<StoryViewPage>
    with SingleTickerProviderStateMixin {
  PageController? pageController;
  AnimationController? animationController;
  late VideoPlayerController _videoPlayerController;
  int currentIndex = 0;
  bool isLoaded = true;
  var network = '';
  List<TypeDescription>? content;

  @override
  void didChangeDependencies() {
    final state = context.watch<CategoryBloc>().state;
    if (state.categoryByIdContentStatus == CategoryByIdContentStatus.success) {
      pageController = PageController();
      animationController = AnimationController(vsync: this);

      _videoPlayerController = VideoPlayerController.network(network)
        ..initialize().then((value) => setState(() {
              isLoaded = false;
            }));
      _videoPlayerController.play();
      content = state.categoryByIdContent.data!.typeDescriptions!;
      final TypeDescription firstStory =
          state.categoryByIdContent.data!.typeDescriptions!.first;
      _loadStory(story: firstStory, animatePage: false);
      animationController!.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController!.stop();
          animationController!.reset();
          setState(() {
            if (currentIndex + 1 <
                state.categoryByIdContent.data!.typeDescriptions!.length) {
              currentIndex += 1;
              _loadStory(
                  story: state.categoryByIdContent.data!
                      .typeDescriptions![currentIndex]);
            } else {
              currentIndex = 0;
              _loadStory(
                  story: state.categoryByIdContent.data!
                      .typeDescriptions![currentIndex]);
            }
          });
        }
      });
    }

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    pageController!.dispose();
    animationController!.dispose();
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TypeDescription story = content![currentIndex];

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF8F7F3),
        body: GestureDetector(
          onLongPress: () {
            animationController!.stop();
          },
          // onTapUp: (details) {
          //   print('okay');
          // },
          onLongPressCancel: () {
            setState(() {
              animationController!.forward();
            });
          },
          onTapDown: (details) => _onTapDown(details, story),
          child: Stack(
            children: [
              BlocBuilder<CategoryBloc, CategoryState>(
                builder: (context, state) {
                  if (state.categoryByIdContentStatus ==
                      CategoryByIdContentStatus.loading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: iconColor,
                      ),
                    );
                  }
                  if (state.categoryByIdContentStatus ==
                      CategoryByIdContentStatus.success) {
                    return PageView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: pageController,
                        itemCount: content!.length,
                        itemBuilder: (context, index) {
                          switch (story.type) {
                            case 'image':
                              return CachedNetworkImage(
                                placeholder: (context, url) {
                                  return Center(
                                      child: CircularProgressIndicator(
                                    color: iconColor,
                                  ));
                                },
                                imageUrl: story.imageUrl!,
                                fit: BoxFit.fill,
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                              );
                            case 'video':
                              if (_videoPlayerController != null &&
                                  _videoPlayerController.value.isInitialized) {
                                return isLoaded
                                    ? FittedBox(
                                        fit: BoxFit.fill,
                                        child: SizedBox(
                                          width: _videoPlayerController
                                              .value.size.width,
                                          height: _videoPlayerController
                                              .value.size.height,
                                          child: VideoPlayer(
                                            _videoPlayerController,
                                          ),
                                        ),
                                      )
                                    : CircularProgressIndicator(
                                        color: iconColor,
                                      );
                              }
                              break;
                            case 'article':
                              animationController!.stop();
                              // return Text("Html");
                              return HtmlTypePage(
                                htmlData: story.article,
                              );
                            case 'text':
                              return Center(
                                child: Text("text"),
                              );
                            // return Center(
                            //   child: Text(story.),
                            // );
                            // case MediaType.quiz:
                            //   animationController!.stop();
                            //   return QuizPlayScreen(
                            //     name: story.url,
                            //   );
                          }
                          return const SizedBox.shrink();
                        });
                  } else {
                    return Container();
                  }
                },
              ),
              Positioned(
                  top: 10.0,
                  left: 10.0,
                  right: 10.0,
                  child: Column(
                    children: [
                      Row(
                        children: content!
                            .asMap()
                            .map((i, e) {
                              return MapEntry(
                                i,
                                AnimatedBar(
                                    animationController: animationController!,
                                    position: i,
                                    currentIndex: currentIndex),
                              );
                            })
                            .values
                            .toList(),
                      ),
                      // Padding(
                      //     padding: EdgeInsets.symmetric(
                      //         horizontal: 1.5, vertical: 5.sp),
                      //     child: UserInfo(
                      //       name: widget.name,
                      //     )),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  _onTapDown(TapDownDetails details, TypeDescription story) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double dx = details.globalPosition.dx;
    if (dx < screenWidth / 3) {
      setState(() {
        if (currentIndex - 1 >= 0) {
          currentIndex -= 1;
          _loadStory(story: content![currentIndex]);
        }
      });
    } else if (dx > 2 * screenWidth / 3) {
      setState(() {
        if (currentIndex + 1 < content!.length) {
          currentIndex += 1;
          _loadStory(story: content![currentIndex]);
        }
        // else {
        //   currentIndex = 0;
        //   _loadStory(story: widget.stories[currentIndex]);
        // }
      });
    } else {
      if (story.type == 'video') {
        if (_videoPlayerController.value.isPlaying) {
          _videoPlayerController.pause();
          animationController!.stop();
        } else {
          _videoPlayerController.play();
          animationController!.forward();
        }
      }
    }
  }

  void _loadStory({TypeDescription? story, bool animatePage = true}) {
    animationController!.stop();
    animationController!.reset();
    switch (story!.type) {
      case 'image':
        animationController!.duration = Duration(seconds: 10);
        animationController!.forward();
        break;
      case 'video':
        _videoPlayerController == null;
        _videoPlayerController.dispose();
        _videoPlayerController = VideoPlayerController.network(story.videoUrl!)
          ..initialize().then((value) {
            setState(() {});
            if (_videoPlayerController.value.isInitialized) {
              animationController!.duration =
                  _videoPlayerController.value.duration;
              _videoPlayerController.play();
              animationController!.forward();
            }
          });
        break;
      case 'article':
        animationController!.duration = Duration(seconds: 10);
        animationController!.forward();
        break;
      case 'html':
        animationController!.duration = Duration(seconds: 10);
        animationController!.stop();
        break;
      case 'quiz':
        // animationController!.duration = story.duration;
        animationController!.stop();
        break;
    }
    if (animatePage) {
      pageController!.animateToPage(currentIndex,
          duration: const Duration(milliseconds: 1), curve: Curves.easeInOut);
    }
  }
}

class AnimatedBar extends StatelessWidget {
  final AnimationController animationController;
  final int position;
  final int currentIndex;

  const AnimatedBar({
    Key? key,
    required this.animationController,
    required this.position,
    required this.currentIndex,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flexible(child: LayoutBuilder(builder: (context, contraints) {
      return Stack(
        children: [
          _buildContainer(
            double.infinity,
            position < currentIndex ? iconColor : Colors.white.withOpacity(0.5),
          ),
          position == currentIndex
              ? AnimatedBuilder(
                  animation: animationController,
                  builder: (context, child) {
                    return _buildContainer(
                        contraints.maxWidth * animationController.value,
                        iconColor);
                  })
              // ? Container()
              : const SizedBox.shrink(),
        ],
      );
    }));
  }

  Container _buildContainer(double d, Color color) {
    return Container(
      height: 5.0,
      width: d,
      decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: Colors.black26,
            width: 0.8,
          ),
          borderRadius: BorderRadius.circular(3.0)),
    );
  }
}

class UserInfo extends StatelessWidget {
  final String name;
  const UserInfo({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
            radius: 20.0,
            backgroundColor: containerColor,
            backgroundImage: AssetImage('assets/scanskill.jpeg')),
        const SizedBox(
          width: 10.0,
        ),
        Expanded(
            child: Text(
          name,
          style: const TextStyle(color: Colors.white, fontSize: 18.0),
        )),
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
              size: 30.0,
              color: Colors.white,
            ))
      ],
    );
  }
}
