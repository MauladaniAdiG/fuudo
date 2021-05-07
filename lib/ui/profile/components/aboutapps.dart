import 'package:app/util/sizer.dart';
import 'package:app/util/textdesign.dart';
import 'package:flutter/material.dart';

class AboutApps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(200),
                    child: Image.asset(
                      'assets/images/fuudo.png',
                      height: sHeight(context) * 0.2,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: TextDesign(
                      "Fuudo",
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      fontColor: const Color(0xffffffff),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      child: RichText(
                          text: TextSpan(
                              text: "This app will help you to search ",
                              style: MyTextStyle(
                                fontSize: 16,
                                fontColor: const Color(0xffffffff),
                              ),
                              children: [
                        TextSpan(
                            text: 'food ',
                            style: MyTextStyle(
                                fontSize: 16,
                                fontColor: const Color(0xffffffff),
                                fontWeight: FontWeight.w900)),
                        TextSpan(
                            text:
                                'recipes, and how to make that food in different search modes like search by categories, by area, and by global search feature ',
                            style: MyTextStyle(
                              fontSize: 16,
                              fontColor: const Color(0xffffffff),
                            ))
                      ]))),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: TextDesign(
                      "Apps Goals",
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      fontColor: const Color(0xffffffff),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      child: RichText(
                          text: TextSpan(
                              text:
                                  "This application is designed to make it easier for you to ",
                              style: MyTextStyle(
                                fontSize: 16,
                                fontColor: const Color(0xffffffff),
                              ),
                              children: [
                        TextSpan(
                            text:
                                'search for data on foods related to the recipes and ordinances they make',
                            style: MyTextStyle(
                                fontSize: 16,
                                fontColor: const Color(0xffffffff),
                                fontWeight: FontWeight.w900)),
                      ]))),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: TextDesign(
                      "Made It With",
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      fontColor: const Color(0xffffffff),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Image.network(
                            'https://drive.google.com/uc?export=view&id=1qrY5NK7T-irnN1ZeiIANk9U58gvNZyzY',
                            height: sHeight(context) * 0.05,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: TextDesign(
                              "Flutter",
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              fontColor: const Color(0xffffffff),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Image.network(
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Visual_Studio_Code_1.35_icon.svg/1024px-Visual_Studio_Code_1.35_icon.svg.png',
                            height: sHeight(context) * 0.05,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: TextDesign(
                              "VS Code",
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              fontColor: const Color(0xffffffff),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Image.network(
                            'https://static.wikia.nocookie.net/logopedia/images/4/42/MSPaint.png/revision/latest/scale-to-width-down/200?cb=20170914053117',
                            height: sHeight(context) * 0.05,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: TextDesign(
                              "MS Paint",
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              fontColor: const Color(0xffffffff),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
