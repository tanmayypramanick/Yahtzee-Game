import 'package:flutter/material.dart';
import '/models/dice.dart';
import '/models/scorecard.dart';
import 'dice_display.dart';
import 'scorecard_display.dart';

class Yahtzee extends StatefulWidget {
  const Yahtzee({Key? key});

  @override
  _YahtzeeState createState() => _YahtzeeState();
}

class _YahtzeeState extends State<Yahtzee> {
  late Dice _dice;
  late ScoreCard _scoreCard;
  int rollsLeft = 3;

  List<ScoreCategory> leftCategories = [
    ScoreCategory.ones,
    ScoreCategory.twos,
    ScoreCategory.threes,
    ScoreCategory.fours,
    ScoreCategory.fives,
    ScoreCategory.sixes,
  ];

  List<ScoreCategory> rightCategories = [
    ScoreCategory.threeOfAKind,
    ScoreCategory.fourOfAKind,
    ScoreCategory.fullHouse,
    ScoreCategory.smallStraight,
    ScoreCategory.largeStraight,
    ScoreCategory.yahtzee,
    ScoreCategory.chance,
  ];

  @override
  void initState() {
    super.initState();
    _dice = Dice(5);
    _dice.roll();
    _scoreCard = ScoreCard();
  }

  void toggleHold(int index) {
    setState(() {
      _dice.toggleHold(index);
    });
  }

  void _handleScoreCategory(ScoreCategory category) {
    if (rollsLeft < 3 && !_scoreCard.isCategoryScored(category)) {
      setState(() {
        _scoreCard.registerScore(category, _dice.values);
        rollsLeft = 3;
        _dice.clearHolds();
      });

      if (_scoreCard.completed) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Game Over!'),
              content: Text('Your final score is ${_scoreCard.total}'),
              actions: <Widget>[
                TextButton(
                  child: const Text('Try Again'),
                  onPressed: () {
                    setState(() {
                      _scoreCard.clear();
                      _dice.clear();
                      rollsLeft = 3;
                    });
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Yahtzee',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 10, 77, 108),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              DiceShow(
                diceValues: _dice.values,
                heldDice: _dice.held,
                onHoldToggle: toggleHold,
                rollsLeft: rollsLeft,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: rollsLeft > 0
                    ? () {
                        setState(() {
                          if (rollsLeft > 0) {
                            _dice.roll();
                            rollsLeft--;
                          }
                          if (rollsLeft == 0) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Out of Rolls!'),
                                  content: const Text(
                                      'You have used all your rolls for this turn.'),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('OK'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        });
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 10, 77, 108),
                ),
                child: Text('Roll Dice ($rollsLeft)', 
                style: TextStyle( color: Colors.white),
                ),
              ),
              ScoreCardDisplay(
                scoreCard: _scoreCard,
                onCategorySelected: _handleScoreCategory,
                leftCategories: leftCategories,
                rightCategories: rightCategories,
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 10, 77, 108),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Final Score: ${_scoreCard.total}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
