class MyClass {
  static int myStaticNum = 1;
  static const double pi = 3.14;

  int num = 1;
  int? numNullable;

  // final int myFinalNum;
  // MyClass(this.myFinalNum); // initialisiert finale Eigenschaften

  MyClass();

  // MyClass.generate(this.num); // ohne Körper nur num Wert setzen

  // MyClass.generate(this.num) {
  //   print('generate myClass');
  // }

  MyClass.generate({required this.num, this.numNullable});

  int sum(int b) {
    return num + b;
  }

  @override
  String toString() {
    return 'MyClass{num: $num, numNullable: $numNullable}';
  }
}
