
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/controllers/question_controller.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:my_app/models/question.dart';

class MainPage extends StatelessWidget with GetItMixin{
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var question = watchX((QuestionController q) => q.currentQuestion);
    List<Widget> answers = question.answers as List<Widget>;
    return Container(

      child: Center(child: Column(
          children: 
                answers
              )),
    );
  }
}
