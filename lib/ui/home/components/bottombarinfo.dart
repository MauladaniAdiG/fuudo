import 'package:app/bloc/providers.dart';
import 'package:app/models/items/bottommenu.dart';
import 'package:app/ui/home/components/bottommenuicon.dart';
import 'package:app/ui/home/components/buttonleft.dart';
import 'package:app/ui/home/components/buttonright.dart';
import 'package:app/ui/home/components/searchhandler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomBarInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchHandler(),
        Row(
          children: [
            ButtonLeft(),
            Expanded(
              flex: 4,
              child: Row(
                  children: context.read(chooseSearchMenuNotifier).state ==
                          'categories'
                      ? BottomMenu.bottomMenuList
                          .map((e) => Expanded(
                                  child: BottomMenuIcon(
                                image: e.image,
                                label: e.label,
                              )))
                          .toList()
                          .getRange(
                              context.read(moreBottomMenuNotifier).state == 0
                                  ? 0
                                  : context
                                              .read(moreBottomMenuNotifier)
                                              .state ==
                                          1
                                      ? 5
                                      : 9,
                              context.read(moreBottomMenuNotifier).state == 0
                                  ? 5
                                  : context
                                              .read(moreBottomMenuNotifier)
                                              .state ==
                                          1
                                      ? 9
                                      : 13)
                          .toList()
                      : context.read(chooseSearchMenuNotifier).state == 'area'
                          ? BottomMenu.areaMenuList
                              .map((e) => Expanded(
                                      child: BottomMenuIcon(
                                    image: e.image,
                                    label: e.label,
                                    areaMode: true,
                                  )))
                              .toList()
                              .getRange(
                                  context.read(moreBottomMenuNotifier).state ==
                                          0
                                      ? 0
                                      : context
                                                  .read(moreBottomMenuNotifier)
                                                  .state ==
                                              1
                                          ? 5
                                          : context
                                                      .read(
                                                          moreBottomMenuNotifier)
                                                      .state ==
                                                  2
                                              ? 10
                                              : context
                                                          .read(
                                                              moreBottomMenuNotifier)
                                                          .state ==
                                                      3
                                                  ? 14
                                                  : context
                                                              .read(
                                                                  moreBottomMenuNotifier)
                                                              .state ==
                                                          4
                                                      ? 18
                                                      : 22,
                                  context.read(moreBottomMenuNotifier).state ==
                                          0
                                      ? 5
                                      : context
                                                  .read(moreBottomMenuNotifier)
                                                  .state ==
                                              1
                                          ? 10
                                          : context
                                                      .read(
                                                          moreBottomMenuNotifier)
                                                      .state ==
                                                  2
                                              ? 14
                                              : context
                                                          .read(
                                                              moreBottomMenuNotifier)
                                                          .state ==
                                                      3
                                                  ? 18
                                                  : context
                                                              .read(
                                                                  moreBottomMenuNotifier)
                                                              .state ==
                                                          4
                                                      ? 22
                                                      : 26)
                              .toList()
                          : [
                              Expanded(
                                  child: BottomMenuIcon(
                                label:
                                    'Hey search by name just activated, use search field on the top',
                                nameMode: true,
                              ))
                            ]),
            ),
            context.read(chooseSearchMenuNotifier).state == 'name'
                ? Container()
                : context.read(chooseSearchMenuNotifier).state == 'categories'
                    ? ButtonRight()
                    : ButtonRight(
                        areaMode: true,
                      )
          ],
        ),
      ],
    );
  }
}
