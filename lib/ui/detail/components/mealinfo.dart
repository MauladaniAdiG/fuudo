import 'package:app/models/pojo/mealdetails.dart';
import 'package:app/util/textdesign.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MealInfo extends StatelessWidget {
  final MealDetails? mealDetails;
  const MealInfo({this.mealDetails});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Column(
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextDesign(
                      mealDetails?.mealName ?? '',
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextDesign(
                      mealDetails?.category ?? '',
                      fontSize: 16,
                      fontColor: const Color(0xff9e9e9e),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.tags,
                              size: 14,
                              color: const Color(0xff9ac8eb),
                            ),
                            const SizedBox(width: 10),
                            TextDesign(
                              mealDetails?.tags ?? '',
                              fontSize: 14,
                              fontColor: const Color(0xff9e9e9e),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        Row(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.city,
                              size: 14,
                              color: const Color(0xff9ac8eb),
                            ),
                            const SizedBox(width: 10),
                            TextDesign(
                              mealDetails?.area ?? '',
                              fontSize: 14,
                              fontColor: const Color(0xff9e9e9e),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        InkWell(
                          onTap: () async {
                            await canLaunch(mealDetails?.youtubeLink ?? '')
                                ? await launch(mealDetails?.youtubeLink ?? '')
                                : throw 'Could not launch ${mealDetails?.youtubeLink ?? ''}';
                          },
                          child: Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.link,
                                size: 14,
                                color: const Color(0xff9ac8eb),
                              ),
                              const SizedBox(width: 10),
                              TextDesign(
                                'Link',
                                fontSize: 14,
                                fontColor: const Color(0xff9e9e9e),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
