import 'package:flutter/material.dart';
import 'package:hotelbooking/core/constant/asset_image.dart';
import 'package:hotelbooking/core/constant/colors.dart';
import 'package:hotelbooking/core/constant/constants.dart';
import 'package:hotelbooking/widgets/text/normal_widget.dart';

///Its the top header of the widget of any pages.
class TopHeaderWidget extends StatelessWidget {
  const TopHeaderWidget({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: Constants.defaultPadding,
          vertical: Constants.defaultPadding / 1.2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  AppImage.profile,
                  height: height * .06,
                  fit: BoxFit.fitWidth,
                ),
              ),
              SizedBox(width: width * .02),
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      NormalText(
                        'My Location',
                        color: AppColors.GREY,
                      ),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                  NormalText(
                    'Cox\'s Bazar,BD',
                    isBold: true,
                  )
                ],
              ),
            ],
          ),
          Row(
            children: [
              Container(
                  child: Stack(
                children: [
                  Icon(Icons.notifications_outlined),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: width * .022,
                      backgroundColor: AppColors.RED,
                      child: NormalText(
                        '1',
                        color: AppColors.WHITE,
                        fontSize: width * .020,
                      ),
                    ),
                  )
                ],
              )),
              SizedBox(width: width * .03),
              Image.asset(
                AppImage.menuicon,
                width: width * .07,
                fit: BoxFit.fitWidth,
              ),
            ],
          )
        ],
      ),
    );
  }
}
