import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class AlgorhitmNotifier with ChangeNotifier {
  AlgorhitmNotifier();

  List<int> _list = [];
  List<MaterialColor> _colors = [];
  int _n = 20;
  int _maxGeneratedNumber = 50;
  int _functionDelay = 20;

  /// all function to get certain paramaters
  List<int> get getList => _list;
  List<MaterialColor> get getColorList => _colors;
  int get getListLength => _list.length;
  int get highestGenNumber => _maxGeneratedNumber;
  int get functionDelay => _functionDelay;

  /// setter functions
  set setListLength(listLength) => _n = listLength;
  set setMaxGenNumb(highestNumber) => _maxGeneratedNumber = highestNumber;
  set setFunctionDelay(functionDelay) => _functionDelay = functionDelay;

  /// generate a new random number and color list
  generateLists() {
    _generateListAndColors(n: _n, highestNumber: _maxGeneratedNumber);
    notifyListeners();
  }

  /// generates random number, and colors list
  _generateListAndColors({@required int n, @required int highestNumber}) {
    if (_list.length > 0) {
      _list.clear();
      _colors.clear();
    }

    var random = Random();
    for (var i = 1; i < n; i++) {
      int randNumber = random.nextInt(highestNumber) + 1;
      _list.add(randNumber);
      _colors.add(Colors.teal);
    }
  }

  ///
  /// sorting functions
  ///
  // startSort(Future sortFunction) {
  //   sortFunction;
  // }

  Future bubbleSort() async {
    /// buble sort
    for (int i = 0; i < _list.length - 1; i++) {
      await Future.delayed(Duration(milliseconds: functionDelay));
      for (int j = 0; j < _list.length - i - 1; j++) {
        _colors[j] = Colors.red;
        _colors[j + 1] = Colors.red;
        notifyListeners();
        if (_list[j] > _list[j + 1]) {
          var tmp = _list[j];
          _list[j] = _list[j + 1];
          _list[j + 1] = tmp;
          notifyListeners();
        }
        await Future.delayed(Duration(milliseconds: functionDelay));
        _colors[j] = Colors.teal;
        _colors[j + 1] = Colors.teal;
        notifyListeners();
      }
    }
  }

  Future recursiveBubbleSort(List array, int n) async {
    /// recursive buble sort
    if (n == 1) {
      return;
    }
    for (int i = 0; i < n - 1; i++) {
      _colors[i] = Colors.red;
      _colors[i + 1] = Colors.red;
      notifyListeners();
      if (array[i] > array[i + 1]) {
        var tmp = array[i];
        array[i] = array[i + 1];
        array[i + 1] = tmp;
      }
      notifyListeners();
      await Future.delayed(Duration(milliseconds: _functionDelay));
      _colors[i] = Colors.teal;
      _colors[i + 1] = Colors.teal;
      notifyListeners();
    }
    recursiveBubbleSort(array, n - 1);
  }

  Future selectionSort() async {
    /// selection sort
    for (int i = 0; i < _list.length - 1; i++) {
      await Future.delayed(Duration(milliseconds: _functionDelay));

      /// minimum index, gets exchanged with another if its smaller
      int minindex = i;

      for (int j = i + 1; j < _list.length; j++) {
        _colors[j] = Colors.red;
        _colors[minindex] = Colors.red;
        notifyListeners();
        await Future.delayed(Duration(milliseconds: _functionDelay));
        _colors[j] = Colors.teal;
        _colors[minindex] = Colors.teal;
        notifyListeners();
        if (_list[j] < _list[minindex]) {
          minindex = j;
        }
      }
      var tmp = _list[minindex];
      _list[minindex] = _list[i];
      _list[i] = tmp;
      notifyListeners();
    }
  }

  /// next two function makes up merge sort
  Future mergeSort(List<int> array, int leftI, int rightI) async {
    ///
    await Future.delayed(Duration(milliseconds: functionDelay));

    /// merge sort
    if (leftI < rightI) {
      int middleIndex = (rightI + leftI) ~/ 2;
      mergeSort(array, leftI, middleIndex);
      mergeSort(array, middleIndex + 1, rightI);

      merge(array, leftI, middleIndex, rightI);
      notifyListeners();
    }
  }

  merge(List<int> array, int leftI, int middleI, int rightI) {
    int leftSize = middleI - leftI + 1;
    int rightSize = rightI - middleI;

    List leftList = List(leftSize);
    List rightList = List(rightSize);

    for (int i = 0; i < leftSize; i++) {
      leftList[i] = array[leftI + i];
    }
    for (int j = 0; j < rightSize; j++) {
      rightList[j] = array[middleI + j + 1];
    }

    int i = 0, j = 0;
    int k = leftI;

    while (i < leftSize && j < rightSize) {
      if (leftList[i] <= rightList[j]) {
        array[k] = leftList[i];
        i++;
      } else {
        array[k] = rightList[j];
        j++;
      }
      k++;
    }

    while (i < leftSize) {
      array[k] = leftList[i];
      i++;
      k++;
    }

    while (j < rightSize) {
      array[k] = rightList[j];
      j++;
      k++;
    }
  }
}
