class NumberController {
  String selectedRule = 'Even Numbers';

  void setRule(String rule) {
    selectedRule = rule;
  }

  bool shouldHighlight(int number) {
    switch (selectedRule) {
      case 'Odd Numbers':
        return isOddNumber(number);
      case 'Even Numbers':
        return isEvenNumber(number);
      case 'Prime Numbers':
        return isPrimeNumber(number);
      case 'Fibonacci Numbers':
        return isFibonacciNumber(number);
      default:
        return false;
    }
  }

  bool isOddNumber(int number) => number % 2 != 0;

  bool isEvenNumber(int number) => number % 2 == 0;

  bool isPrimeNumber(int number) {
    if (number < 2) return false;
    for (int i = 2; i <= number ~/ 2; i++) {
      if (number % i == 0) return false;
    }
    return true;
  }

  bool isFibonacciNumber(int number) {
    int a = 0, b = 1;
    while (b < number) {
      int temp = b;
      b = a + b;
      a = temp;
    }
    return number == b || number == a;
  }
}
