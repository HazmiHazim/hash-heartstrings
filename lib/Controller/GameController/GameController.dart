import 'package:flutter/material.dart';

class GameController {
  final Offset _initialPosition;
  late Offset _position;

  GameController(this._initialPosition) {
    _position = _initialPosition;
  }

  Offset get position => _position;

  //Move Up
  void buttonUp() {
    //Move Up
    _position = _position.translate(0, -10);
  }

  //Method To Move Down
  void buttonDown() {
    //Move Down
    _position = _position.translate(0, 10);
  }

  //Method To Move Left
  void buttonLeft() {
    //Move Left
    _position = _position.translate(-10, 0);
  }

  //Method To Move Right
  void buttonRight() {
    //Move Right
    _position = _position.translate(10, 0);
  }

  //Method To Select / Enter
  void buttonA() {
    //Select
  }

  //Method To Back / Undo
  void buttonB() {
    //Undo
  }
}