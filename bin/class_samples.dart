import 'class_samples/my_class.dart';

void main(List<String> arguments) {
  MyClass myClass = MyClass();
  myClass.num = 2;
  // print(myClass.num);
  // print(myClass.numNullable);
  print(myClass);
  print(myClass is MyClass);
}
