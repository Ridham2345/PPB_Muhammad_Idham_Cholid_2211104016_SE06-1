void main() {
  // Fixed Length List
  List<int> fixedList = List.filled(3, 0);
  fixedList[0] = 10;
  fixedList[1] = 20;
  fixedList[2] = 30;
  print(fixedList);
  
  // Growable List 
  List<int> growableList = [];
  growableList.add(10);
  growableList.add(20);
  growableList.add(30);
  print(growableList); 
  growableList.add(40);
  growableList.add(50);
  print(growableList); 
  growableList.remove(20);
  print(growableList); 
}
