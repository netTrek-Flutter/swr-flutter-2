abstract class MyPosition {
  int x = 0;
  int y = 0;

  void move(int x,
      int y); // fehlt der Körper muss bei Vererbung die Funktion bedient werden

  void makeNoise() {
    print('piep');
  }

  @override
  String toString() {
    return 'MyPosition{x: $x, y: $y}';
  }
}

class Car implements MyPosition {
  @override
  int x;

  @override
  int y;

  Car(this.x, this.y);

  @override
  void makeNoise() {
    print('brumm');
  }

  @override
  void move(int x, int y) {
    this.x += x;
    this.y += y;
  }
}

class Ship extends MyPosition {
  @override
  void move(int x, int y) {
    makeNoise();
    this.x += x * 3;
    this.y += y * 3;
    print(this.toString());
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

  @override
  void makeNoise() {
    print('noise');
  }
}
