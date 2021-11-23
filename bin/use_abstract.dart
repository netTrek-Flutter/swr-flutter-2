import 'class_samples/my_abstract.dart';

void main(List<String> arguments) {
  // geht nicht
  // MyPosition myPos = MyPosition();

  final Ship ship = Ship();
  print(ship);
  print(ship is MyPosition);
  print(ship is Ship);

  Car car = Car(0, 0);
  print(car is MyPosition);
  print(car is Car);

/*
  // MyPosition myPos = MyPosition();
  Location myLoc = Location();
  // print(myPos);
  UseAsInterface myPos = UseAsInterface(y: 111);
  print(myPos is MyPosition);
  print(myLoc is MyPosition);


  final Map<String, int> map = {
    'macBook': 111,
    'macBookAir': 112
  };

  map['macBookAir'] = 222;

  print ( map['macBookAir'] ); //112

  */
}
