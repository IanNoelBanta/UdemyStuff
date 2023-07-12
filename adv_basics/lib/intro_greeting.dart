import 'package:flutter/material.dart';


class IntroGreeting extends StatelessWidget {
  const IntroGreeting({super.key});
  
  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 275),
        const SizedBox(height: 100),
        const Text(
          'Learn Flutter the fun way!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22
          ),
        ),
        const SizedBox(height: 80),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white
          ),
          child: const Text('Start Quiz!')
        )
      ],
    );
  }
}