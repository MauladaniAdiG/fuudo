import 'package:app/util/sizer.dart';
import 'package:app/util/textdesign.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/fuudo.png',
            height: sHeight(context) * 0.3,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 10,
          ),
          TextDesign(
            'Fuudo',
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(
            height: 10,
          ),
          TextDesign('Found ure food with my assistant')
        ],
      ),
    );
  }
}
