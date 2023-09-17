import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/provider/filters_provider.dart';


class FiltersScreen extends ConsumerStatefulWidget{
  const FiltersScreen({
    super.key,
  });

  @override
  ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends ConsumerState<FiltersScreen>{
  var _glutenFreeFiltersSet = false;
  var _lactoseFreeFiltersSet = false;
  var _vegeterianFreeFiltersSet = false;
  var _veganFreeFiltersSet = false;

  @override
  void initState() {
    super.initState();
    final activeFilters = ref.read(filtersProvider);
    _glutenFreeFiltersSet = activeFilters[Filter.glutenFree]!;
    _lactoseFreeFiltersSet = activeFilters[Filter.lactoseFree]!;
    _vegeterianFreeFiltersSet = activeFilters[Filter.vegetarian]!;
    _veganFreeFiltersSet = activeFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // drawer: MainDrawer(onSelectScreen: (identifier) {
      //   Navigator.of(context).pop();
      //   if(identifier== 'meals'){
      //     Navigator.of(context).pushReplacement(
      //         MaterialPageRoute(
      //             builder: (ctx) => const TabsScreen()
      //         ),
      //     );
      //   }
      // },),
      body: WillPopScope(
        onWillPop: () async {
          ref.read(filtersProvider.notifier).setFilters({
            Filter.glutenFree: _glutenFreeFiltersSet,
            Filter.lactoseFree: _lactoseFreeFiltersSet,
            Filter.vegetarian: _vegeterianFreeFiltersSet,
            Filter.vegan: _veganFreeFiltersSet
          });
          return true;
        },
        child: Column(
          children: [
            SwitchListTile(
                value: _glutenFreeFiltersSet,
                onChanged: (isChecked) {
                  setState(() {
                    _glutenFreeFiltersSet = isChecked ;
                  });
                },
                title: Text(
                  'Gluten-free',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground
                  ),
                ),
              subtitle: Text('Only include gluten-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                  left: 34,
                  right: 22
              ),
            ),
            SwitchListTile(
              value: _lactoseFreeFiltersSet,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFreeFiltersSet = isChecked ;
                });
              },
              title: Text(
                'Lactose-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground
                ),
              ),
              subtitle: Text('Only include Lactose-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                  left: 34,
                  right: 22
              ),
            ),
            SwitchListTile(
              value: _vegeterianFreeFiltersSet,
              onChanged: (isChecked) {
                setState(() {
                  _vegeterianFreeFiltersSet = isChecked ;
                });
              },
              title: Text(
                'Vegeterian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground
                ),
              ),
              subtitle: Text('Only include Vegeterian meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                  left: 34,
                  right: 22
              ),
            ),
            SwitchListTile(
              value: _veganFreeFiltersSet,
              onChanged: (isChecked) {
                setState(() {
                  _veganFreeFiltersSet = isChecked ;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground
                ),
              ),
              subtitle: Text('Only include Vegan meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                  left: 34,
                  right: 22
              ),
            ),
          ],
        ),
      ),
    );
  }
}