import 'package:app/bloc/providers.dart';
import 'package:app/util/textdesign.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomMenuIcon extends StatefulWidget {
  final String? image;
  final String? label;
  final bool areaMode;
  final bool nameMode;
  const BottomMenuIcon(
      {this.image, this.label, this.areaMode = false, this.nameMode = false});
  @override
  _BottomMenuIconState createState() => _BottomMenuIconState();
}

class _BottomMenuIconState extends State<BottomMenuIcon> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        return InkWell(
          onTap: widget.nameMode
              ? null
              : () {
                  context.read(bottomMenuNotifier).state =
                      widget.label!.toLowerCase();
                  if (context.read(bottomMenuNotifier).state.isNotEmpty) {
                    if (widget.areaMode) {
                      context
                          .read(mealCategoriesNotifier.notifier)
                          .getListMealByAreas(
                              context.read(bottomMenuNotifier).state);
                    } else {
                      context
                          .read(mealCategoriesNotifier.notifier)
                          .getListMealByCategories(
                              context.read(bottomMenuNotifier).state);
                    }
                  }
                },
          child: Container(
            child: Column(
              mainAxisAlignment: context.read(hideMenuNotifier).state
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: widget.nameMode
                      ? false
                      : context.read(bottomMenuNotifier).state ==
                              widget.label!.toLowerCase()
                          ? false
                          : true,
                  child: SvgPicture.asset(
                    '${widget.image}',
                    width: 25,
                    height: 25,
                    color: context.read(bottomMenuNotifier).state ==
                            widget.label!.toLowerCase()
                        ? const Color(0xff9ac8eb)
                        : const Color(0xff000000),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                TextDesign(
                  '${widget.label}',
                  textOverflow: TextOverflow.ellipsis,
                  fontSize: 12,
                  fontColor: context.read(bottomMenuNotifier).state ==
                          widget.label!.toLowerCase()
                      ? const Color(0xff9ac8eb)
                      : const Color(0xff000000),
                ),
                Visibility(
                  visible: context.read(bottomMenuNotifier).state ==
                          widget.label!.toLowerCase()
                      ? true
                      : false,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                        color: Color(0xff9ac8eb), shape: BoxShape.circle),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
