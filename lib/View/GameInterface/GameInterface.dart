import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:hash_heartstring/Controller/GameController/GameController.dart';
import 'package:hash_heartstring/View/GameInterface/GameBoyButton.dart';

class GameInterface extends StatefulWidget {
  const GameInterface({Key? key}) : super(key: key);

  @override
  State<GameInterface> createState() => _GameInterfaceState();
}

class _GameInterfaceState extends State<GameInterface> {

  bool play = false;
  bool playMusic = false;

  //Initialize Game Controller
  final GameController gameController = GameController();

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
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Color(0xFFE6E6FA),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                                GameBoyButton(text: '←', function: (){gameController.left();}),
                                Container(height: 50, width: 50),
                              ],
                            ),
                            Column(
                              children: [
                                GameBoyButton(text: '↑', function: (){gameController.up();}),
                                Container(height: 50, width: 50),
                                GameBoyButton(text: '↓', function: (){gameController.down();}),
                              ],
                            ),
                            Column(
                              children: [
                                Container(height: 50, width: 50),
                                GameBoyButton(text: '→', function: (){gameController.right();}),
                                Container(height: 50, width: 50),
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            GameBoyButton(text: 'a', function: (){}),
                            GameBoyButton(text: 'b', function: (){}),
                          ],
                        )
                      ],
                    ),
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
              playMusic = true;
              FlameAudio.bgm.play('Background-Music.mp3');
            });
          },
          child: Text('Play Game'),
        ),
      )
    );
  }
}
