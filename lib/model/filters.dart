enum Filters { gluten, lactose, vegan, vegetarian }

extension FilteExtensions on Filters {
  String get title {
    switch (this) {
      case Filters.gluten:
        return "Gluten";
      case Filters.lactose:
        return "Lactose";
      case Filters.vegan:
        return "Vegan";
      case Filters.vegetarian:
        return "Vegetarian";
    }
  }

  String get subTitle {
    switch (this) {
      case Filters.gluten:
        return "Only include gluten-free meals";
      case Filters.lactose:
        return "Only include lactose-free meals";
      case Filters.vegan:
        return "Only include vegan-free meals";
      case Filters.vegetarian:
        return "Only include vegetarian-free meals";
    }
  }
}
