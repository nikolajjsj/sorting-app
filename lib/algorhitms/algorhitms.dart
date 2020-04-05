import 'package:sorting/algorhitms/algo-class.dart';

var bubbleSort = Algorhitm(
  title: 'Bubble Sort',
  shortDescription:
      'Bubble sort is the simplest sorting algorhitm, but also very slow!',
  url: 'https://en.wikipedia.org/wiki/Bubble_sort',
  timeComplexity: 'O(n^2)',
);

var recursiveBubbleSort = Algorhitm(
  title: 'Recursive Bubble Sort',
  shortDescription: 'A Recursive example of Bubble sort',
  url: 'https://en.wikipedia.org/wiki/Bubble_sort',
  timeComplexity: 'O(n^2)',
);

var cocktailSort = Algorhitm(
  title: 'Cocktail Sort',
  shortDescription:
      'Variation of Bubble Sort, but traverses through the array in both directions, alternatively',
  url: 'https://en.wikipedia.org/wiki/Cocktail_shaker_sort',
  timeComplexity: 'O(n^2)',
);

var selectionSort = Algorhitm(
  title: 'Selection Sort',
  shortDescription:
      'Continously finds the minimum element, and swap this with the beginning element of the array.',
  url: 'https://en.wikipedia.org/wiki/Selection_sort',
  timeComplexity: 'O(n^2)',
);

var insertionSort = Algorhitm(
  title: 'Insertion Sort',
  shortDescription:
      'Simple algorhitm that works the same as when humans sort playing cards',
  url: 'https://en.wikipedia.org/wiki/Insertion_sort',
  timeComplexity: 'O(n^2)',
);

var pigeonholeSort = Algorhitm(
  title: 'Pigeonhole Sort',
  shortDescription:
      'Suitable for sorting arrays where elements = possible key values',
  url: 'https://en.wikipedia.org/wiki/Pigeonhole_sort',
  timeComplexity: 'O(n + k)',
);

var mergeSort = Algorhitm(
  title: 'Merge Sort',
  shortDescription:
      'Divides array halves, recursively, afterwhich it merges the two sorted halves.',
  url: 'https://en.wikipedia.org/wiki/Merge_sort',
  timeComplexity: 'O(n log n)',
);
