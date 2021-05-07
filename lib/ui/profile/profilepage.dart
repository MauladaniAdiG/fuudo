import 'package:app/ui/profile/components/profilelayout.dart';
import 'package:app/util/responsivebase.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff9ac8eb),
        appBar: PreferredSize(
            child: AppBar(
              backgroundColor: const Color(0xffffffff),
            ),
            preferredSize: Size.fromHeight(0)),
        body: ResponsiveBase(tablet: ProfileLayout(), mobile: ProfileLayout()));
  }
}
