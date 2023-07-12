import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/results_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // list of user's seected answers
  List<String> selectedAnswers = [];

  // method that lets the user choose an answer then put that in the list of answers
  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  var activeScreen = 'start-screen';

  int iteration = 0;

  // @override
  // void initState() {
  //   activeScreen = 'question-screen';
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });

    print('Switching Screen...');
  }

  void goToHome() {
    setState(() {
      activeScreen = 'home-screen';
    });
  }

  void resetQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(context) {
    // final sreenWidget = activeScreen == 'start-screen' ? StartScreen(switchScreen) : const QuestionsScreen();
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'question-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(resetQuiz, chosenAnswers: selectedAnswers);
    }
    
    return MaterialApp(
        home: Scaffold(
            body: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                      Color.fromARGB(255, 82, 52, 134),
                      Color.fromARGB(255, 105, 37, 221)
                    ])),
                child: screenWidget)));
  }
}
