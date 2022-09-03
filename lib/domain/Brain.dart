import 'dart:math';

class CalcBrain {
  CalcBrain({required this.age, required this.weight, required this.height});

  final double height;
  final double weight;
  final double age;

  late double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);

    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (age < 18) {
      return "Du bist noch zu Jung für diesen BMI Rechner";
    } else if (age >= 18 && age < 24) {
      if (_bmi <= 19) {
        return "Du bist Untergewichtig";
      } else if (_bmi > 19 && _bmi < 24) {
        return "Du hast Normalgewicht!";
      } else if (_bmi >= 24 && _bmi < 29) {
        return "Du hast Übergewicht!";
      } else if (_bmi >= 29 && _bmi < 39) {
        return "Du leidest unter Adipositas";
      } else if (_bmi >= 39) {
        return "Du hast starke Adipositas";
      } else {
        return "Es ist ein Fehler aufgetreten";
      }
    } else if (age >= 24 && age < 34) {
      if (_bmi <= 20) {
        return "Du bist Untergewichtig";
      } else if (_bmi > 20 && _bmi < 25) {
        return "Du hast Normalgewicht!";
      } else if (_bmi >= 25 && _bmi < 30) {
        return "Du hast Übergewicht!";
      } else if (_bmi >= 30 && _bmi < 40) {
        return "Du leidest unter Adipositas";
      } else if (_bmi >= 40) {
        return "Du hast starke Adipositas";
      } else {
        return "Fehler";
      }
    } else if (age >= 34 && age < 44) {
      if (_bmi <= 21) {
        return "Du bist Untergewichtig";
      } else if (_bmi > 21 && _bmi < 26) {
        return "Du hast Normalgewicht!";
      } else if (_bmi >= 26 && _bmi < 31) {
        return "Du hast Übergewicht!";
      } else if (_bmi >= 31 && _bmi < 41) {
        return "Du leidest unter Adipositas";
      } else if (_bmi >= 41) {
        return "Du hast starke Adipositas";
      } else {
        return "Fehler";
      }
    } else if (age >= 44 && age < 54) {
      if (_bmi <= 22) {
        return "Du bist Untergewichtig";
      } else if (_bmi > 22 && _bmi < 27) {
        return "Du hast Normalgewicht!";
      } else if (_bmi >= 27 && _bmi < 32) {
        return "Du hast Übergewicht!";
      } else if (_bmi >= 32 && _bmi < 42) {
        return "Du leidest unter Adipositas";
      } else if (_bmi >= 42) {
        return "Du hast starke Adipositas";
      } else {
        return "Fehler";
      }
    } else if (age >= 55) {
      if (_bmi <= 23) {
        return "Du bist Untergewichtig";
      } else if (_bmi > 23 && _bmi < 28) {
        return "Du hast Normalgewicht!";
      } else if (_bmi >= 28 && _bmi < 33) {
        return "Du hast Übergewicht!";
      } else if (_bmi >= 33 && _bmi < 43) {
        return "Du leidest unter Adipositas";
      } else if (_bmi >= 43) {
        return "Du hast starke Adipositas";
      } else {
        return "Es ist ein Fehler aufgetreten";
      }
    } else {
      return "Fehler";
    }
  }

  String getInterpration() {
    if (age < 18) {
      return "Du bist noch zu Jung für diesen BMI Rechner";
    } else if (age >= 18 && age < 24) {
      if (_bmi <= 19) {
        return "Du bist Untergewichtig";
      } else if (_bmi > 19 && _bmi < 24) {
        return "Du hast Normalgewicht!";
      } else if (_bmi >= 24 && _bmi < 29) {
        return "Du hast Übergewicht!";
      } else if (_bmi >= 29 && _bmi < 39) {
        return "Du leidest unter Adipositas";
      } else if (_bmi >= 39) {
        return "Du hast starke Adipositas";
      } else {
        return "Es ist ein Fehler aufgetreten";
      }
    } else if (age >= 24 && age < 34) {
      if (_bmi <= 20) {
        return "Du bist Untergewichtig";
      } else if (_bmi > 20 && _bmi < 25) {
        return "Du hast Normalgewicht!";
      } else if (_bmi >= 25 && _bmi < 30) {
        return "Du hast Übergewicht!";
      } else if (_bmi >= 30 && _bmi < 40) {
        return "Du leidest unter Adipositas";
      } else if (_bmi >= 40) {
        return "Du hast starke Adipositas";
      } else {
        return "Fehler";
      }
    } else if (age >= 34 && age < 44) {
      if (_bmi <= 21) {
        return "Du bist Untergewichtig";
      } else if (_bmi > 21 && _bmi < 26) {
        return "Du hast Normalgewicht!";
      } else if (_bmi >= 26 && _bmi < 31) {
        return "Du hast Übergewicht!";
      } else if (_bmi >= 31 && _bmi < 41) {
        return "Du leidest unter Adipositas";
      } else if (_bmi >= 41) {
        return "Du hast starke Adipositas";
      } else {
        return "Fehler";
      }
    } else if (age >= 44 && age < 54) {
      if (_bmi <= 22) {
        return "Du bist Untergewichtig";
      } else if (_bmi > 22 && _bmi < 27) {
        return "Du hast Normalgewicht!";
      } else if (_bmi >= 27 && _bmi < 32) {
        return "Du hast Übergewicht!";
      } else if (_bmi >= 32 && _bmi < 42) {
        return "Du leidest unter Adipositas";
      } else if (_bmi >= 42) {
        return "Du hast starke Adipositas";
      } else {
        return "Fehler";
      }
    } else if (age >= 55) {
      if (_bmi <= 23) {
        return "Du bist Untergewichtig";
      } else if (_bmi > 23 && _bmi < 28) {
        return "Du hast Normalgewicht!";
      } else if (_bmi >= 28 && _bmi < 33) {
        return "Du hast Übergewicht!";
      } else if (_bmi >= 33 && _bmi < 43) {
        return "Du leidest unter Adipositas";
      } else if (_bmi >= 43) {
        return "Du hast starke Adipositas";
      } else {
        return "Es ist ein Fehler aufgetreten";
      }
    } else {
      return "Fehler";
    }
  }
}
