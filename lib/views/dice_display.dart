import 'package:flutter/material.dart';

class DiceShow extends StatelessWidget {
  final List<int?> diceValues;
  final List<bool> heldDice;
  final Function(int) onHoldToggle;
  final int rollsLeft;

  const DiceShow({
    required this.diceValues,
    required this.heldDice,
    required this.onHoldToggle,
    required this.rollsLeft,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < diceValues.length; i++)
          GestureDetector(
            onTap: () {
              if (diceValues[i] != null) {
                onHoldToggle(i);
              }
            },
            child: Container(
              width: 50,
              height: 50,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
                color: heldDice[i]
                    ? const Color.fromARGB(255, 10, 77, 108)
                    : Colors.white,
              ),
              child: Center(
                child: Text(
                  rollsLeft == 3 ? ' ' : (diceValues[i]?.toString() ?? ' '),
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
