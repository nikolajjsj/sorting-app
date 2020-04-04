import 'package:flutter/material.dart';
import 'package:sorting/algorhitms/algorhitms.dart';
import 'package:sorting/styles.dart';
import 'package:sorting/widgets/sort_card.dart';

class HomePage extends StatelessWidget {
  /// list of the algorhitms showed on this page
  final List _sortingAlgorhitms = [
    bubbleSort,
    recursiveBubbleSort,
    selectionSort,
    mergeSort,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Algorithms', style: TextStyles.title),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _sortingAlgorhitms.length,
        itemBuilder: (context, index) {
          return SortCard(
            title: _sortingAlgorhitms[index].title,
            shortDescription: _sortingAlgorhitms[index].shortDescription,
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => _sortingAlgorhitms[index].page,
              ),
            ),
          );
        },
      ),
    );
  }
}
