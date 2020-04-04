import 'package:flutter/material.dart';
import 'package:sorting/algorhitms/algorhitms.dart';
import 'package:sorting/styles.dart';
import 'package:sorting/utils/random.dart';

class RecursiveBubbleSortPage extends StatefulWidget {
  static Route<dynamic> route() {
    return MaterialPageRoute(builder: (context) => RecursiveBubbleSortPage());
  }

  @override
  _RecursiveBubbleSortPageState createState() =>
      _RecursiveBubbleSortPageState();
}

class _RecursiveBubbleSortPageState extends State<RecursiveBubbleSortPage> {
  List<int> _list;
  List<MaterialColor> _colors;
  int n = 40;
  int highestNumber = 50;

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

  void sortList(List array, int n) async {
    /// recursive buble sort
    if (n == 1) {
      return;
    }

    for (int i = 0; i < n - 1; i++) {
      if (array[i] > array[i + 1]) {
        var tmp = array[i];
        array[i] = array[i + 1];
        array[i + 1] = tmp;
      }
      await Future.delayed(Duration(milliseconds: 50));
      setState(() {});
    }
    sortList(array, n - 1);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(recursiveBubbleSort.title),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              recursiveBubbleSort.shortDescription,
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
                      width: width / highestNumber.toDouble(),
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
                onPressed: () => sortList(_list, _list.length),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
