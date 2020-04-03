import 'package:flutter/material.dart';
import 'package:sorting/algorhitms/algorhitms.dart';
import 'package:sorting/styles.dart';
import 'package:sorting/utils/random.dart';

class SelectionSortPage extends StatefulWidget {
  static Route<dynamic> route() {
    return MaterialPageRoute(builder: (context) => SelectionSortPage());
  }

  @override
  _SelectionSortPageState createState() => _SelectionSortPageState();
}

class _SelectionSortPageState extends State<SelectionSortPage> {
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

  void sortList() async {
    /// selection sort
    for (int i = 0; i < _list.length - 1; i++) {
      /// minimum index, gets exchanged with another if its smaller
      int minindex = i;

      for (int j = i + 1; j < _list.length; j++) {
        if (this.mounted) {
          setState(() {
            _colors[j] = Colors.red;
            _colors[minindex] = Colors.red;
          });
        }
        if (this.mounted) {
          await Future.delayed(Duration(milliseconds: 50));
          _colors[j] = Colors.teal;
          _colors[minindex] = Colors.teal;
        }
        if (_list[j] < _list[minindex]) {
          minindex = j;
        }
      }

      var tmp = _list[minindex];
      _list[minindex] = _list[i];
      _list[i] = tmp;
      if (this.mounted) {
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(selectionSort.title),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              selectionSort.shortDescription,
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
                onPressed: () => sortList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
