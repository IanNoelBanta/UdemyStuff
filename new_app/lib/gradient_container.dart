import 'package:flutter/material.dart';
import 'package:new_app/dice_roller.dart';
// import 'package:new_app/style_text.dart';

const beginAlignment = Alignment.bottomLeft;
const endAlignment = Alignment.topLeft;

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.color1, this.color2, this.color3, {super.key});

  const GradientContainer.rgb({super.key}) 
    : color1 = Colors.red, 
      color2 = Colors.green, 
      color3 = Colors.blue;

  final Color color1, color2, color3;

  @override
  Widget build(context) {
    return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color1, color2, color3],
              begin: beginAlignment,
              end: endAlignment
            ),
          ),
          child: const Center(
            child: DiceRoller()
            // child: StyleText('Hello World!'),
          ),
    );
  }
}


// ------------------------------------------


// class GradientContainer extends StatelessWidget {
//   const GradientContainer({required this.colors, super.key});

//   const GradientContainer.purple({super.key}) : colors = [Colors.red, Colors.green, Colors.blue];

//   final List<Color> colors;

//   //var currentDice = 'assets/images/dice-1.png';

//   void rollDice() {
//     //currentDice = 'assets/images/dice-5.png';
//     //print('Changing dice...');
//   }

//   @override
//   Widget build(context) {
//     return Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: colors,
//               begin: beginAlignment,
//               end: endAlignment
//             ),
//           ),
//           child: Center(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Image.asset(
//                   'assets/images/dice-1.png', 
//                   width: 300
//                 ),
//                 const SizedBox(height: 20),
//                 TextButton(
//                   onPressed: rollDice,
//                   style: TextButton.styleFrom(
//                     foregroundColor: Colors.white,
//                     textStyle: const TextStyle(
//                       fontSize: 28
//                     )
//                   ),
//                   child: const Text('Roll Dice!')
//                 )
//               ],)
//             // child: StyleText('Hello World!'),
//           )
//         );
//   }
// }