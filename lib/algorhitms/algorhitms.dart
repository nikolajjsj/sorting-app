import 'package:sorting/algorhitms/algo-class.dart';
import 'package:sorting/screens/algorhitms/bubblesort.dart';
import 'package:sorting/screens/algorhitms/mergeSort.dart';
import 'package:sorting/screens/algorhitms/selectionSort.dart';

var bubbleSort = Algorhitm(
  title: 'Bubble Sort',
  shortDescription:
      'Bubble sort is the simplest sorting algorhitm, but also very slow!',
  route: BubbleSortPage.route(),
);

var selectionSort = Algorhitm(
  title: 'Selection Sort',
  shortDescription:
      'Continously finds the minimum element, and swap this with the beginning element of the array.',
  route: SelectionSortPage.route(),
);

var mergeSort = Algorhitm(
  title: 'Merge Sort',
  shortDescription:
      'Divides the inpiut array in two halves, calls itself (recursion) and then merges the two sorted halves.',
  route: MergeSortPage.route(),
);
