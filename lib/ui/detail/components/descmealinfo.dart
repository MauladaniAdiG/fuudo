import 'package:app/bloc/providers.dart';
import 'package:app/models/pojo/mealdetails.dart';
import 'package:app/util/textdesign.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DescMealInfo extends StatelessWidget {
  final MealDetails? mealDetails;
  const DescMealInfo({this.mealDetails});
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final readMore = watch(readMoreDetailNotifier).state;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextDesign(
              'Instructions :',
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 20,
            ),
            AnimatedCrossFade(
              crossFadeState: readMore
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              firstChild: TextDesign(
                mealDetails?.instruction ?? '',
                textOverflow: TextOverflow.ellipsis,
                maxLines: 8,
              ),
              secondChild: TextDesign(
                mealDetails?.instruction ?? '',
                maxLines: null,
              ),
              duration: Duration(milliseconds: 500),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  context.read(readMoreDetailNotifier).state =
                      !context.read(readMoreDetailNotifier).state;
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                      color: readMore
                          ? const Color(0xffffffff)
                          : const Color(0xff9ac8eb),
                      border: Border.all(color: const Color(0xff9ac8eb)),
                      borderRadius: BorderRadius.circular(15)),
                  child: TextDesign(
                    readMore ? 'less' : 'More',
                    fontColor: readMore
                        ? const Color(0xff9ac8eb)
                        : const Color(0xffffffff),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
