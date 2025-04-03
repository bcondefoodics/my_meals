import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../screens/filters.dart';

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
    : super({
        Filter.glutenFree: false,
        Filter.vegan: false,
        Filter.vegetarian: false,
        Filter.lactoseFree: false,
      });

  void setFilter(Filter filter, bool value) {
    state = {...state, filter: value};
  }

  void setFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
      (ref) => FiltersNotifier(),
    );
