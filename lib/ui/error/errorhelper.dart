import 'package:app/bloc/providers.dart';
import 'package:app/util/sizer.dart';
import 'package:app/util/textdesign.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ErrorHelper extends StatelessWidget {
  final bool? isDetail;
  const ErrorHelper({this.isDetail = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: isDetail! ? sHeight(context) : sHeight(context) * 0.6,
      width: sWidth(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: FaIcon(
              FontAwesomeIcons.ban,
              size: sHeight(context) * 0.06,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            child: TextDesign(
              isDetail!
                  ? "Hey, so sorry Fuudo got a problem,\ncheck your connection"
                  : "Hey, something wrong check your connection\nlet's connected again",
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
              width: sWidth(context) / 2,
              child: ElevatedButton(
                  onPressed: () {
                    if (isDetail!) {
                      context.read(detailMealNotifier.notifier).backToInit();
                    } else {
                      context.read(bottomMenuNotifier).state = 'beef';
                      context
                          .read(mealCategoriesNotifier.notifier)
                          .toTheInit('');
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xff9ac8eb)),
                      elevation: MaterialStateProperty.all(0),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)))),
                  child: TextDesign(
                    'Connect',
                    fontColor: const Color(0xffffffff),
                  )))
        ],
      ),
    );
  }
}
