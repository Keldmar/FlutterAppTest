import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class MainBlock {

  // ignore: close_sinks
  final _colorsPublish = PublishSubject<List<Color>>();

  final _random = Random();

  Observable<List<Color>> get newColors => _colorsPublish.stream;

  loadNewColors() {
    _colorsPublish.sink.add(getNewColors());
  }

  List<Color> getNewColors() {
    return [_getRandomColor(), _getRandomColor()];
  }

  Color _getRandomColor() {
    return Color.fromARGB(255, _random.nextInt(255), _random.nextInt(255), _random.nextInt(255));
  }

}
final bloc = MainBlock();