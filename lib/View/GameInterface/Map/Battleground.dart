import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:hash_heartstring/Controller/GameController/GameController.dart';
import 'package:hash_heartstring/View/GameInterface/GameBoyButton.dart';

class Battleground extends StatefulWidget {
  const Battleground({Key? key}) : super(key: key);

  @override
  State<Battleground> createState() => _BattlegroundState();
}

class _BattlegroundState extends State<Battleground> with TickerProviderStateMixin{

  late AnimationController boyController;
  late Animation<Offset> boyAnimation;
  late AnimationController girlController;
  late Animation<Offset> girlAnimation;
  bool boyStop = false;
  bool girlStop = false;
  bool buttonIsClick = false;

  // Define the initial position of the container
  Offset containerPosition = Offset(0, 0);

  GameController gameController = GameController(Offset(0, 0));

  @override
  void initState() {
    super.initState();

    // Animation For Boy
    boyController = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    );

    boyAnimation = Tween<Offset>(
      begin: Offset(1.5, 0),
      end: Offset(-1, 0),
    ).animate(boyController);

    // Set up the animation to stop at a specific position
    boyAnimation.addListener(() {
      if (boyAnimation.value.dx < 0.95) {
        boyController.stop();
        setState(() {
          boyStop = true;
        });
      }
    });

    // Start the animation
    boyController.forward();

    // Animation For Girl
    girlController = AnimationController(
      duration: const Duration(milliseconds: 3400),
      vsync: this,
    );

    girlAnimation = Tween<Offset>(
      begin: Offset(-1, 0),
      end: Offset(2, 0),
    ).animate(girlController);

    // Set up the animation to stop at a specific position
    girlAnimation.addListener(() {
      if (girlAnimation.value.dx > 0.95) {
        girlController.stop();
        setState(() {
          girlStop = true;
        });
      }
    });

    // Start the animation
    girlController.forward();
  }

  // This method updates the position of the container
  void moveContainer() {
    setState(() {
      // Update the position of the container by adding 10 to the x-coordinate
      containerPosition += Offset(10, 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/images/Grass-Battle-Ground.png',
                width: 355,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: -35,
                child: SlideTransition(
                  position: boyAnimation,
                  child: Image.asset(
                    'assets/images/Boy.png',
                    width: 180,
                    height: 150,
                  ),
                ),
              ),
              Positioned(
                bottom: 2,
                child: SlideTransition(
                  position: girlAnimation,
                  child: Image.asset(
                    'assets/images/Girl.png',
                    width: 50,
                    height: 50,
                  ),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Image.asset(
                'assets/images/Battle-Box.png',
                width: 359,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 25,
                left: 20,
                child: boyStop && girlStop ? Container(
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText('Hazim gorgon sudah tiba !', speed: Duration(milliseconds: 100), textStyle: TextStyle(color: Colors.white)),
                      TyperAnimatedText('Apa yang awak akan lakukan ?', speed: Duration(milliseconds: 100), textStyle: TextStyle(color: Colors.white)),
                    ],
                    isRepeatingAnimation: false,
                  ),
                ) : Container(),
              )
            ],
          )
        ],
      ),
    );
  }
}

