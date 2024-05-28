import 'package:flutter/material.dart';
import 'package:quizz_app/model/list_questions.dart';
import 'package:quizz_app/pages/end_page.dart';
import 'package:quizz_app/widgets/answer_card.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int? selectedAnswerIndex;
  int questionIndex = 0;
  int score = 0;

  void pickedAnswer(int value) {
    setState(() {
      selectedAnswerIndex = value;
      final question = questions[questionIndex];
      if (selectedAnswerIndex == question.correctAnswerIndex) {
        score++;
      }
    });
  }

  void goToNextQuestion() {
    if (questionIndex < questions.length - 1) {
      setState(() {
        questionIndex++;
        selectedAnswerIndex = null;
      });
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (_) => EndPage(
                  score: score,
                )),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final pregunta = questions[questionIndex];
    bool isLastQuestion = questionIndex == questions.length - 1;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Quiz Game')),
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
            const SizedBox(height: 16),
            Expanded(
                child: ListView.builder(
              /* shrinkWrap: true, */
              itemCount: pregunta.options.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: selectedAnswerIndex == null
                      ? () => pickedAnswer(index)
                      : null,
                  child: AnswerCard(
                    question: pregunta.options[index],
                    isSelected: selectedAnswerIndex == index,
                    currentIndex: index,
                    correctAnswerIndex: pregunta.correctAnswerIndex,
                    selectedAnswerIndex: selectedAnswerIndex,
                  ),
                );
              },
            )),
            FloatingActionButton.extended(
              onPressed: selectedAnswerIndex != null ? goToNextQuestion : null,
              label: Text(isLastQuestion ? "Finish" : "Next"),
            ),
          ],
        ),
      ),
    );
  }
}
