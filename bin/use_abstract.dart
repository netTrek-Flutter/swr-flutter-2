import 'class_samples/my_abstract.dart';

void main(List<String> arguments) {
  // MyPosition myPos = MyPosition();
  Location myLoc = Location();
  // print(myPos);
  UseAsInterface myPos = UseAsInterface(y: 111);
  print(myPos is MyPosition);
  print(myLoc is MyPosition);
}
