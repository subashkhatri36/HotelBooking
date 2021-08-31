import 'package:flutter/material.dart';
import 'package:hotelbooking/core/constant/Strings.dart';
import 'package:hotelbooking/core/constant/asset_image.dart';
import 'package:hotelbooking/core/constant/colors.dart';
import 'package:hotelbooking/core/constant/constants.dart';
import 'package:hotelbooking/widgets/text/header_widget.dart';
import 'package:hotelbooking/widgets/text/normal_widget.dart';

class OfferImageWidget extends StatelessWidget {
  const OfferImageWidget({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height * .16,
        margin: const EdgeInsets.symmetric(
            horizontal: Constants.defaultPadding,
            vertical: Constants.defaultPadding / 1.2),
        child: Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: SizedBox(
              width: width,
              child: Image.asset(
                AppImage.offerImage,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: Constants.defaultPadding,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NormalText(Strings.offer, color: AppColors.WHITE),
                SizedBox(height: height * .01),
                HeaderText('50% Off', textColor: AppColors.WHITE)
              ],
            ),
          ),
        ]));
  }
}
