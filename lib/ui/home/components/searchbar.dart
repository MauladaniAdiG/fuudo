import 'package:app/bloc/providers.dart';
import 'package:app/models/pojo/mealcategories.dart';
import 'package:app/util/textdesign.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchBar extends StatefulWidget {
  final List<MealCategories>? mealCategories;
  final List<MealCategories>? mealCategoriesAll;
  final List<MealCategories>? mealCategoriesImmut;
  const SearchBar(
      {this.mealCategories, this.mealCategoriesAll, this.mealCategoriesImmut});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _search = TextEditingController();
  final FocusNode _fnSearch = FocusNode();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: _search,
        focusNode: _fnSearch,
        style: MyTextStyle(),
        onFieldSubmitted: (val) {},
        onChanged: (val) => Future.delayed(Duration(seconds: 3), () {
              if (context.read(chooseSearchMenuNotifier).state == 'name') {
                context
                    .read(mealCategoriesNotifier.notifier)
                    .getListMealByName(_search.text.trim());
              } else {
                if (context.read(bottomMenuNotifier).state.isNotEmpty) {
                  context.read(mealCategoriesNotifier.notifier).mealSearch(
                      widget.mealCategories!,
                      widget.mealCategoriesAll!,
                      widget.mealCategoriesImmut!,
                      _search.text.trim());
                }
              }
              context.read(searchNotifier).state = _search.text.trim();
            }),
        decoration: InputDecoration(
            hintText: 'Search Here',
            hintStyle: MyTextStyle(fontSize: 12),
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            filled: true,
            fillColor: Color(0xffe0e0e0),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(style: BorderStyle.none))));
  }
}
