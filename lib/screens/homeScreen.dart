import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hangman/screens/gameScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  bool musicOn = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            // color: const Color.fromARGB(208, 220, 26, 32),
            color: Colors.white,
            child: Image.asset(
              "assets/images/hangman_background.png",
              // color: Colors.white,
              repeat: ImageRepeat.repeat,
              opacity: const AlwaysStoppedAnimation(0.3),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              actions: [
                IconButton(
                  icon: musicOn
                      ? const Icon(
                          FontAwesomeIcons.volumeHigh,
                          color: Color.fromRGBO(220, 26, 34, 1),
                        )
                      : const Icon(
                          FontAwesomeIcons.volumeXmark,
                          color: Color.fromRGBO(220, 26, 34, 1),
                        ),
                  tooltip: 'Mute Music',
                  onPressed: () {
                    if (musicOn == true) {
                      setState(() {
                        musicOn = false;
                      });
                    } else {
                      setState(() {
                        musicOn = true;
                      });
                    }
                  },
                ),
              ],
            ),
            backgroundColor: Colors.transparent,
            body: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Animate(
                    effects: const [
                      ScaleEffect(duration: Duration(seconds: 1)),
                      FadeEffect(duration: Duration(seconds: 1))
                    ],
                    child: const CircleAvatar(
                      radius: 100,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 95,
                        backgroundColor: Color.fromRGBO(220, 26, 34, 1),
                        child: CircleAvatar(
                          radius: 75,
                          backgroundColor: Color.fromRGBO(220, 26, 34, 1),
                          backgroundImage: AssetImage(
                            "assets/images/hangman.png",
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Animate(
                    effects: const [
                      ScaleEffect(duration: Duration(seconds: 1)),
                      FadeEffect(duration: Duration(seconds: 1))
                    ],
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => GameScreen(category: "Animals"),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 1,
                          // backgroundColor: const Color.fromRGBO(220, 26, 34, 1),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          side: const BorderSide(
                            width: 4,
                            color: Color.fromRGBO(220, 26, 34, 1),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.otter,
                              color: Color.fromRGBO(220, 26, 34, 1),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Text(
                              "Animals",
                              style: TextStyle(
                                color: Color.fromRGBO(220, 26, 34, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Animate(
                    effects: const [
                      ScaleEffect(duration: Duration(seconds: 1)),
                      FadeEffect(duration: Duration(seconds: 1))
                    ],
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => GameScreen(category: "Fruits"),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 1,
                          // backgroundColor: const Color.fromRGBO(220, 26, 34, 1),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          side: const BorderSide(
                            width: 4,
                            color: Color.fromRGBO(220, 26, 34, 1),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.lemon,
                              color: Color.fromRGBO(220, 26, 34, 1),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Text(
                              "Fruits",
                              style: TextStyle(
                                color: Color.fromRGBO(220, 26, 34, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
