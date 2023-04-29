class Challenge2 {
  int diceFacesCalculator(int number1, int number2, int number3) {
    List<int> acceptedValues = List.generate(6, (index) => index + 1);
    List<int> diceValues = [number1, number2, number3];
    if (!acceptedValues.contains(number1) ||
        !acceptedValues.contains(number2) ||
        !acceptedValues.contains(number3)) {
      throw Exception("Invalid dice number");
    }
    int repeatedOccurences = 1;
    int greatestValue = 0;
    for (int i = 0; i < diceValues.length; i++) {
      int currentValue = diceValues[i];
      if (i > 0) {
        int lastValue = diceValues[i - 1];
        if (currentValue == lastValue) {
          repeatedOccurences++;
        }
      }
      greatestValue =
          currentValue > greatestValue ? currentValue : greatestValue;
    }
    return repeatedOccurences * greatestValue;
  }
}
