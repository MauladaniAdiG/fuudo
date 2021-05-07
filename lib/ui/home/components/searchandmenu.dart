import 'package:app/bloc/providers.dart';
import 'package:app/models/pojo/mealcategories.dart';
import 'package:app/ui/home/components/searchbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchAndMenu extends StatelessWidget {
  final List<MealCategories>? mealCategories;
  final List<MealCategories>? mealCategoriesAll;
  final List<MealCategories>? mealCategoriesImmut;
  const SearchAndMenu(
      {this.mealCategories, this.mealCategoriesAll, this.mealCategoriesImmut});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 6,
              child: SearchBar(
                mealCategories: mealCategories,
                mealCategoriesAll: mealCategoriesAll,
                mealCategoriesImmut: mealCategoriesImmut,
              )),
          Expanded(
            child: InkWell(
                onTap: () {
                  context.read(hideMenuNotifier).state =
                      !context.read(hideMenuNotifier).state;
                },
                child: Icon(Icons.dashboard)),
          )
        ],
      ),
    );
  }
}
