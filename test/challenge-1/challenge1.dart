import 'chalenge_1_test.dart';

class Challenge1 {
  Map<String, double> numbersFractionCalculator(List<int> numbers) {
    int positiveOccurences = 0;
    int negativeOccurences = 0;
    int zeroOccurences = 0;
    for (int number in numbers) {
      if (number == 0) {
        zeroOccurences++;
      }
      if (number > 0) {
        positiveOccurences++;
      }
      if (number < 0) {
        negativeOccurences++;
      }
    }
    return {
      "positives": round(positiveOccurences / numbers.length.toDouble(), 6),
      "negative": round(negativeOccurences / numbers.length.toDouble(), 6),
      "zeros": round(zeroOccurences / numbers.length.toDouble(), 6),
    };
  }
}
