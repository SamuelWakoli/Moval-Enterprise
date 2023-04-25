import 'package:flutter/material.dart';

class QuizAnswers extends StatefulWidget {
  const QuizAnswers({Key? key}) : super(key: key);

  @override
  State<QuizAnswers> createState() => _QuizAnswersState();
}

class _QuizAnswersState extends State<QuizAnswers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Q&A"),
      ),
    );
  }
}
