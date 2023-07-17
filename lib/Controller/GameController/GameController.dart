import 'package:flutter/material.dart';

class GameController {
  final Offset _initialPosition;
  late Offset _position;

  int valueButton = 0;
  int minValueButton = 0;
  int maxValueButton = 2;

  // Set min value and max value for position
  final double minX = 0.0;
  final double maxX = 50.0;
  final double minY = 0.0;
  final double maxY = 20.0;

  GameController(this._initialPosition) {
    _position = _initialPosition;
  }

  Offset get position => _position;

  //Method To Move Up
  void buttonUp() {
    //Move Up
    _position = _position.translate(0, -20);
    if (_position.dy < minY) {
      _position = _position.translate(0, 20);
    }
    print('Current Offset Position: $_position');
  }

  //Method To Move Down
  void buttonDown() {
    //Move Down
    _position = _position.translate(0, 20);
    if (_position.dy > maxY) {
      _position = _position.translate(0, -20);
    }
    print('Current Offset Position: $_position');
  }

  //Method To Move Left
  void buttonLeft() {
    //Move Left
    _position = _position.translate(-50, 0);
    if (_position.dx < minX) {
      _position = _position.translate(50, 0);
    }
    print('Current Offset Position: $_position');
  }

  //Method To Move Right
  void buttonRight() {
    //Move Right
    _position = _position.translate(50, 0);
    if (_position.dx > maxX) {
      _position = _position.translate(-50, 0);
    }
    print('Current Offset Position: $_position');
  }

  void buttonA() {
    // Get value to select the item
    if (valueButton < maxValueButton) {
      valueButton = valueButton + 1;
    }
    print('Value: $valueButton');
  }

  //Method To Back / Undo
  void buttonB() {
    if (valueButton > minValueButton) {
      valueButton = valueButton - 1;
    }
    print('Value: $valueButton');
  }
}