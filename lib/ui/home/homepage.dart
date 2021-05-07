import 'package:app/ui/home/components/katalog.dart';
import 'package:app/ui/home/components/bottombarmenu.dart';
import 'package:app/util/responsivebase.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      bottomNavigationBar: BottomBarMenu(),
      appBar: PreferredSize(
          child: AppBar(
            backgroundColor: const Color(0xffffffff),
          ),
          preferredSize: Size.fromHeight(0)),
      body: ResponsiveBase(
        mobile: Katalog(),
        tablet: Katalog(),
      ),
    );
  }
}
