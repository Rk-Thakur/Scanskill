import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_learning_app/core/constants/color.dart';
import 'package:online_learning_app/core/ui/textStyle.dart';
import 'package:online_learning_app/features/login/loginPage.dart';
import 'package:page_transition/page_transition.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  late PageController _pageController;
  int _pagaeIndex = 0;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      PageTransition(
                          type: PageTransitionType.fade, child: LoginPage()),
                    );
                  },
                  child: Text(
                    "Skip",
                    style: textStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: PageView.builder(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    itemCount: demo_data.length,
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _pagaeIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return onBoard(
                          image: demo_data[index].image,
                          title: demo_data[index].title,
                          discription: demo_data[index].description);
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 40,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0)),
                        ),
                        onPressed: () async {
                          _pagaeIndex != demo_data.length
                              ? _pageController.previousPage(
                                  duration: const Duration(microseconds: 300),
                                  curve: Curves.bounceInOut)
                              : Navigator.of(context).push(
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      child: LoginPage()),
                                );
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: iconColor,
                          size: 20.sp,
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ...List.generate(
                          demo_data.length,
                          (index) => Padding(
                                padding: const EdgeInsets.only(right: 4),
                                child: dotIndicator(
                                  isActive: index == _pagaeIndex,
                                ),
                              )),
                    ],
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: selectedColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0)),
                      ),
                      onPressed: () async {
                        _pagaeIndex != demo_data.length - 1
                            ? _pageController.nextPage(
                                duration: const Duration(microseconds: 300),
                                curve: Curves.bounceInOut)
                            : Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.fade,
                                    child: LoginPage()));
                      },
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 20.sp,
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class dotIndicator extends StatelessWidget {
  const dotIndicator({
    Key? key,
    this.isActive = false,
  }) : super(key: key);
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.easeIn,
      duration: const Duration(microseconds: 300),
      height: 11,
      width: isActive ? 20 : 11,
      decoration: BoxDecoration(
        color: isActive ? selectedColor : unselectedColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}

class OnBoard {
  final String image;
  final String title;
  final String description;
  OnBoard({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<OnBoard> demo_data = [
  OnBoard(
      image: 'assets/1.png',
      title: 'Homework Easily',
      description:
          'we are a team of digital and technology superstionists, we are a result deiven software company in the heart of kathmandu.'),
  OnBoard(
    image: 'assets/2.png',
    title: 'Fun Events',
    description:
        'we are a team of digital and technology superstionists, we are a result deiven software company in the heart of kathmandu.',
  ),
  OnBoard(
      image: 'assets/3.png',
      title: 'Timely Notification',
      description:
          'we are a team of digital and technology superstionists, we are a result deiven software company in the heart of kathmandu.'),
];

class onBoard extends StatelessWidget {
  const onBoard({
    Key? key,
    required this.image,
    required this.title,
    required this.discription,
  }) : super(key: key);
  final String image, title, discription;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        const SizedBox(
          height: 15,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            image,
            height: 320.h,
            width: double.infinity,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          title,
          style: textStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.sp,
            color: textColor,
            letterSpacing: .3,
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        Text(
          discription,
          textAlign: TextAlign.center,
          style: textStyle(
            fontSize: 15.sp,
            height: 1.7.h,
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 60.h,
        ),
      ]),
    );
  }
}
