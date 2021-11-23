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

enum ComputerName {
  macBook, // 0
  macBookAir, // 1
  macBookPro // 2
}

class StockItem {
  int articleNo;
  int amount;

  StockItem(this.articleNo, this.amount);
}

class ComputerCart extends Cart {
  final Map<ComputerName, StockItem> _stock = {
    ComputerName.macBook: StockItem(4711, 12),
    ComputerName.macBookAir: StockItem(4712, 8),
    ComputerName.macBookPro: StockItem(4713, 6),
  };

  ComputerCart(String name) : super(name);

  @override
  int addItemAmout(int articleNo, [int amount = 1]) {
    ComputerName? computerName;

    _stock.forEach((key, value) {
      if (value.articleNo == articleNo) computerName = key;
    });

    if (_stock[computerName]!.amount >= amount) {
      _stock[computerName]!.amount -= amount;
      return super.addItemAmout(articleNo, amount);
    }

    return 0;
  }

  int addComputer(ComputerName computerName, [int amount = 1]) {
    return addItemAmout(_stock[computerName]!.articleNo, amount);
  }
}

class Cart {
  final Map<int, int> _items; //
  String _name;

  // leer Warenkorb auf Basis Channel Name mit
  Cart(this._name) : _items = {};

  // vordefinierter Warenkorb auf Basis Channel Name mit
  Cart.withItems(this._name, {required Map<int, int> itmes}) : _items = itmes;

  // factory erzeugt eine Erbende Instanz und gibt diese dann zurück
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
