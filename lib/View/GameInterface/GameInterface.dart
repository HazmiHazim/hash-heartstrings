import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:hash_heartstring/Controller/GameController/GameController.dart';
import 'package:hash_heartstring/View/GameInterface/GameBoyButton.dart';
import 'package:hash_heartstring/View/GameInterface/Map/Battleground.dart';

class GameInterface extends StatefulWidget {
  const GameInterface({Key? key}) : super(key: key);

  @override
  State<GameInterface> createState() => _GameInterfaceState();
}

class _GameInterfaceState extends State<GameInterface> {

  bool play = false;
  bool select = false;
  bool moveUp = false;
  bool moveDown = false;
  bool moveLeft = false;
  bool moveRight = false;

  //Initialize Game Controller
  final GameController gameController = GameController(Offset.zero);

  @override
  void dispose() {
    FlameAudio.bgm.stop();
    super.dispose();
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
            'Hazim x Aishah Game',
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
              child: Battleground(
                select: select,
                moveUp: moveUp,
                moveDown: moveDown,
                moveLeft: moveLeft,
                moveRight: moveRight,
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
                                Container(height: 50, width: 50),
                                GameBoyButton(text: '←', function: (){setState(() {moveLeft = true;gameController.buttonLeft();});}),
                                Container(height: 50, width: 50),
                              ],
                            ),
                            Column(
                              children: [
                                GameBoyButton(text: '↑', function: (){setState(() {moveUp = true;gameController.buttonUp();});}),
                                Container(height: 50, width: 50),
                                GameBoyButton(text: '↓', function: (){setState(() {moveDown = true;gameController.buttonDown();});}),
                              ],
                            ),
                            Column(
                              children: [
                                Container(height: 50, width: 50),
                                GameBoyButton(text: '→', function: (){setState(() {moveRight = true;gameController.buttonRight();});}),
                                Container(height: 50, width: 50),
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(height: 50, width: 50),
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(height: 50, width: 50),
                                GameBoyButton(text: 'b', function: (){}),
                              ],
                            ),
                            Column(
                              children: [
                                GameBoyButton(text: 'a', function: (){setState(() {select=true;});}),
                                Container(height: 50, width: 50),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    Text('H A H A')
                  ],
                )
              )
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
