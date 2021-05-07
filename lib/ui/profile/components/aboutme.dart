import 'package:app/util/sizer.dart';
import 'package:app/util/textdesign.dart';
import 'package:flutter/material.dart';

class AboutMe extends StatelessWidget {
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
                    child: Image.network(
                        'https://th.bing.com/th/id/OIP._wLjM6VaxMMoR4xfeQLWZAHaHa?pid=ImgDet&rs=1',
                        cacheHeight: 300,
                        height: sHeight(context) * 0.2,
                        cacheWidth: 300),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: TextDesign(
                      'Hello',
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      fontColor: const Color(0xffffffff),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: TextDesign(
                      "Welcome",
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
                              text: "I'm ",
                              style: MyTextStyle(
                                fontSize: 16,
                                fontColor: const Color(0xffffffff),
                              ),
                              children: [
                        TextSpan(
                            text: 'Mauladani Adi Gasbara ',
                            style: MyTextStyle(
                                fontSize: 16,
                                fontColor: const Color(0xffffffff),
                                fontWeight: FontWeight.w900)),
                        TextSpan(
                            text:
                                'as a Flutter developer and also an Android enthusiast, who has want to become a great and chaotic developer in mobile technology',
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
                      "Did u got interested\nabout this app",
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      fontColor: const Color(0xffffffff),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: const Color(0xffffffff),
                    thickness: 3,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
              Positioned(
                bottom: 5,
                left: 0,
                right: 0,
                child: Container(
                  alignment: Alignment.center,
                  child: TextDesign(
                    "swipe down me",
                    fontSize: 12,
                    fontWeight: FontWeight.w900,
                    fontColor: const Color(0xffffffff),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
