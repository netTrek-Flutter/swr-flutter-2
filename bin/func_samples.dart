timesTwo(x) {
  return x * 2;
}

// timesFour ( x ) {
//   return timesTwo( timesTwo( x ) );
// }
// =>
timesFour(x) => timesTwo(timesTwo(x));

runTwice(input, fct) {
  for (int i = 0; i < 2; i++) {
    input = fct(input);
  }
  return input;
}

void main(List<String> arguments) {
  print('timesTwo ( 2 ) ${timesTwo(2)}'); // 4
  print('timesFour ( 2 ) ${timesFour(2)}'); // 8
  print('runTwice - 1 ${runTwice(2, timesTwo)}'); //8
  print('runTwice - 2 ${runTwice(2, (x) => x + 1)}'); //4 - ( 2 + 1 ) + 1
  print('runTwice - 3 ${runTwice(2, (x) {
    // x = x % 2 == 0 ? x + 1 : x;
    if (x % 2 == 0) {
      x = x + 1;
    }
    return x + 1;
  })}'); //4 - ( 2 + 1 ) + 1
}
