import 'package:app/models/pojo/mealdetails.dart';
import 'package:app/ui/detail/components/descmealinfo.dart';
import 'package:app/ui/detail/components/ingredientinfo.dart';
import 'package:app/ui/detail/components/mealinfo.dart';
import 'package:flutter/material.dart';

class DetailInfo extends StatefulWidget {
  final MealDetails? mealDetails;
  const DetailInfo({this.mealDetails});
  @override
  _DetailInfoState createState() => _DetailInfoState();
}

class _DetailInfoState extends State<DetailInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MealInfo(
              mealDetails: widget.mealDetails,
            ),
            const SizedBox(
              height: 20,
            ),
            Divider(
              color: const Color(0xffe9e9e9),
              thickness: 4,
            ),
            const SizedBox(
              height: 20,
            ),
            DescMealInfo(
              mealDetails: widget.mealDetails,
            ),
            const SizedBox(
              height: 20,
            ),
            IngredientInfo(
              mealDetails: widget.mealDetails,
            ),
            const SizedBox(
              height: 20,
            ),
            IngredientInfo(
              mealDetails: widget.mealDetails,
              isMeasure: true,
            )
          ],
        ));
  }
}
