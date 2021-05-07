import 'package:app/ui/home/components/mealsinfo.dart';
import 'package:app/util/textdesign.dart';
import 'package:flutter/material.dart';

class Katalog extends StatefulWidget {
  @override
  _KatalogState createState() => _KatalogState();
}

class _KatalogState extends State<Katalog> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              focusColor: Colors.transparent,
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Container(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextDesign(
                      "Find\nyou're food did u like",
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    MealsInfo()
                  ],
                ),
              ),
            ),
          ]),
        )
      ],
    );
  }
}
