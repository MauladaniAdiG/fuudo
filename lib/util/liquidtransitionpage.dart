import 'package:app/ui/home/homepage.dart';
import 'package:app/ui/profile/profilepage.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class LiquidTransitionPage extends StatefulWidget {
  @override
  _LiquidTransitionPageState createState() => _LiquidTransitionPageState();
}

class _LiquidTransitionPageState extends State<LiquidTransitionPage> {
  @override
  Widget build(BuildContext context) {
    return LiquidSwipe(
      pages: [HomePage(), ProfilePage()],
      enableLoop: true,
      slideIconWidget: Icon(Icons.chevron_left),
      waveType: WaveType.liquidReveal,
      positionSlideIcon: 0.5,
      fullTransitionValue: 300,
    );
  }
}
