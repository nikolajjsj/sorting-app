import 'package:flutter/material.dart';
import 'package:sorting/algorhitms/algorhitms.dart';
import 'package:sorting/styles.dart';
import 'package:sorting/utils/random.dart';

class BubbleSortPage extends StatefulWidget {
  static Route<dynamic> route() {
    return MaterialPageRoute(builder: (context) => BubbleSortPage());
  }

  @override
  _BubbleSortPageState createState() => _BubbleSortPageState();
}

class _BubbleSortPageState extends State<BubbleSortPage> {
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
    /// buble sort
    for (int i = 0; i < _list.length - 1; i++) {
      for (int j = 0; j < _list.length - i - 1; j++) {
        if (_list[j] > _list[j + 1]) {
          if (this.mounted) {
            setState(() {
              _colors[j] = Colors.red;
              _colors[j + 1] = Colors.red;
            });
          }
          var tmp = _list[j];
          _list[j] = _list[j + 1];
          _list[j + 1] = tmp;
          if (this.mounted) {
            await Future.delayed(Duration(milliseconds: 50));
            setState(() {
              _colors[j] = Colors.teal;
              _colors[j + 1] = Colors.teal;
            });
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(bubbleSort.title),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              bubbleSort.shortDescription,
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
