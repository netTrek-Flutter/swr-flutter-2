import 'class_samples/cart.dart';
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
  final Cart cart = Cart('amazon');
  cart
        ..addItemAmout(12, 12)
        ..addItemAmout(12, 12)
        ..addItemAmout(13, 13)
      // ..removeItemAmout(13)
      // ..removeItemAmout(13)
      // ..removeItemAmout(13)
      // ..removeItemAmout(13, 10)
      // ..removeItem(12)
      ;

  final ComputerCart compCart = ComputerCart('ebay-klein');
  compCart.addComputer(ComputerName.macBook, 11);
  compCart.addComputer(ComputerName.macBook);
  compCart.addComputer(ComputerName.macBook);
  print(compCart);

  // cart.name = 'Saban'; // RO
  print(cart.name);

  print(Cart.build(ChannelTypes.ebay));
  /*
  cart
        ..addItemAmout(11) // 1
        ..addItemAmout(12) // 1
        ..addItemAmout(13, 2) // 2
        ..addItemAmout(12, 3) // 4
      ;
  print(cart);
  cart
        ..removeItemAmout(12, 2) // 2
        ..removeItemAmout(13) // 0
        ..removeItem(11)
        ..removeItemAmout(13) // 0
      ;
  print(cart);
  */
}
