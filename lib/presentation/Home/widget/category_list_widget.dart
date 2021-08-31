import 'package:flutter/material.dart';
import 'package:hotelbooking/core/constant/Strings.dart';
import 'package:hotelbooking/core/constant/asset_image.dart';
import 'package:hotelbooking/core/constant/colors.dart';
import 'package:hotelbooking/core/constant/constants.dart';
import 'package:hotelbooking/data/repositories/category_repositories.dart';
import 'package:hotelbooking/widgets/button/button_widget.dart';
import 'package:hotelbooking/widgets/custom_layout.dart';
import 'package:hotelbooking/widgets/text/header_widget.dart';
import 'package:hotelbooking/widgets/text/normal_widget.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.category,
  }) : super(key: key);

  final double width;
  final double height;
  final CategoryRepositiories category;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContainerWIthMargin(
            child: Container(
          width: width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HeaderText(Strings.category),
              InkWell(
                onTap: () {},
                child: Icon(Icons.more_horiz,
                    size: Constants.defaultFontSize * 2.5),
              ),
            ],
          ),
        )),
        ContainerWIthMargin(
            width: width,
            height: height * .39,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: category
                  .loadCategory()
                  .map((e) => SizedBox(
                        width: width * .7,
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: Constants.defaultPadding / 1.5),
                          child: Card(
                            color: AppColors.WHITE,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: Constants.defaultPadding,
                                vertical: Constants.defaultPadding,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      e.image == ''
                                          ? AppImage.profilePic
                                          : e.image,
                                      width: width * .7,
                                      height: height * .18,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  SizedBox(height: height * .01),
                                  HeaderText(
                                    e.title,
                                    fontSize: width * .05,
                                  ),
                                  NormalText(
                                    e.subtitle,
                                    fontSize: width * .037,
                                    color: AppColors.GREY,
                                  ),
                                  SizedBox(height: height * .01),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomRoundButton(
                                          radius: Constants.defaultRadus / 3,
                                          label: e.cost,
                                          onPressed: () {},
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                Constants.defaultRadus / 2.5),
                                            color: AppColors.purple
                                                .withOpacity(.3)),
                                        padding: EdgeInsets.all(
                                          Constants.defaultPadding / 2,
                                        ),
                                        child: Icon(
                                          Icons.arrow_forward,
                                          color: AppColors.purple,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            )),
      ],
    );
  }
}
