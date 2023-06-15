class QuestionModel {
  Object? id;
  String questionText;
  List<String> optionsList;
  String correctAnswerText;

  QuestionModel({
    this.id,
    required this.questionText,
    required this.optionsList,
    required this.correctAnswerText,
  });

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    final options = map["optionsList"] as List<String>;
    options.shuffle();
    return QuestionModel(
      questionText: map["questionText"],
      optionsList: options,
      correctAnswerText: map["correctAnswerText"],
    );
  }
}
