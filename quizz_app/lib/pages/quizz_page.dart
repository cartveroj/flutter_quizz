import 'package:flutter/material.dart';
import 'package:quizz_app/model/list_questions.dart';
import 'package:quizz_app/pages/end_page.dart';
import 'package:quizz_app/pages/result_page.dart';
import 'package:quizz_app/widgets/answer_card.dart';

class QuizzPage extends StatefulWidget {
  const QuizzPage({super.key});

  @override
  State<QuizzPage> createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  int? selectedAnswerIndex;
  int questionIndex = 0;
  int score = 0;

  void pickedAnswerQuestion(int value) {
    selectedAnswerIndex = value;
    final question = questions[questionIndex];
    if (selectedAnswerIndex == question.correctAnswerIndex) {
      score++;
    }
    setState(() {});
  }

  void goToNextQuestion() {
    if (questionIndex < questions.length - 1) {
      questionIndex++;
      selectedAnswerIndex = null;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final pregunta = questions[0];
    bool isLastQuestion = questionIndex == questions.length - 1;
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz Game')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              pregunta.question,
              style: const TextStyle(
                fontSize: 21,
              ),
              textAlign: TextAlign.center,
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: pregunta.options.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: selectedAnswerIndex == null
                        ? () => pickedAnswerQuestion(index)
                        : null,
                    child: AnswerCard(
                        question: pregunta.options[index],
                        isSelected: false,
                        currentIndex: index,
                        correctAnswerIndex: pregunta.correctAnswerIndex,
                        selectedAnswerIndex: 0),
                  );
                }),
            isLastQuestion
                ? FloatingActionButton.extended(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => EndPage()));
                    },
                    label: const Text("Finish"))
                : FloatingActionButton.extended(
                    onPressed: () {
                      selectedAnswerIndex != null ? goToNextQuestion() : null;
                    },
                    label: const Text("Next"))
          ],
        ),
      ),
    );
  }
}
