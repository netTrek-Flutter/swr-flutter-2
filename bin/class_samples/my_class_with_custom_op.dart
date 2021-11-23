class MyClassWithCustomOp {
  int _value;

  MyClassWithCustomOp(this._value);

  @override
  bool operator ==(Object other) =>
      other is MyClassWithCustomOp && // selbst bei vererbung true
      // runtimeType == other.runtimeType && // achtung - vererbung wird false
      _value == other._value;

  @override
  int operator +(MyClassWithCustomOp other) {
    _value += other._value;
    return _value;
  }

  @override
  String toString() {
    return 'MyClassWithCustomOp{_value: $_value}';
  }
}

void main() {
  MyClassWithCustomOp my1 = MyClassWithCustomOp(1);
  MyClassWithCustomOp my2 = MyClassWithCustomOp(2);
  MyClassWithCustomOp my1_1 = MyClassWithCustomOp(1);

  print(my1_1 == my1);
  print(my1 == my2);

  print(my1 + my2);
  print(my1);
  print(my2);
}
