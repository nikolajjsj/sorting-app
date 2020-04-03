import 'package:flutter/material.dart';
import 'package:sorting/algorhitms/algorhitms.dart';
import 'package:sorting/styles.dart';
import 'package:sorting/utils/random.dart';

class MergeSortPage extends StatefulWidget {
  static Route<dynamic> route() {
    return MaterialPageRoute(builder: (context) => MergeSortPage());
  }

  @override
  _MergeSortPageState createState() => _MergeSortPageState();
}

class _MergeSortPageState extends State<MergeSortPage> {
  List<int> _list;
  List<MaterialColor> _colors;
  int n = 20;
  int highestNumber = 100;

  @override
  void initState() {
    super.initState();
    _list = randomNumbersList(n: n, highestNumber: highestNumber);
    _colors = randomNumberColorsList(n: n);
    setState(() {});
  }

  void newList() {
    setState(() {
      _list = randomNumbersList(n: n, highestNumber: highestNumber);
      _colors = randomNumberColorsList(n: n);
    });
  }

  void sortList(List<int> array, int leftI, int rightI) {
    Future.delayed(Duration(milliseconds: 50), () {
      /// merge sort
      if (leftI < rightI) {
        int middleIndex = (rightI + leftI) ~/ 2;
        sortList(_list, leftI, middleIndex);
        sortList(_list, middleIndex + 1, rightI);

        merge(_list, leftI, middleIndex, rightI);

        setState(() {});
      }
    });
  }

  void merge(List<int> array, int leftI, int middleI, int rightI) {
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

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(mergeSort.title),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              mergeSort.shortDescription,
              style: TextStyles.body,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            height: height * .4,
            child: ListView.builder(
              itemCount: _list.length,
              scrollDirection: Axis.horizontal,
              itemExtent: width / n,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      height: (height * .3) * (_list[index] / highestNumber),
                      width: width / n,
                      color: _colors[index],
                      margin: EdgeInsets.all(1.0),
                    ),
                  ],
                );
              },
            ),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                child: Text('Randomize', style: TextStyles.body),
                onPressed: () => newList(),
              ),
              FlatButton(
                child: Text('Sort!', style: TextStyles.body),
                onPressed: () => sortList(_list, 0, _list.length - 1),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
