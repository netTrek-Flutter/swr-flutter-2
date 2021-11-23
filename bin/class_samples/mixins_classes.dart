abstract class Position {
  int x = 0;
  int y = 0;
}

mixin Move {
  void move(int x, int y) {
    print('move $x - $y ');
  }
}

mixin MoveTo {
  void moveTo(int x, int y) {
    print('moveTo $x - $y ');
  }
}

class Location extends Position with Move, MoveTo {}
