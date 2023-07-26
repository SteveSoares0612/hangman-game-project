import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animated_background/animated_background.dart';
import 'package:hangman/screens/homeScreen.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  ParticleOptions particles = const ParticleOptions(
    baseColor: Color.fromRGBO(220, 26, 34, 1),
    spawnOpacity: 0.0,
    opacityChangeRate: 0.10,
    minOpacity: 0.1,
    maxOpacity: 0.4,
    particleCount: 12,
    spawnMaxRadius: 90.0,
    spawnMaxSpeed: 40.0,
    spawnMinSpeed: 10,
    spawnMinRadius: 7.0,
  );
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const HomeScreen()));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/hangman_background.png',
                repeat: ImageRepeat.repeat,
                opacity: const AlwaysStoppedAnimation(.2),
              ),
            ),
            AnimatedBackground(
              // vsync uses singleTicketProvider state mixin.
              vsync: this,
              behaviour: RandomParticleBehaviour(options: particles),
              child: Center(
                child: CircleAvatar(
                    radius: 100,
                    backgroundColor: const Color.fromRGBO(220, 26, 34, 1),
                    child: CircularPercentIndicator(
                      animation: true,
                      animationDuration: 2600,
                      backgroundColor: const Color.fromRGBO(220, 26, 34, 1),
                      radius: 95.0,
                      lineWidth: 4.0,
                      percent: 1,
                      circularStrokeCap: CircularStrokeCap.round,
                      center: const CircleAvatar(
                        radius: 75,
                        backgroundColor: Color.fromRGBO(220, 26, 34, 1),
                        backgroundImage: AssetImage(
                          "assets/images/hangman.png",
                        ),
                      ),
                      progressColor: Colors.white,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
    // Stack(
    //   children: [
    //     Positioned.fill(
    //       child:
    // Container(
    //         decoration: const BoxDecoration(
    //           color: Color.fromRGBO(220, 26, 34, 1),
    //           shape: BoxShape.circle,
    //         ),
    //         child: const Image(
    //           image: AssetImage("assets/images/hangman.png"),
    //           fit: BoxFit.fitWidth,
    //         ),
    //       ),
    //     ),
    //   ],
    // ),
    // )
  }
}
