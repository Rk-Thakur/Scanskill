// ignore_for_file: public_member_api_docs, sort_constructors_first
class Question {
  final String text;
  final List<Option> options;
  bool isLocked;
  Option? selectedOption;
  Question({
    required this.text,
    required this.options,
    this.isLocked = false,
    this.selectedOption,
  });
}

class Option {
  final String text;
  final bool isCorrect;
  Option({
    required this.text,
    required this.isCorrect,
  });
}
