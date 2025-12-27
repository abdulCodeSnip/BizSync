void main() {
  var myArray = [10, 41, 234, 55, 250, 2, 150, 20, 88, 1255, 1, 0, 153];
  for (int i = 0; i < myArray.length; i++) {
    for (int j = 0; j < myArray.length - 1; j++) {
      if (myArray[j] > myArray[j + 1]) {
        int temp = myArray[j];
        myArray[j] = myArray[j + 1];
        myArray[j + 1] = temp;
      }
    }
  }
  for (int i = 0; i < myArray.length; i++) {
    print(myArray[i]);
  }
}
