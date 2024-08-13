
class Question {
  String? question;
  String? answer;
  String? createdAt;
  String? fullname;

  Question(
      {required this.question,
      required this.answer,
      required this.createdAt,
      required this.fullname});

  Map<String, dynamic> toMap() {
    return {
      'question': question,
      'answer': answer,
      'fullname': fullname,
      'createdAt': createdAt,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
        question: map['question'],
        answer: map['answer'],
        fullname: map['fullname'],
        createdAt: map['createdAt']);
  }
}
