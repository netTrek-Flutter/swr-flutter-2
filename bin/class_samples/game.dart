class Location {
  int x;
  int y;
  Location({this.x = 0, this.y = 0});
  // Location({int x = 0, int y = 0}) // das passiert dabei
  //     : this.x = x,
  //       this.y = y;

  @override
  String toString() {
    return '($x, $y)';
  }
}

mixin MoveTo on GameCharacterPos, GameCharacterMoveTo {
  Location moveTo({int? x, int? y}) {
    if (x != null) _pos.x = x;
    if (y != null) _pos.y = y;
    return _pos;
  }
}

mixin MoveBy on GameCharacterPos, GameCharacterMoveBy {
  Location moveBy({int? x, int? y}) {
    if (x != null) _pos.x += x;
    if (y != null) _pos.y += y;
    return _pos;
  }
}

mixin MoveBySlow on GameCharacterPos, GameCharacterMoveBy {
  Location moveBy({int? x, int? y}) {
    if (x != null) _pos.x += x ~/ 2;
    if (y != null) _pos.y += y ~/ 2;
    return _pos;
  }
}

abstract class GameCharacterPos {
  final Location _pos;
  Location get pos => _pos;

  GameCharacterPos([Location? pos]) : _pos = pos ?? Location();

  // GameCharacterPos.zero (): _pos = Location(); // benanter Konstuktor
  // GameCharacterPos.postion (int x, int y ): _pos = Location( x: x, y: y );
}

abstract class GameCharacterMoveBy {
  Location moveBy({int? x, int? y});
}

abstract class GameCharacterMoveTo {
  Location moveTo({int? x, int? y});
}

abstract class GameCharacter extends GameCharacterPos
    implements GameCharacterMoveTo, GameCharacterMoveBy {
  final String _name;

  GameCharacter(this._name, [Location? pos]) : super(pos);

  @override
  String toString() {
    return 'GameCharacter{name: $_name, pos: $_pos}';
  }
}

class Enemy extends GameCharacter with MoveTo, MoveBy {
  Enemy(String name, [Location? pos]) : super(name, pos);
}

class EnemySlow extends GameCharacter with MoveBySlow, MoveTo {
  EnemySlow(String name, [Location? pos]) : super(name, pos);
}

void main(List<String> arguments) {
  Enemy enemy = Enemy('hans', Location(x: 1, y: 1));
  print(enemy);
  enemy.moveBy(x: 11);
  print(enemy);
  enemy.moveBy(y: 12);
  print(enemy);
  enemy.moveBy(x: -10, y: -11);
  print(enemy);
  enemy.moveTo(x: 0);
  print(enemy);
}

/*

GameCharacter{name: hans, pos: (1, 1)}
GameCharacter{name: hans, pos: (6, 1)}
GameCharacter{name: hans, pos: (6, 7)}
GameCharacter{name: hans, pos: (1, 2)}
GameCharacter{name: hans, pos: (0, 2)}

 */
