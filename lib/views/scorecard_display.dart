import 'package:flutter/material.dart';
import '/models/scorecard.dart';

class ScoreCardDisplay extends StatelessWidget {
  final ScoreCard scoreCard;
  final Function(ScoreCategory) onCategorySelected;
  final List<ScoreCategory> leftCategories;
  final List<ScoreCategory> rightCategories;

  const ScoreCardDisplay({
    required this.scoreCard,
    required this.onCategorySelected,
    required this.leftCategories,
    required this.rightCategories,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        const Text(
          'Scorecard',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                for (var category in leftCategories)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: scoreCard[category] == null
                              ? () => onCategorySelected(category)
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 23, 74, 87),
                            textStyle: const TextStyle(color: Colors.black),
                          ),
                          child: Text(
                            category.toString().split('.').last,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          ': ${scoreCard[category] ?? ''}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
            Column(
              children: [
                for (var category in rightCategories)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: scoreCard[category] == null
                              ? () => onCategorySelected(category)
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 23, 74, 87),
                            textStyle: const TextStyle(color: Colors.black),
                          ),
                          child: Text(
                            category.toString().split('.').last,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          ': ${scoreCard[category] ?? ''}',
                          style: const TextStyle(
                              fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
