import 'dart:math';

enum ChannelTypes {
  amazon, // 0
  ebay // 1
}

class AmazonCart extends Cart {
  AmazonCart() : super('amazon'); // initList

}

class EbayCart extends Cart {
  EbayCart() : super('ebay'); // initList

}

class Cart {
  final Map<int, int> _items = {}; //
  String _name;

  Cart(this._name);

  factory Cart.build(ChannelTypes type) {
    switch (type) {
      case ChannelTypes.amazon:
        return new AmazonCart();
      case ChannelTypes.ebay:
        return EbayCart();
    }
  }

  /*
  set name(String value) {
    _name = value;
  }
  */

  String get name {
    return 'CART -> $_name';
  }

  int addItemAmout(int articleNo, [int amount = 1]) {
    return _chgAmount(articleNo, amount);
  }

  int? removeItemAmout(int articleNo, [int amount = 1]) {
    final int num = _chgAmount(articleNo, amount * -1);
    if (num <= 0) return _items.remove(articleNo);
    return num;
  }

  void removeItem(int articleNo) {
    _items.remove(articleNo);
  }

  void clear() {
    _items.clear();
  }

  int _chgAmount(int articleNo, [int amount = 1]) {
    _items.update(
      articleNo,
      (value) => max(value + amount, 0), // das wert nie kleiner 0
      ifAbsent: () => amount,
    );
    // final int num = _items[articleNo] ?? 0;
    // _items[articleNo] = num + amount;
    return _items[articleNo]!;
  }

  @override
  String toString() {
    return '$name items => $_items';
  }
}
