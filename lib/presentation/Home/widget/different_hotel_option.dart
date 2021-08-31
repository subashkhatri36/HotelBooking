import 'package:flutter/material.dart';
import 'package:hotelbooking/core/constant/asset_image.dart';
import 'package:hotelbooking/core/constant/colors.dart';
import 'package:hotelbooking/core/constant/constants.dart';
import 'package:hotelbooking/data/repositories/category_repositories.dart';
import 'package:hotelbooking/widgets/button/button_widget.dart';
import 'package:hotelbooking/widgets/text/normal_widget.dart';

class DIffereHotelOptionsWidget extends StatelessWidget {
  const DIffereHotelOptionsWidget({
    Key? key,
    required this.category,
    required this.width,
    required this.height,
  }) : super(key: key);

  final CategoryRepositiories category;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: category
          .loadCategory()
          .map((e) => Container(
              margin: EdgeInsets.symmetric(
                  horizontal: width * .03, vertical: width * .03),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      e.image == '' ? AppImage.profilePic : AppImage.img2,
                      height: height * .17,
                      width: width * .3,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  SizedBox(
                    width: width * .02,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: height * .005),
                        Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: width * .03, vertical: width * .01),
                            decoration: BoxDecoration(
                              color: AppColors.purple,
                              borderRadius: BorderRadius.circular(
                                  Constants.defaultRadus / 3),
                            ),
                            child: NormalText(
                              '60% Off',
                              color: AppColors.WHITE,
                              fontSize: width * .03,
                            )),
                        NormalText(
                          'Luxumbure Hotel Pvt Ltd',
                          isBold: true,
                        ),
                        SizedBox(height: height * .005),
                        NormalText(
                          e.subtitle,
                          maxline: 2,
                          fontSize: width * .036,
                          color: AppColors.GREY,
                        ),
                        SizedBox(height: height * .005),
                        CustomRoundButton(
                            radius: Constants.defaultRadus / 2,
                            label: e.cost,
                            onPressed: () {})
                      ],
                    ),
                  )
                ],
              )))
          .toList(),
    );
  }
}
