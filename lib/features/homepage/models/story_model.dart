// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:online_learning_app/features/homepage/models/user_model.dart';

enum MediaType { image, video, text, html, quiz }

class Story {
  final String url;
  final MediaType mediaType;
  final Duration? duration;
  final User user;
  Story({
    required this.url,
    required this.mediaType,
    this.duration,
    required this.user,
  });
}
