import 'package:app/bloc/providers.dart';
import 'package:app/ui/home/components/bottombarinfo.dart';
import 'package:app/util/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomBarMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      watch(moreBottomMenuNotifier).state;
      watch(bottomMenuNotifier).state;
      watch(chooseSearchMenuNotifier).state;
      final stateHideMenu = watch(hideMenuNotifier).state;
      return AnimatedContainer(
          duration: Duration(milliseconds: 500),
          color: const Color(0xffe0e0e0),
          width: sWidth(context),
          height: stateHideMenu
              ? sHeight(context) * 0.3
              : (sHeight(context) <= 480
                  ? sHeight(context) * 0.15
                  : sHeight(context) * 0.09),
          child: stateHideMenu
              ? SingleChildScrollView(
                  child: BottomBarInfo(),
                )
              : BottomBarInfo());
    });
  }
}
