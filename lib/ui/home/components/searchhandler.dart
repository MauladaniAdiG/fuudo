import 'package:app/bloc/providers.dart';
import 'package:app/models/items/searchby.dart';
import 'package:app/util/textdesign.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchHandler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: context.read(hideMenuNotifier).state ? true : false,
      child: Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: TextDesign(
                'Select Search Mode',
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              child: Consumer(
                builder: (context, watch, child) {
                  watch(chooseSearchMenuNotifier).state;
                  return Row(
                      children: SearchBy.searchByList
                          .map(
                            (e) => InkWell(
                              onTap: () {
                                context.read(chooseSearchMenuNotifier).state =
                                    e.title!.toLowerCase();
                                context.read(moreBottomMenuNotifier).state = 0;
                                context.read(bottomMenuNotifier).state = '';
                                context
                                    .read(mealCategoriesNotifier.notifier)
                                    .toTheInit(e.title!.toLowerCase());
                              },
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            color: const Color(0xff9ac8eb)),
                                        color: context
                                                    .read(
                                                        chooseSearchMenuNotifier)
                                                    .state ==
                                                e.title!.toLowerCase()
                                            ? const Color(0xff9ac8eb)
                                            : const Color(0xffffffff)),
                                    child: TextDesign(e.title!,
                                        fontColor: context
                                                    .read(
                                                        chooseSearchMenuNotifier)
                                                    .state ==
                                                e.title!.toLowerCase()
                                            ? const Color(0xffffffff)
                                            : const Color(0xff000000)),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList());
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Visibility(
              visible: context.read(chooseSearchMenuNotifier).state == 'name'
                  ? false
                  : true,
              child: Container(
                  child: TextDesign(
                'Search by',
                fontSize: 16,
              )),
            ),
          ],
        ),
      ),
    );
  }
}
