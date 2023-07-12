import 'dart:math';
import 'package:flutter/material.dart';

  final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var currentDiceRoll = 2;

  void rollDice() {
    setState(() {
      currentDiceRoll = randomizer.nextInt(6) + 1;
    });
    print(currentDiceRoll);
  }

  @override
  Widget build(context) {
    return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Dice Roller App',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white
                  ),
                ),
                const SizedBox(height: 100),
                Image.asset(
                  'assets/images/dice-$currentDiceRoll.png', 
                  width: 300
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: rollDice,
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(
                      fontSize: 28
                    )
                  ),
                  child: const Text('Roll Dice!')
                )
              ]);
  }
}