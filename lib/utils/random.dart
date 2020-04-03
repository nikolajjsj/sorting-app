import 'dart:math';

import 'package:flutter/material.dart';

List<int> randomNumbersList({@required int n, @required int highestNumber}) {
  var random = Random();
  List<int> list = [];
  for (var i = 1; i < n; i++) {
    int randNumber = random.nextInt(highestNumber) + 1;
    list.add(randNumber);
  }
  return list;
}

List<MaterialColor> randomNumberColorsList({@required int n}) {
  List<MaterialColor> list = [];
  for (var i = 1; i < n; i++) {
    list.add(Colors.teal);
  }
  return list;
}
