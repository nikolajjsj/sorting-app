import 'dart:math';

import 'package:flutter/material.dart';

List<List> randomNumbersList(
    {@required int n, @required int highestNumber}) {
  var random = Random();
  List<List> list = [];
  for (var i = 1; i < n; i++) {
    int randNumber = random.nextInt(highestNumber) + 1;
    list.add([randNumber, Colors.teal]);
  }
  return list;
}
