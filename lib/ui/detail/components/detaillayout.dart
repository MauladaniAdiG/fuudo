import 'package:app/bloc/notifiers/detailnotifier.dart';
import 'package:app/bloc/providers.dart';
import 'package:app/ui/detail/components/detailinfo.dart';
import 'package:app/ui/detail/components/headdetail.dart';
import 'package:app/ui/error/errorhelper.dart';
import 'package:app/util/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailLayout extends StatefulWidget {
  final String id;
  const DetailLayout({required this.id});
  @override
  _DetailLayoutState createState() => _DetailLayoutState();
}

class _DetailLayoutState extends State<DetailLayout> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: Consumer(
      builder: (context, watch, _) {
        final state = watch(detailMealNotifier);
        if (state is DetailInit) {
          Future.delayed(Duration(seconds: 1), () {
            context.read(detailMealNotifier.notifier).detailMeals(widget.id);
          });
          return Container();
        } else if (state is DetailLoading) {
          return Container(
              height: sHeight(context),
              child: Center(child: CircularProgressIndicator()));
        } else if (state is DetailLoadEvent) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeadDetail(
                mealDetails: state.mealDetails,
              ),
              DetailInfo(
                mealDetails: state.mealDetails,
              )
            ],
          );
        } else if (state is DetailLoadError) {
          return ErrorHelper(
            isDetail: true,
          );
        } else {
          return Container();
        }
      },
    ));
  }
}
