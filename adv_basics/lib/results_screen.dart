import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_summary.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.home, {super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;
  final void Function() home;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }
    return summary;
  }

  List<Color> getAnswerColor() {
    List<Color> answerColor = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      if (questions[i].answers[0] == chosenAnswers[i]) {
        answerColor.add(Colors.blue);
      } else {
        answerColor.add(Colors.pink);
      }
    }
    return answerColor;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
        width: double.infinity,
        child: Container(
            margin: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                      'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
                      style: const TextStyle(
                          color: Color.fromARGB(255, 226, 169, 236),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                ),
                const SizedBox(
                  height: 40,
                ),
                QuestionsSummary(summaryData, getAnswerColor()),
                TextButton(
                    onPressed: () {
                      home();
                    },
                    child: const Text('Restart Quiz!'))
              ],
            )));
  }
}
