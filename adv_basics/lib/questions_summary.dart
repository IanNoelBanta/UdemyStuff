import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, this.answerColor, {super.key});

  final List<Map<String, Object>> summaryData;
  final List<Color> answerColor;

  @override
  Widget build(context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
            children: summaryData.map((data) {
          return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CircleAvatar(
                radius: 15,
                backgroundColor: answerColor[(data['question_index'] as int)],
                child: Text(((data['question_index'] as int) + 1).toString())),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data['question'] as String,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  const SizedBox(height: 5),
                  Text(data['correct_answer'] as String,
                      style: const TextStyle(color: Colors.deepPurpleAccent)),
                  Text(data['user_answer'] as String,
                      style: const TextStyle(color: Colors.lightBlue)),
                  const SizedBox(height: 2)
                ],
              ),
            )
          ]);
        }).toList()),
      ),
    );
  }
}
