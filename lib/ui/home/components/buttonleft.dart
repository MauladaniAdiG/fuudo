import 'package:app/bloc/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonLeft extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: context.read(moreBottomMenuNotifier).state > 0 ? true : false,
      child: Expanded(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    if (context.read(moreBottomMenuNotifier).state > 0) {
                      context.read(moreBottomMenuNotifier).state -= 1;
                    }
                  },
                  icon: FaIcon(FontAwesomeIcons.arrowLeft)),
            ],
          ),
        ),
      ),
    );
  }
}
