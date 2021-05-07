import 'package:app/ui/profile/components/aboutapps.dart';
import 'package:app/ui/profile/components/aboutme.dart';
import 'package:flutter/material.dart';

class ProfileLayout extends StatefulWidget {
  @override
  _ProfileLayoutState createState() => _ProfileLayoutState();
}

class _ProfileLayoutState extends State<ProfileLayout> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      children: [
        AboutMe(),
        AboutApps(),
      ],
    );
  }
}
