import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:hash_heartstring/Controller/GameController/GameController.dart';

class GameInterface extends StatefulWidget {
  const GameInterface({Key? key}) : super(key: key);

  @override
  State<GameInterface> createState() => _GameInterfaceState();
}

class _GameInterfaceState extends State<GameInterface> with TickerProviderStateMixin {

  bool play = false;
  bool select = false;
  bool moveUp = false;
  bool moveDown = false;
  bool moveLeft = false;
  bool moveRight = false;

  late AnimationController boyController;
  late Animation<Offset> boyAnimation;
  late AnimationController girlController;
  late Animation<Offset> girlAnimation;
  bool boyStop = false;
  bool girlStop = false;
  bool showConfirmation = false;
  bool isConfirm = false;

  // set player health to 100;
  double playerHealth = 100.0;

  //Initialize Game Controller
  final GameController gameController = GameController(Offset.zero);

  @override
  void dispose() {
    FlameAudio.bgm.stop();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    // Animation For Boy
    boyController = AnimationController(
      duration: const Duration(milliseconds: 7000),
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
      duration: const Duration(milliseconds: 3750),
      vsync: this,
    );

    girlAnimation = Tween<Offset>(
      begin: Offset(-1, 0),
      end: Offset(2, 0),
    ).animate(girlController);

    // Set up the animation to stop at a specific position
    girlAnimation.addListener(() {
      if (girlAnimation.value.dx > 0.25) {
        girlController.stop();
        setState(() {
          girlStop = true;
        });
      }
    });

    // Start the animation
    girlController.forward();
  }

  // UI for the button in lower part of the game
  // Make each button functioning
  Widget gameBoyButton(Function function, String text) {
    return GestureDetector(
      onTap: () => function(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 2,
              color: Colors.black,
            ),
          ),
          height: 50,
          width: 50,
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }

  // Player Action
  playerAction(GameController gameController) {
    // Action 1
    if (gameController.valueButton == 2 && gameController.position == Offset(0.0, 0.0) ) {
      gameController.selectedAction = 1;
      showConfirmation = true;
      punishment1(gameController);
      print('showConfirmation: $showConfirmation');
    }
    // Action 2
    else if (gameController.valueButton == 2 && gameController.position == Offset(0.0, 20.0)) {
      gameController.selectedAction = 2;
      showConfirmation = true;
      punishment2(gameController);
      print('showConfirmation: $showConfirmation');
    }

    // Action 3
    else if (gameController.valueButton == 2 && gameController.position == Offset(50.0, 0.0)) {
      gameController.selectedAction = 3;
      showConfirmation = true;
      punishment3(gameController);
      print('showConfirmation: $showConfirmation');
    }

    // Action 4
    else if (gameController.valueButton == 2 && gameController.position == Offset(50.0, 20.0)) {
      gameController.selectedAction = 4;
      showConfirmation = true;
      punishment4(gameController);
      print('showConfirmation: $showConfirmation');
    }
  }

  Widget confirmAction(GameController gameController) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Image.asset('assets/images/Battle-Box.png', width: 250, fit: BoxFit.fitHeight),
            Positioned(top: 16, left: 20, child: AnimatedTextKit(animatedTexts: [TyperAnimatedText('Confirm ?', speed: Duration(milliseconds: 100), textStyle: TextStyle(color: Colors.white))], isRepeatingAnimation: false,),)
          ],
        ),
        Container(
          color: Color(0xFF447294),
          width: 110,
          height: 50,
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(children: [Spacer(), Text('Ya', style: TextStyle(fontSize: 15, color: Colors.white)), Spacer()]),
                  Row(children: [Spacer(), Text('Tidak', style: TextStyle(fontSize: 15, color: Colors.white)), Spacer()]),
                ],
              ),
              Positioned(
                top: gameController.position.dy,
                child: Transform.translate(
                  offset: Offset(30, 5),
                  child: Container(
                      width: 50,
                      height: 18,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.pinkAccent),
                      )
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Action 1 damage
  punishment1(GameController gameController) {
    if (showConfirmation == true && gameController.position == Offset(0.0, 0.0) && gameController.selectedAction == 1) {
      isConfirm = true;
      if (isConfirm) {
        playerHealth = playerHealth - 40;
        print('Health: $playerHealth');
      }
    }
    else {
      gameController.valueButton = gameController.valueButton - 1;
      showConfirmation = false;
    }
  }

  // Action 2 damage
  punishment2(GameController gameController) {
    if (showConfirmation == true && gameController.position == Offset(0.0, 20.0) && gameController.selectedAction == 2) {
      isConfirm = true;
      if (isConfirm) {
        playerHealth = playerHealth - 30;
        print('Health: $playerHealth');
      }
    }
    else {
      gameController.valueButton = gameController.valueButton - 1;
      showConfirmation = false;
    }
  }

  // Action 3 damage
  punishment3(GameController gameController) {
    if (showConfirmation == true && gameController.position == Offset(50.0, 0.0) && gameController.selectedAction == 3) {
      isConfirm = true;
      if (isConfirm) {
        playerHealth = playerHealth - 10;
        print('Health: $playerHealth');
      }
    }
    else {
      gameController.valueButton = gameController.valueButton - 1;
      showConfirmation = false;
    }
  }

  // Action 4 damage
  punishment4(GameController gameController) {
    if (showConfirmation == true && gameController.position == Offset(50.0, 20.0) && gameController.selectedAction == 4) {
      isConfirm = true;
      if (isConfirm) {
        playerHealth = playerHealth + 10;
        print('Health: $playerHealth');
      }
    }
    else {
      gameController.valueButton = gameController.valueButton - 1;
      showConfirmation = false;
    }
  }

  Widget gamePanel(GameController gameController) {
    if (boyStop == true && girlStop == true) {
      if (gameController.valueButton == 1 && showConfirmation == false) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Image.asset('assets/images/Battle-Box.png', width: 250, fit: BoxFit.fitHeight),
                Positioned(top: 16, left: 20, child: AnimatedTextKit(animatedTexts: [TyperAnimatedText('Apa yang awak akan lakukan ?', speed: Duration(milliseconds: 30), textStyle: TextStyle(color: Colors.white))], isRepeatingAnimation: false,),)
              ],
            ),
            Container(
              color: Color(0xFF447294),
              width: 110,
              height: 50,
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(children: [Spacer(), Text('Pukul', style: TextStyle(fontSize: 15, color: Colors.white)), Spacer(), Text('Maki', style: TextStyle(fontSize: 15, color: Colors.white)), Spacer()]),
                      Column(children: [Spacer(), Text('Sepak', style: TextStyle(fontSize: 15, color: Colors.white)), Spacer(), Text('Cium', style: TextStyle(fontSize: 15, color: Colors.white)), Spacer()]),
                    ],
                  ),
                  Positioned(
                    top: gameController.position.dy,
                    left: gameController.position.dx,
                    child: Transform.translate(
                      offset: Offset(6, 5),
                      child: Container(
                        width: 50,
                        height: 18,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.pinkAccent),
                        )
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }
      else if (gameController.valueButton == 2 && showConfirmation == true) {
        return confirmAction(gameController);
      }
      else {
        return Stack(
          children: [
            Image.asset('assets/images/Battle-Box.png', width: 359, fit: BoxFit.cover),
            Positioned(top: 25, left: 20, child: AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText('Hazim gorgon sudah tiba !', speed: Duration(milliseconds: 30), textStyle: TextStyle(color: Colors.white)),
                TyperAnimatedText('Apa yang awak akan lakukan ?', speed: Duration(milliseconds: 30), textStyle: TextStyle(color: Colors.white)),
              ],
              isRepeatingAnimation: false,
            ),),
          ],
        );
      }
    }
    else {
      return Image.asset('assets/images/Battle-Box.png', width: 359, fit: BoxFit.cover);
    }
  }


  @override
  Widget build(BuildContext context) {
    //Initialize Flame Audio Background Music
    FlameAudio.bgm.initialize();

    return Scaffold(
      backgroundColor: Color(0xFFE6E6FA),
      appBar: AppBar(
        backgroundColor: Color(0xFF87CEEB),
        title: Text(
            'Gorgon Game',
            style: TextStyle(color: Colors.white)
        ),
        centerTitle: true,
      ),
      body: play ? Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.black,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Image.asset('assets/images/Grass-Battle-Ground.png', width: 355, fit: BoxFit.cover,),
                      Positioned(top: -35, child: SlideTransition(position: boyAnimation, child: Image.asset('assets/images/Boy.png', width: 180, height: 150),),),
                      Positioned(bottom: 2, child: SlideTransition(position: girlAnimation, child: Image.asset('assets/images/Girl.png', width: 120, height: 120),),),
                      Positioned(top: 20, left: -50, child: SlideTransition(position: boyAnimation, child: Container(width: 120, height: 20, child: Column(children: [Text('Hazim Gorgon', textAlign: TextAlign.center), LinearProgressIndicator(value:  playerHealth, backgroundColor: Colors.grey, valueColor: AlwaysStoppedAnimation<Color>(Colors.red))],)),),),
                    ],
                  ),
                  gamePanel(gameController),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Color(0xFFE6E6FA),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('L O V E', style: TextStyle(color: Colors.blue)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                gameBoyButton(() => setState(() {
                                  moveLeft = true;
                                  gameController.buttonLeft();
                                }), '←'),
                              ],
                            ),
                            Column(
                              children: [
                                gameBoyButton(() => setState(() {
                                  moveUp = true;
                                  gameController.buttonUp();
                                }), '↑'),
                                Container(height: 50, width: 50),
                                gameBoyButton(() => setState(() {
                                  moveDown = true;
                                  gameController.buttonDown();
                                }), '↓'),
                              ],
                            ),
                            Column(
                              children: [
                                gameBoyButton(() => setState(() {
                                  moveRight = true;
                                  gameController.buttonRight();
                                }), '→'),
                              ],
                            ),
                          ],
                        ),
                        Container(width: 50, height: 50),
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(height: 50, width: 50),
                                gameBoyButton(() => setState(() {
                                  gameController.buttonB();
                                  showConfirmation = false;
                                }), 'b'),
                              ],
                            ),
                            Column(
                              children: [
                                gameBoyButton(() { setState(() {
                                  gameController.buttonA();
                                  playerAction(gameController);
                                });}, 'a'),
                                Container(height: 50, width: 50),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    Text('L O V E', style: TextStyle(color: Colors.blue)),
                  ],
                ),
              ),
            ),
          )
        ],
      ) : Container(
        alignment: Alignment.center,
        child: ElevatedButton(
          autofocus: true,
          onPressed: () {
            setState(() {
              play = true;
              FlameAudio.bgm.play('Background-Music.mp3');
            });
          },
          child: Text('Play Game'),
        ),
      )
    );
  }
}
