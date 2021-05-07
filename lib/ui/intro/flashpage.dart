import 'package:app/ui/intro/components/logo.dart';
import 'package:app/util/liquidtransitionpage.dart';
import 'package:app/util/navigator.dart';
import 'package:app/util/responsivebase.dart';
import 'package:flutter/material.dart';

class FlashPage extends StatefulWidget {
  @override
  _FlashPageState createState() => _FlashPageState();
}

class _FlashPageState extends State<FlashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3),
        () => pushRemoveNav(context, LiquidTransitionPage(), true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        appBar: PreferredSize(
            child: AppBar(backgroundColor: const Color(0xffffffff)),
            preferredSize: Size.fromHeight(0)),
        body: ResponsiveBase(
          mobile: Logo(),
          tablet: Logo(),
        ));
  }
}
