import 'package:http/http.dart' as http;
import 'dart:convert';

class User {
  final String name;
  final int amount;
  User({required this.name, required this.amount});
}

class Pot {
  int total = 0;
  List<String> nameList = [];
  List<int> priceList = [];
  Pot({required this.nameList, required this.priceList, required this.total}) {
    for (int i = 0; i < priceList.length; i++) {
      priceList[i] = (priceList[i] * 100) ~/ total;
      nameList[i] = nameList[i].substring(0, 1).toUpperCase() +
          nameList[i].substring(1).toLowerCase();
    }

    nameList.removeLast();
    priceList.removeLast();

    insertionSort(priceList, nameList);
  }

  void insertionSort(List<int> arr, List<String> arr2) {
    int n = arr.length;
    for (int i = 1; i < n; i++) {
      int key = arr[i];
      String temp = arr2[i];
      int j = i - 1;
      while (j >= 0 && arr[j] < key) {
        arr[j + 1] = arr[j];
        arr2[j + 1] = arr2[j];
        j--;
      }
      arr[j + 1] = key;
      arr2[j + 1] = temp;
    }
  }
}
