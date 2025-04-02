import 'package:flutter/material.dart';

import '../model/filters.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.filters});

  final Map<Filters, bool> filters;

  @override
  State<FiltersScreen> createState() {
    return _FilterStateScreen();
  }
}

class _FilterStateScreen extends State<FiltersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Filters')),
      body: Column(
        children:
            widget.filters.entries.map((filter) {
              return SwitchListTile(
                value: filter.value,
                onChanged: (isChecked) {
                  setState(() {
                    widget.filters[filter.key] = isChecked;
                  });
                },
                title: Text(
                  filter.key.title,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                subtitle: Text(
                  filter.key.subTitle,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                  ),
                ),
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: EdgeInsets.only(left: 34, right: 22),
              );
            }).toList(),
      ),
    );
  }
}
