import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/filters_provider.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

extension FilterExtension on Filter {
  String get title {
    switch (this) {
      case Filter.vegan:
        return "Vegan";
      case Filter.glutenFree:
        return "Gluten-Free";
      case Filter.lactoseFree:
        return "Lactose-Free";
      case Filter.vegetarian:
        return "Organic";
    }
  }

  String get subTitle {
    switch (this) {
      case Filter.vegan:
        return "Only includes vegan meals.";
      case Filter.glutenFree:
        return "Excludes gluten-containing meals.";
      case Filter.lactoseFree:
        return "Excludes lactose-containing meals.";
      case Filter.vegetarian:
        return "Only includes organic meals.";
    }
  }
}

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters')),
      body: Column(
        children:
            activeFilters.entries.map((filter) {
              return SwitchListTile(
                value: filter.value,
                onChanged: (isChecked) {
                  ref
                      .read(filtersProvider.notifier)
                      .setFilter(filter.key, isChecked);
                },
                title: Text(
                  filter.key.title,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                subtitle: Text(
                  filter.key.subTitle,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
              );
            }).toList(),
      ),
    );
  }
}
