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
  List<List> _list;
  int n = 40;
  int highestNumber = 50;

  @override
  void initState() {
    super.initState();
    _list = randomNumbersList(n: n, highestNumber: highestNumber);
    setState(() {});
  }

  void newList() {
    setState(() {
      _list = randomNumbersList(n: n, highestNumber: highestNumber);
    });
  }

  void sortList() async {
    for (int i = 0; i < _list.length - 1; i++) {
      /// minimum index, gets exchanged with another if its smaller
      int min_index = i;

      for (int j = i + 1; j < _list.length; j++) {
        if (this.mounted) {
          setState(() {
            _list[j][1] = Colors.red;
            _list[min_index][1] = Colors.red;
          });
        }
        if (this.mounted) {
          await Future.delayed(Duration(milliseconds: 50));
          _list[j][1] = Colors.teal;
          _list[min_index][1] = Colors.teal;
        }
        if (_list[j][0] < _list[min_index][0]) {
          min_index = j;
        }
      }

      var tmp = _list[min_index][0];
      _list[min_index][0] = _list[i][0];
      _list[i][0] = tmp;
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
                      height: (height * .3) * (_list[index][0] / highestNumber),
                      width: width / highestNumber.toDouble(),
                      color: _list[index][1],
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
