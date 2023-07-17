import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:hash_heartstring/Controller/GameController/GameController.dart';

class Battleground extends StatefulWidget {
  final bool select;
  final bool moveUp;
  final bool moveDown;
  final bool moveLeft;
  final bool moveRight;

  const Battleground({required this.select, required this.moveUp, required this.moveDown, required this.moveLeft, required this.moveRight, Key? key}) : super(key: key);

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

  // set player health to 100;
  double playerHealth = 100.0;

  // Define the initial position of the container
  Offset containerPosition = Offset(0, 0);

  //Initialize Game Controller
  final GameController gameController = GameController(Offset.zero);

  @override
  void initState() {
    super.initState();

    // Animation For Boy
    boyController = AnimationController(
      duration: const Duration(seconds: 7),
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
      if (girlAnimation.value.dx > 0.40) {
        girlController.stop();
        setState(() {
          girlStop = true;
        });
      }
    });

    // Start the animation
    girlController.forward();
  }

  // Player Action
  playerAction() {
    int action = 0;

    if (action == 1 ) {
      playerHealth - 20;
    }
    else if (action == 2) {
      playerHealth + 10;
    }
    else if (action == 3) {
      playerHealth - 20;
    }
    else if (action == 4) {
      playerHealth - 10;
    }
  }

  // Game Over
  gameOver() {
    if (playerHealth == 0) {
      // create blank screen contain text
    }
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
                    width: 100,
                    height: 120,
                  ),
                ),
              ),
              Positioned(
                top: 30,
                child: SlideTransition(
                  position: boyAnimation,
                  child: Container(
                    width: 120,
                    height: 20,
                    child: Column(
                      children: [
                        const Text(
                          "Nyawa",
                          textAlign: TextAlign.center,
                        ),
                        LinearProgressIndicator(
                          value: playerHealth,
                          backgroundColor: Colors.grey[300],
                          valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
                        ),
                      ]
                    ),
                  ),
                ),
              ),
            ],
          ),
          widget.select ? Stack(
            children: [
              Image.asset(
                'assets/images/Battle-Box.png',
                width: 359,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 17,
                left: 20,
                child: AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText('Apa yang awak akan\nlakukan ?', speed: Duration(milliseconds: 100), textStyle: TextStyle(color: Colors.white))
                  ],
                  isRepeatingAnimation: false,
                ),
              ),
              Positioned(
                right: 2,
                child: Container(
                  width: 159,
                  height: 69,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 40,
                        right: 100,
                        child: Text('KATOK'),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 100,
                        child: Text('PELUK'),
                      ),
                      Positioned(
                        bottom: 40,
                        right: 20,
                        child: Text('CIUM'),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 20,
                        child: Text('MAKI'),
                      ),
                      Positioned(
                        right: 90,
                        bottom: 40,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(color: Colors.black)
                          ),
                          width: 60,
                          height: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ) : Stack(
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

