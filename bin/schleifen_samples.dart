import 'dart:math';

void main(List<String> arguments) {
  for (int i = 0; i < 5; i++) {
    if (i % 2 == 0) {
      print(i);
    }
  }

  for (var x in List.generate(5, (index) => index * 2)) {
    print('for var in $x');
  }

  var r = Random();
  int i;

  while (r.nextBool()) {
    print('value is false ');
  }

  do {
    i = r.nextInt(3) + 1;
    print('do while  $i');
  } while (i != 3);
}
