import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sorting/provider/algo_provider.dart';
import 'package:sorting/styles.dart';
import 'package:sorting/widgets/sort_val_changer.dart';
import 'package:url_launcher/url_launcher.dart';

class SortPages extends StatefulWidget {
  SortPages({
    @required this.title,
    @required this.shortDescription,
    @required this.url,
  });

  final String title;
  final String shortDescription;
  final String url;

  @override
  _SortPagesState createState() => _SortPagesState();
}

class _SortPagesState extends State<SortPages> {
  Timer _timer;
  int _runtime = 0;

  getSortAlgorhitm(AlgorhitmNotifier notifier) {
    switch (widget.title) {
      case 'Bubble Sort':
        {
          return notifier.bubbleSort();
        }
      case 'Recursive Bubble Sort':
        {
          return notifier.recursiveBubbleSort(
            notifier.getList,
            notifier.getListLength,
          );
        }
      case 'Cocktail Sort':
        {
          return notifier.cocktailSort();
        }
      case 'Selection Sort':
        {
          return notifier.selectionSort();
        }
      case 'Insertion Sort':
        {
          return notifier.insertionSort();
        }
      case 'Merge Sort':
        {
          return notifier.mergeSort(
            notifier.getList,
            0,
            notifier.getListLength - 1,
          );
        }
      case 'Pigeonhole Sort':
        {
          return notifier.pigeonholeSort();
        }
    }
  }

  @override
  void dispose() {
    super.dispose();
    try {
      _timer.cancel();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final alNotifer = Provider.of<AlgorhitmNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.shortDescription,
              style: TextStyles.body,
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            height: height * .4,
            width: width * .95,
            child: ListView.builder(
              itemCount: alNotifer.getList.length,
              scrollDirection: Axis.horizontal,
              itemExtent: width * .95 / alNotifer.getListLength,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      height: (height * .3) *
                          (alNotifer.getList[index] /
                              alNotifer.highestGenNumber),
                      color: alNotifer.getColorList[index],
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
              SortValues(
                initialValue: alNotifer.getListLength + 1,
                onChanged: (value) => alNotifer.setListLength(value),
                text: 'n: ${alNotifer.getListLength + 1}',
              ),
              SortValues(
                initialValue: alNotifer.functionDelay,
                onChanged: (value) => alNotifer.setFunctionDelay(value),
                text: 'Iteration Delay: ${alNotifer.functionDelay} ms',
              ),
            ],
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                child: Text('Randomize', style: TextStyles.body),
                onPressed: () => alNotifer.generateLists(),
              ),
              Builder(
                builder: (context) {
                  return FlatButton(
                    child: Text('Sort!', style: TextStyles.body),
                    onPressed: () async {
                      _runtime = 0;
                      _timer = Timer.periodic(
                        Duration(milliseconds: 1),
                        (Timer timer) {
                          _runtime += 1;
                        },
                      );
                      await getSortAlgorhitm(alNotifer);
                      _timer.cancel();
                      Scaffold.of(context).showSnackBar(SnackBar(
                        duration: Duration(seconds: 1),
                        content: Text(
                          'Sorting time: $_runtime ms',
                          style: TextStyles.body,
                        ),
                      ));
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        child: Text(
          'wiki',
          style: TextStyles.body.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        onPressed: () => launch(widget.url),
      ),
    );
  }
}
