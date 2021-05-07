import 'package:app/bloc/providers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ButtonRight extends StatelessWidget {
  final bool areaMode;
  const ButtonRight({this.areaMode = false});
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: areaMode
          ? context.read(moreBottomMenuNotifier).state == 5
              ? false
              : true
          : context.read(moreBottomMenuNotifier).state == 2
              ? false
              : true,
      child: Expanded(
        child: Container(
          child: Column(
            mainAxisAlignment: context.read(hideMenuNotifier).state
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    if (areaMode) {
                      if (context.read(moreBottomMenuNotifier).state >= 0 &&
                          context.read(moreBottomMenuNotifier).state <= 4) {
                        context.read(moreBottomMenuNotifier).state += 1;
                      } else if (context.read(moreBottomMenuNotifier).state ==
                          5) {
                        print('reach max area');
                      }
                      print('${context.read(moreBottomMenuNotifier).state}');
                    } else {
                      if (context.read(moreBottomMenuNotifier).state >= 0 &&
                          context.read(moreBottomMenuNotifier).state <= 1) {
                        context.read(moreBottomMenuNotifier).state += 1;
                      } else if (context.read(moreBottomMenuNotifier).state ==
                          2) {
                        print('reach max categories');
                      }
                      print('${context.read(moreBottomMenuNotifier).state}');
                    }
                  },
                  icon: FaIcon(FontAwesomeIcons.arrowRight)),
            ],
          ),
        ),
      ),
    );
  }
}
