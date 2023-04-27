/*
Pot class is the data type of each "pot" for each group of users.
It has 3 main properties - 
total - the total pot value
nameList - the list of names in the pot
priceList - the list of prices of the property
*/

class Pot {
  int total = 0;
  List<String> nameList = [];
  List<int> priceList = [];

  // Constructor for the pot
  Pot({required this.nameList, required this.priceList, required this.total}) {
    for (int i = 0; i < priceList.length; i++) {
      // Storing the price as a percentage
      priceList[i] = (priceList[i] * 100) ~/ total;

      // Capitalizing the names of each person in the pot
      nameList[i] = nameList[i].substring(0, 1).toUpperCase() +
          nameList[i].substring(1).toLowerCase();
    }

    // Removing the last element from the list (as it is not necessary )
    nameList.removeLast();
    priceList.removeLast();

    // Sorting the lists
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
