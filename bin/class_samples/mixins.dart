abstract class Pos {
  int x;
  int y;

  Pos(this.x, this.y);

  void moveBy({int? x, int? y});
}

mixin SetPos on Pos {
  @override
  void moveBy({int? x, int? y}) {
    this.x += x ?? 0;
    this.y += y ?? 0;
  }
}

mixin SayHello {
  sayHello() {
    print('hello');
  }
}

mixin SayHello2 {
  String msg = 'hello msg';

  sayHello() {
    print(msg);
  }
}

class Saban with SayHello, SayHello2 {}

class Heike extends Saban {
  @override
  sayHello() {
    msg = '# $msg #'; // # # # test # # #
    return super.sayHello();
  }
}

class Mover extends Pos with SetPos {
  Mover(int x, int y) : super(x, y);
}

void main() {
  Saban saban = Heike();
  saban.msg = 'test';
  saban.sayHello();
  saban.sayHello();
  saban.sayHello();
}
