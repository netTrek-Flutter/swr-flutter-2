import 'class_samples/location.dart';
import 'class_samples/my_class.dart';

/**
 * Aufgabe
 *
 * Erzeugt eine Klasse Cart die einen Warenkorb abbildet
 * Die Klasse wird instanziiert mit dem Namen des Verkaufkanalse
 * z.B. Cart ('Amazon'); // damit wird klar das der Warenkorb nur im Amazon Kontext gültig ist
 * Verwendet Methoden wie
 *  - addItemAmount wo ihr anhand
 *    - einer Artikelnummer
 *    - und Anzahl
 *    Produkte in den Warenkorb legt ... achtet darauf das ein erneuter Aufruf den Wert erhöht.
 *  Verwendet die Methode removeItem um Produkte anhand ihrer Artikelnummer komplett zu entfernen
 *  Programmiert ein removeItemAmout wo ein Artiek um eine definierte Menge (Anzahl) reduziert wird
 *    Obacht - kein Wert kleiner 0 erlauben!
 *
 *
 *    Cart amazon = Cart ('amazon')
 *    amazon.addItemAmount ( 4711, 12 );
 *    amazon.addItemAmount ( 4711, 2 ); // 14
 *    amazon.removeItemAmount ( 4711, 13 );
 *    amazon.removeItem ( 4711 );
 *
 *
 *    - final Map<int, int> = _item = {};
 */

void main(List<String> arguments) {
  // const Location location = Location( 1, 2);
  // location = Location ( 3, 4 );

  Location location = const Location(1, 2);
  // location = const Location ( 3, 4 );

  const Location loc1 = Location(3, 3);
  Location loc2 = const Location(2, 3);
  Location loc3 = const Location(2, 3);
  Location loc4 = const Location(3, 3);
  print(loc1);
  print(loc2);
  print(loc2 == loc3); // true – same class & values
  print(loc2 == loc4); // false
  print(loc1 == loc4); // true – same class & values

  /*
  // MyClass generated = MyClass.generate(123);
  MyClass generated = MyClass.generate(num: 132);
  print(generated);
  print(generated.sum(123));
  print(MyClass.generate(num: 1, numNullable: 2));

  print(MyClass.myStaticNum);
  MyClass.myStaticNum = 2;
  print(MyClass.pi);

  MyClass myClass = MyClass();
  myClass.num = 2;
  */
  // print(myClass.num);
  // print(myClass.numNullable);
  /*
  print(myClass);
  print(myClass is MyClass);
  */
}
