void main(List<String> arguments) {
  // native Datentypen - int, double bool

  var isFalse = false;

  bool isTrue = true;

  int num = 123;
  double myDouble = 12.12;

  int? myNum; // int | null

  if (myNum == null) {
    print('not defined');
  } else {
    print(null);
  }

  print(myNum ?? 'not defined');

  myNum = 123;
  print(myNum);
  myNum = 123;

  List<String> names = ['heike', 'frank'];
  names.add('heike');
  print(names);

  Set<String> nameSet = {'heike', 'frank'};
  print(nameSet);
  nameSet.add('peter');
  nameSet.add('peter');
  nameSet.add('peter');
  print(nameSet);

  Map<int, String> userList = {
    1: 'Peter',
    2: 'Frank',
    4: 'Heike',
    4: 'Hans',
  };

  print(userList);

  // final int finalNum = 123;
  // finalNum = 455;

  final int finalNum;

  finalNum = 123;

  print(finalNum);

  const int myConstNum = 123;
  print(myConstNum);

  const List<String> constNames = ['peter', 'hans'];
  List<String> constValuesName = const ['peter', 'hans'];

  /*
  print(arguments);
  print('Hello world! $arguments - ${arguments.length}');
  */
}
