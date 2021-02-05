enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

extension AffordabilityExtension on Affordability {
  String get name {
    switch (this) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Luxurious:
        return 'Luxurious';
      default:
        return null;
    }
  }
}
