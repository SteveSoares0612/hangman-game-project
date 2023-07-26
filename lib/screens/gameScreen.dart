import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:hangman/const/consts.dart';

class GameScreen extends StatefulWidget {
  String category;

  GameScreen({super.key, required this.category});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final defaultCharacters = "abcdefghijklmnopqrstuvwxyz".toUpperCase();

  String word = '';
  List guessedLetters = [];
  bool confettiOn = false;
  final controllerConfetti = ConfettiController();
  int points = 0;
  int lives = 0;
  List images = [
    "assets/images/hg0.png",
    "assets/images/hg1.png",
    "assets/images/hg2.png",
    "assets/images/hg3.png",
    "assets/images/hg4.png",
    "assets/images/hg5.png",
    "assets/images/hg6.png",
    "assets/images/hg7.png",
  ];

  @override
  void initState() {
    print(widget.category);
    checkCategory();
    super.initState();
  }

  checkCategory() {
    if (widget.category == "Animals") {
      word = animalList[Random().nextInt(animalList.length)].toUpperCase();
    } else if (widget.category == "Fruits") {
      word = fruitsList[Random().nextInt(fruitsList.length)].toUpperCase();
    }
  }

  String handleText() {
    print(word);
    String displayWord = "";
    for (int i = 0; i < word.length; i++) {
      String character = word[i];
      if (guessedLetters.contains(character)) {
        displayWord += "$character ";
      } else if (character == "A" ||
          character == "E" ||
          character == "I" ||
          character == "O" ||
          character == "U") {
        displayWord += "$character ";
      } else {
        displayWord += "_ ";
      }
    }
    return displayWord;
  }

  showWinLoss(bool win) {
    if (win == true) {
      setState(() {
        controllerConfetti.play();
      });
    } else {
      setState(() {
        controllerConfetti.stop();
      });
    }
    showGeneralDialog(
      context: context,
      barrierColor: Colors.black12.withOpacity(0.6), // Background color
      barrierDismissible: false,
      barrierLabel: 'Dialog',
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (_, __, ___) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConfettiWidget(
                confettiController: controllerConfetti,
                shouldLoop: true,
                blastDirectionality: BlastDirectionality.explosive,
                numberOfParticles: 20,
              ),
              win
                  ? const Center(
                      child: Image(
                        width: 200,
                        height: 250,
                        image: AssetImage("assets/images/success.png"),
                      ),
                    )
                  : const Center(
                      child: Image(
                        width: 200,
                        height: 250,
                        image: AssetImage("assets/images/hg7.png"),
                      ),
                    ),
              Center(
                child: win
                    ? const Text(
                        'You Win!',
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      )
                    : const Text(
                        'Game Over',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: GameColors.primaryColor,
                        ),
                      ),
              ),
              const SizedBox(
                height: 10,
              ),
              points < 0
                  ? const Text(
                      "0 Points",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  : Text(
                      "$points Points",
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    lives = 0;
                    guessedLetters.clear();
                    points = 0;
                    checkCategory();
                    print(word);
                  });

                  Navigator.pop(context);
                },
                child: const Text(
                  'Play Again',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  checkCharacter(String char) {
    if (word.contains(char)) {
      setState(() {
        guessedLetters.add(char);
        points += 5;
      });
    } else if (lives != 6) {
      setState(() {
        lives += 1;
        points -= 5;
      });
    } else {
      print("you lose");
      showWinLoss(false);
    }

    bool isWon = true;
    for (int i = 0; i < word.length; i++) {
      String character = word[i];
      if (!guessedLetters.contains(character)) {
        setState(() {
          isWon = false;
        });
      }
    }
    if (isWon) {
      print("You Win!");
      showWinLoss(isWon);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GameColors.primaryColor,
      appBar: AppBar(
        backgroundColor: GameColors.primaryColor,
        title: const Text(
          "Hangman",
          style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontFamily: "SourceSans3"),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Image(
                width: 200,
                height: 250,
                image: AssetImage(images[lives]),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                alignment: Alignment.center,
                height: 30,
                width: MediaQuery.of(context).size.width / 3.8,
                decoration: const BoxDecoration(color: Colors.white),
                child: points < 0
                    ? const Text("0 Points")
                    : Text("$points Points"),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                handleText == null ? "" : handleText(),
                style: const TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              GridView.count(
                crossAxisCount: 7,
                shrinkWrap: true,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                childAspectRatio: 1,
                padding: const EdgeInsets.all(5),
                children: defaultCharacters.split("").map((e) {
                  return TextButton(
                    style: const ButtonStyle(),
                    onPressed: () {
                      checkCharacter(e);
                      print(e);
                      print(lives);
                    },
                    child: Center(
                      child: Text(
                        e,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
