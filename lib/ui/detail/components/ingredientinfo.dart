import 'package:app/models/pojo/mealdetails.dart';
import 'package:app/util/textdesign.dart';
import 'package:flutter/material.dart';

class IngredientInfo extends StatelessWidget {
  final MealDetails? mealDetails;
  final bool? isMeasure;
  const IngredientInfo({this.mealDetails, this.isMeasure = false});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextDesign(isMeasure! ? 'Measures' : 'Ingredients',
            fontWeight: FontWeight.w600, fontSize: 20),
        const SizedBox(
          height: 10,
        ),
        for (var i = 0;
            i <
                (isMeasure!
                    ? mealDetails!.allMeasure!.length
                    : mealDetails!.allIngredients!.length);
            i++)
          ListTile(
            leading: Icon(
              Icons.label,
              color: const Color(0xff9ac8eb),
            ),
            minVerticalPadding: 0,
            title: TextDesign(
                isMeasure!
                    ? mealDetails!.allMeasure![i].item!
                    : mealDetails!.allIngredients![i].item!,
                fontSize: 14),
          ),
      ],
    );
  }
}
