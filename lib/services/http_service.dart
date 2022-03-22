import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_app/models/question.dart';
extension QuestionExt on Question {
  static fromJson(Map<String, dynamic> json) {
    return Question(
      caption: json['caption'],
      answers: json["answers"],
      correctAnswerIndex: json["correct_answer_index"],
      hint: json["hint"],
    );
  }
}
class HttpService {
  Future<Question> fetchQuestion() async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:4567/questions/next'));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return QuestionExt.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
