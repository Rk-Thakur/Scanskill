import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_learning_app/core/constants/color.dart';
import 'package:online_learning_app/features/homepage/models/story_model.dart';
import 'package:online_learning_app/features/homepage/models/user_model.dart';

import '../models/quiz_model.dart';
import '../view/homePage.dart';

List<Butttontype> button = [
  Butttontype(icon: FontAwesomeIcons.aws, name: 'AWS'),
  Butttontype(icon: FontAwesomeIcons.server, name: 'Backend'),
  Butttontype(icon: FontAwesomeIcons.infinity, name: 'DevOps'),
  Butttontype(icon: FontAwesomeIcons.tv, name: 'FrontEnd'),
  Butttontype(icon: FontAwesomeIcons.js, name: 'JavaScript'),
  Butttontype(icon: FontAwesomeIcons.puzzlePiece, name: 'MicroServices'),
  Butttontype(icon: FontAwesomeIcons.mobileScreenButton, name: 'Mobile'),
  Butttontype(icon: FontAwesomeIcons.code, name: 'Programming'),
  Butttontype(icon: FontAwesomeIcons.magnifyingGlassDollar, name: 'SEO'),
  Butttontype(icon: FontAwesomeIcons.t, name: 'TypeScript'),
  Butttontype(icon: FontAwesomeIcons.wordpress, name: 'Wordpress'),
];

List<CourseType> course = [
  CourseType(
    icon: Icon(
      FontAwesomeIcons.ghost,
      color: iconColor,
    ),
    courseTitle: 'Graphic Design',
    courseCompleted: 64,
    courseDescription: 'A Journey to \n Excellence.',
  ),
  CourseType(
    icon: Icon(
      FontAwesomeIcons.ghost,
      color: iconColor,
    ),
    courseTitle: 'Graphic Design',
    courseCompleted: 64,
    courseDescription: 'A Journey to \n Excellence.',
  ),
  CourseType(
    icon: Icon(
      FontAwesomeIcons.ghost,
      color: iconColor,
    ),
    courseTitle: 'Graphic Design',
    courseCompleted: 64,
    courseDescription: 'A Journey to \n Excellence.',
  ),
  CourseType(
    icon: Icon(
      FontAwesomeIcons.ghost,
      color: iconColor,
    ),
    courseTitle: 'Graphic Design',
    courseCompleted: 64,
    courseDescription: 'A Journey to \n Excellence.',
  ),
  CourseType(
    icon: Icon(
      FontAwesomeIcons.ghost,
      color: iconColor,
    ),
    courseTitle: 'Graphic Design',
    courseCompleted: 64,
    courseDescription: 'A Journey to \n Excellence.',
  ),
  CourseType(
    icon: Icon(
      FontAwesomeIcons.ghost,
      color: iconColor,
    ),
    courseTitle: 'Graphic Design',
    courseCompleted: 64,
    courseDescription: 'A Journey to \n Excellence.',
  ),
  CourseType(
    icon: Icon(
      FontAwesomeIcons.ghost,
      color: iconColor,
    ),
    courseTitle: 'Graphic Design',
    courseCompleted: 64,
    courseDescription: 'A Journey to \n Excellence.',
  ),
  CourseType(
    icon: Icon(
      FontAwesomeIcons.book,
      color: iconColor,
    ),
    courseTitle: 'Copywriter',
    courseCompleted: 32,
    courseDescription: 'A Journey to \n Excellence.',
  ),
  CourseType(
    icon: Icon(
      FontAwesomeIcons.ghost,
      color: iconColor,
    ),
    courseTitle: 'Graphic Design',
    courseCompleted: 64,
    courseDescription: 'A Journey to \n Excellence.',
  ),
  CourseType(
    icon: Icon(
      FontAwesomeIcons.book,
      color: iconColor,
    ),
    courseTitle: 'Copywriter',
    courseCompleted: 32,
    courseDescription: 'A Journey to \n Excellence.',
  ),
];

final User user = User(
    name: 'Ranjan Thakur',
    profileImage:
        'https://images.pexels.com/photos/12587265/pexels-photo-12587265.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2');

List<Story> stories = [
  Story(
      url: r"""
      <p>A paragraph with <strong>bold</strong> and <u>underline</u> text.</p>
        <ol>
          <li>List 1</li>
          <li>List 2<ul>
              <li>List 2.1 (nested)</li>
              <li>List 2.2</li>
             </ul>
          </li>
          <li>Three</li>
        </ol>
        <ol>
          <li>List 4</li>
          <li>List 5<ul>
              <li>List 5.1 (nested)</li>
              <li>List 2.5</li>
             </ul>
          </li>
          <li>Six</li>
        </ol>
      <p>What is Lorem Ipsum?</p>
        <h4>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</h4>
      <p>Where does it come from??</p>
        <h4>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</h4>
      
      
      """,
      mediaType: MediaType.html,
      duration: const Duration(seconds: 10),
      user: user),
  Story(
      url: 'I am texting you !!!',
      mediaType: MediaType.text,
      duration: const Duration(seconds: 10),
      user: user),
  Story(
      url:
          'https://joy1.videvo.net/videvo_files/video/free/2019-09/small_watermarked/190828_27_SuperTrees_HD_17_preview.webm',
      mediaType: MediaType.video,
      duration: const Duration(seconds: 10),
      user: user),
  Story(
      url:
          'https://images.pexels.com/photos/12587265/pexels-photo-12587265.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      mediaType: MediaType.image,
      duration: const Duration(seconds: 10),
      user: user),
  Story(
      url:
          'https://images.pexels.com/photos/4108288/pexels-photo-4108288.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      mediaType: MediaType.image,
      duration: const Duration(seconds: 10),
      user: user),
  Story(
      url:
          'https://images.pexels.com/photos/15279711/pexels-photo-15279711.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      mediaType: MediaType.image,
      duration: const Duration(seconds: 10),
      user: user),
  Story(
      url:
          'https://images.pexels.com/photos/8888724/pexels-photo-8888724.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      mediaType: MediaType.image,
      duration: const Duration(seconds: 10),
      user: user),
  Story(
      url: '',
      mediaType: MediaType.quiz,
      // duration: const Duration(seconds: 30),
      user: user),
];

final questions = [
  Question(
    text: 'What is the actually electricity',
    options: [
      Option(text: 'A flow of water', isCorrect: false),
      Option(text: 'A flow of air', isCorrect: false),
      Option(text: 'A flow of electrons', isCorrect: true),
      Option(text: 'A flow of atom', isCorrect: false),
    ],
  ),
  Question(
    text: 'Which is not an International Organizaiton',
    options: [
      Option(text: 'FIFA', isCorrect: true),
      Option(text: 'A flow of air', isCorrect: false),
      Option(text: 'A flow of electrons', isCorrect: false),
      Option(text: 'A flow of atom', isCorrect: false),
    ],
  ),
];
