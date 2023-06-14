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
    return QuestionModel(
      questionText: map["questionText"],
      optionsList: map["optionsList"],
      correctAnswerText: map["correctAnswerText"],
    );
  }
}
