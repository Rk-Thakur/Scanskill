import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_learning_app/core/constants/color.dart';

import 'package:online_learning_app/core/ui/k_text_form_field.dart';
import 'package:online_learning_app/features/homepage/models/quiz_model.dart';
import 'package:online_learning_app/features/homepage/widgets/data.dart';
import 'package:online_learning_app/features/authentication/view/loginPage.dart';

class QuizPlayScreen extends StatefulWidget {
  QuizPlayScreen({Key? key, required this.name}) : super(key: key);
  late String name;

  @override
  State<QuizPlayScreen> createState() => _QuizPlayScreenState();
}

class _QuizPlayScreenState extends State<QuizPlayScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Text(widget.name),
          Expanded(child: const QuestionWidget()),
        ],
      ),
    );
  }
}

class isLogin {
  static bool isLogged = true;
  static bool isLoggedIn = false;
}

class ConfirmationPage extends StatefulWidget {
  const ConfirmationPage({Key? key}) : super(key: key);

  @override
  State<ConfirmationPage> createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  late bool isConfirmed = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: AnimatedContainer(
              curve: Curves.easeInCubic,
              duration: Duration(milliseconds: 500),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: containerColor,
              ),
              width: 300.w,
              height: isConfirmed ? 400.h : 170.h,
              child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Text(
                        '📓🔖👨🏻‍🎓',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        'IQ Test',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        'Test your knowledge to get rewards',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 30,
                            width: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: unselectedColor),
                            child: const Icon(
                              FontAwesomeIcons.xmark,
                              color: Colors.white,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isConfirmed = !isConfirmed;
                              });
                            },
                            child: Container(
                              height: 30,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: selectedColor,
                              ),
                              child: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginWidget extends StatefulWidget {
  const LoginWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: MediaQuery.of(context).padding.top + 16.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.bounceIn,
            width: double.infinity,
            height: 430.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: containerColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome! \nSign in to Continue",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Form(
                            key: formKey,
                            child: Column(
                              children: [
                                KTextFormField(
                                  label: "",
                                  hint: "example@example.com",
                                  keyboardType: TextInputType.emailAddress,
                                  controller: emailController,
                                  validator: (value) {
                                    return RegExp(
                                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                            .hasMatch(value!)
                                        ? null
                                        : "Please enter valid email.";
                                  },
                                ),
                                KTextFormField(
                                  label: "",
                                  obscureText: true,
                                  // desc:
                                  //     "It must contain atleast 1 uppercase, 1 special character, 1 numeric number and minimum of 8 characters.",
                                  hint: "Password",
                                  controller: passwordController,
                                  validator: (value) {
                                    RegExp regex = RegExp(
                                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                                    if (value!.isEmpty) {
                                      return 'Please enter password';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: InkWell(
                                    onTap: () {},
                                    child: Text(
                                      "Forget Password?",
                                      style: TextStyle(
                                        color: primaryColor,
                                        fontFamily: "Poppins",
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          InkWell(
                            onTap: () async {
                              // FocusScope.of(context).unfocus();
                              // if (!formKey.currentState!.validate()) {
                              //   return;
                              // }
                              isLogin.isLogged = true;
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 14.h),
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(8.sp)),
                              child: Center(
                                  child: Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  height: 1.2,
                                  color: Color(0xffFFFFFF),
                                ),
                              )),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Wrap(
                                  alignment: WrapAlignment.center,
                                  children: [
                                    Text(
                                      "Don't have ScanSkill Account?   ",
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xff1C1B1F),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Text(
                                        "Sign Up",
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                          color: primaryColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                InkWell(
                                  onTap: () async {
                                    FocusScope.of(context).unfocus();
                                    if (!formKey.currentState!.validate()) {
                                      return;
                                    }
                                  },
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 14.h),
                                    decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(8.sp)),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            FontAwesomeIcons.google,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 15.w,
                                          ),
                                          Text(
                                            "Sign in with Google",
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              height: 1.2,
                                              color: const Color(0xffFFFFFF),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({Key? key}) : super(key: key);

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  int _questionNumber = 1;
  int score = 0;
  bool _isLocked = false;
  late bool isConfirmed = false;
  late PageController _controller;
  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          isConfirmed
              ? Column(
                  children: [
                    SizedBox(
                      height: 32.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
                      child: Container(
                          width: 500.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: containerColor,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(right: 12.sp, top: 10.sp),
                            child: Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  'Questions: $_questionNumber / ${questions.length}',
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                          )),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                )
              : SizedBox.fromSize(),
          Center(
            child: AnimatedContainer(
                curve: Curves.easeInCubic,
                duration: const Duration(milliseconds: 500),
                width: isConfirmed ? 500.w : 300.w,
                height: isConfirmed ? 420.h : 170.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: containerColor,
                ),
                child: Padding(
                    padding: EdgeInsets.only(left: 10.sp, right: 10.sp),
                    child: isConfirmed
                        ? PageView.builder(
                            controller: _controller,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: questions.length,
                            itemBuilder: (context, index) {
                              final _question = questions[index];
                              return buildQuestion(_question);
                            })
                        : Center(child: _confirm()))),
          ),
          _isLocked ? buildElevatedButton() : SizedBox.fromSize(),
        ],
      ),
    );
  }

  Column _confirm() {
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        Text(
          '📓🔖👨🏻‍🎓',
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        Text(
          'IQ Test',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        Text(
          'Test your knowledge to get rewards',
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 30,
              width: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: unselectedColor),
              child: const Icon(
                FontAwesomeIcons.xmark,
                color: Colors.white,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isConfirmed = true;
                });
              },
              child: Container(
                height: 30,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: selectedColor,
                ),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Column buildQuestion(Question question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 32,
        ),
        Text(
          question.text,
          style: const TextStyle(fontSize: 25),
        ),
        const SizedBox(
          height: 32,
        ),
        Expanded(
            child: OptionsWidget(
          question: question,
          onClickedOption: (option) {
            if (question.isLocked) {
              return;
            } else {
              setState(() {
                question.isLocked = true;
                question.selectedOption = option;
              });
              _isLocked = question.isLocked;
              if (question.selectedOption!.isCorrect) {
                score++;
              }
            }
          },
        ))
      ],
    );
  }

  ElevatedButton buildElevatedButton() {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(selectedColor)),
      onPressed: () {
        if (_questionNumber < questions.length) {
          _controller.nextPage(
            duration: Duration(milliseconds: 250),
            curve: Curves.easeInExpo,
          );
          setState(() {
            _questionNumber++;
            _isLocked = false;
          });
        } else {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  title: Text(
                    "Total Score: $score ✌🏻",
                  ),
                  contentTextStyle: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: textColor,
                  ),
                  content: const Text(
                      "Feel Free to provide FeedBack so that we could provide you a best content!!!"),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(50, 50),
                            primary: selectedColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            )),
                        // style: ButtonStyle(
                        //     backgroundColor:
                        //         MaterialStateProperty.all(selectedColor)),
                        onPressed: () {
                          // isConfirmed = false;
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          "OK",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                );
              });
        }
      },
      child: Text(
          _questionNumber < questions.length ? 'Next Page' : 'See the Result'),
    );
  }
}

class OptionsWidget extends StatelessWidget {
  const OptionsWidget(
      {Key? key, required this.question, required this.onClickedOption})
      : super(key: key);
  final Question question;
  final ValueChanged<Option> onClickedOption;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: question.options
          .map((option) => buildOption(context, option))
          .toList(),
    ));
  }

  Widget buildOption(BuildContext context, Option option) {
    final color = getColorOption(option, question);
    return GestureDetector(
      onTap: () => onClickedOption(option),
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 8),
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              option.text,
              style: const TextStyle(fontSize: 20),
            ),
            getIconForOption(option, question),
          ],
        ),
      ),
    );
  }

  Color getColorOption(Option option, Question question) {
    final isSelected = option == question.selectedOption;
    if (question.isLocked) {
      if (isSelected) {
        return option.isCorrect ? Colors.green : Colors.red;
      } else if (option.isCorrect) {
        return Colors.green;
      }
    }
    return Colors.grey.shade300;
  }

  Widget getIconForOption(Option option, Question question) {
    final isSelected = option == question.selectedOption;
    if (question.isLocked) {
      if (isSelected) {
        return option.isCorrect
            ? const Icon(
                Icons.check_circle,
                color: Colors.green,
              )
            : const Icon(
                Icons.cancel,
                color: Colors.red,
              );
      } else if (option.isCorrect) {
        return const Icon(
          Icons.check_circle,
          color: Colors.green,
        );
      }
    }
    return const SizedBox.shrink();
  }
}
