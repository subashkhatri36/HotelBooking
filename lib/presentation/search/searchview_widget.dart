import 'package:flutter/material.dart';
import 'package:hotelbooking/core/constant/Strings.dart';
import 'package:hotelbooking/core/constant/asset_image.dart';
import 'package:hotelbooking/core/constant/colors.dart';
import 'package:hotelbooking/core/constant/constants.dart';
import 'package:hotelbooking/data/repositories/hotel_repositiories.dart';
import 'package:hotelbooking/presentation/Home/widget/search_widget.dart';
import 'package:hotelbooking/presentation/Home/widget/topheader.dart';
import 'package:hotelbooking/routes/routers.dart';
import 'package:hotelbooking/widgets/custom_layout.dart';
import 'package:hotelbooking/widgets/text/header_widget.dart';
import 'package:hotelbooking/widgets/text/normal_widget.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopHeaderWidget(height: height, width: width),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Constants.defaultPadding,
                vertical: Constants.defaultPadding / 1.2),
            child: HeaderText(
              Strings.search,
              fontSize: height * .03,
            ),
          ),
          SearchWidget(
            width: width,
            isSeaching: true,
          ),
          ContainerWIthMargin(
            child: NormalText(
              'Result For Cox\'s Bazar',
              isBold: true,
            ),
          ),
          Expanded(child: HotelSearchListWidget())
        ],
      )),
    );
  }
}

class HotelSearchListWidget extends StatelessWidget {
  const HotelSearchListWidget({
    Key? key,
    this.isMap = false,
  }) : super(key: key);
  final bool isMap;

  @override
  Widget build(BuildContext context) {
    HotelRepositiories hotel = new HotelImpl();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return ListView(
        shrinkWrap: true,
        children: hotel
            .loadHotel()
            .map((e) => InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      RouteGenerator.details,
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: Constants.defaultPadding,
                        vertical: Constants.defaultPadding / 1.2),
                    height: height * .2,
                    decoration: BoxDecoration(
                      color: isMap ? null : AppColors.GREY.withOpacity(.2),
                      borderRadius:
                          BorderRadius.circular(Constants.defaultRadus / 2),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(
                                Constants.defaultRadus / 2),
                            child: Image.asset(
                              e.image == "" ? AppImage.profilePic : e.image,
                              height: height * .2,
                              width: width * .34,
                              fit: BoxFit.fitHeight,
                            )),
                        SizedBox(
                          width: width * .03,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (isMap) SizedBox(height: height * .005),
                              if (isMap)
                                Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * .03,
                                        vertical: width * .01),
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
                              SizedBox(
                                height: width * .03,
                              ),
                              NormalText(
                                e.name,
                                isBold: true,
                                fontSize: height * .021,
                                maxline: 1,
                              ),
                              SizedBox(
                                height: width * .01,
                              ),
                              NormalText(
                                e.info,
                                color: AppColors.GREY,
                                fontSize: height * .019,
                                maxline: 2,
                              ),
                              SizedBox(
                                height: width * .02,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  IconItems(icons: Icons.bed, number: e.bed),
                                  SizedBox(width: width * .03),
                                  IconItems(
                                      icons: Icons.pool, number: e.swimming),
                                  SizedBox(width: width * .03),
                                  IconItems(
                                      icons: Icons.bathtub_outlined,
                                      number: e.bed)
                                ],
                              ),
                              if (!isMap)
                                SizedBox(
                                  height: width * .02,
                                ),
                              if (!isMap)
                                NormalText(
                                  e.cost,
                                  isBold: true,
                                ),
                              SizedBox(
                                height: width * .04,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ))
            .toList());
  }
}

class IconItems extends StatelessWidget {
  const IconItems({
    Key? key,
    required this.icons,
    required this.number,
  }) : super(key: key);
  final IconData icons;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icons,
          color: AppColors.GREY,
        ),
        NormalText(
          number.toString(),
          isBold: true,
          color: AppColors.GREY,
        ),
      ],
    );
  }
}
