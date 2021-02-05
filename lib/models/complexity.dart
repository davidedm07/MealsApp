enum Complexity {
  Simple,
  Challenging,
  Hard,
}

extension ComplexityExtension on Complexity {
  String get name {
    switch (this) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
        return null;
    }
  }
}
