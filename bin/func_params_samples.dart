int timesTwo(int x) {
  return x * 2;
}

int sum(int a, int b) {
  return a + b;
}

int timesFour(int x) => timesTwo(timesTwo(x));

int runTwice(int input, int Function(int) fct) {
  for (int i = 0; i < 2; i++) {
    input = fct(input);
  }
  return input;
}

double withVat(int val, [int vat = 19]) {
  return val + val * vat / 100;
}

// named - null - optional
// int namedParams({int? a})

int namedParams({required int a, int? b, int c = 0}) {
  return a + (b ?? c);
}

void main(List<String> arguments) {
  print('namedParams ( c: 12, a: 12 ) ${namedParams(c: 12, a: 12)}'); // 24
  print('namedParams ( b: 11, a: 12 ) ${namedParams(b: 11, a: 12)}'); // 23
  print(
      'namedParams ( b: 11, a: 12, c: 2 ) ${namedParams(b: 11, a: 12, c: 2)}'); // 23
  print('namedParams ( a: 12, c: 2 ) ${namedParams(a: 12, c: 2)}'); // 14
  print('namedParams ( a: 12 ) ${namedParams(a: 12)}'); // 12
  print('sum ( 2, 3 ) ${sum(2, 3)}'); // 5
  print('withVat ( 100 ) ${withVat(100)}'); // 119
  print('withVat ( 100, 7 ) ${withVat(100, 7)}'); // 107
/*
  print('timesTwo ( 2 ) ${timesTwo(2)}'); // 4
  print('timesFour ( 2 ) ${timesFour(2)}'); // 8
  print('runTwice - 1 ${runTwice(2, timesTwo)}'); //8
  print('${runTwice(2, (p0) => p0 * 2)}');
  print('runTwice - 2 ${runTwice(2, (x) => x + 1)}'); //4 - ( 2 + 1 ) + 1
  print('runTwice - 3 ${runTwice(2, (x) {
    // x = x % 2 == 0 ? x + 1 : x;
    if (x % 2 == 0) {
      x = x + 1;
    }
    return x + 1;
  })}'); //4 - ( 2 + 1 ) + 1
  */
}
