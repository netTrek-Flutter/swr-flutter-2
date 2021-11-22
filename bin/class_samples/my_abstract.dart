abstract class MyPosition {
  int x = 0;
  int y = 0;

  void move(int x, int y);

  @override
  String toString() {
    return 'MyPosition{x: $x, y: $y}';
  }
}

class Location extends MyPosition {
  @override
  void move(int x, int y) {
    // TODO: implement move
  }
}

class UseAsInterface implements MyPosition {
  @override
  int x;

  @override
  int y;

  UseAsInterface({int x = 0, int y = 0})
      : x = x,
        y = y;

  @override
  void move(int x, int y) {
    // TODO: implement move
  }

  @override
  String toString() {
    return 'UseAsInterface{x: $x, y: $y}';
  }
}
