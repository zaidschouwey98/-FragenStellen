import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/models/question.dart';
import 'package:my_app/services/http_service.dart';

class QuestionController{
  final currentQuestion = ValueNotifier<Question>(const Question(answers: ["test"],caption: "atea",correctAnswerIndex: 1,hint: "test"));
  List<Question> questionList = [];
  Future<void> getQuestion() async{
    HttpService api = HttpService();
    Question test = await api.fetchQuestion();
    currentQuestion.value = test;
  }
  static void register() {
    GetIt.I.registerLazySingleton(() => QuestionController());
  }
  static QuestionController get instance => GetIt.I.get<QuestionController>();
}