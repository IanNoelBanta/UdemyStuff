import 'package:flutter/material.dart';
import 'package:adv_basics/intro_greeting.dart';

class BackgroundColor extends StatelessWidget {
  const BackgroundColor({super.key});

  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.purple),
      child: const Center(
        child: IntroGreeting()
      )
    );
  }
}