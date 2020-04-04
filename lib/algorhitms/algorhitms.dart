import 'package:sorting/algorhitms/algo-class.dart';
import 'package:sorting/screens/algorhitms/bubblesort.dart';
import 'package:sorting/screens/algorhitms/mergeSort.dart';
import 'package:sorting/screens/algorhitms/recur_bubblesort.dart';
import 'package:sorting/screens/algorhitms/selectionSort.dart';

var bubbleSort = Algorhitm(
  title: 'Bubble Sort',
  shortDescription:
      'Bubble sort is the simplest sorting algorhitm, but also very slow!',
  page: BubbleSortPage(),
);

var recursiveBubbleSort = Algorhitm(
  title: 'Recursive Bubble Sort',
  shortDescription:
      'A Recursive example of Bubble sort',
  page: RecursiveBubbleSortPage(),
);

var selectionSort = Algorhitm(
  title: 'Selection Sort',
  shortDescription:
      'Continously finds the minimum element, and swap this with the beginning element of the array.',
  page: SelectionSortPage(),
);

var mergeSort = Algorhitm(
  title: 'Merge Sort',
  shortDescription:
      'Divides the inpiut array in two halves, calls itself (recursively) and then merges the two sorted halves.',
  page: MergeSortPage(),
);
