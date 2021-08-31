import 'package:flutter/material.dart';
import 'package:hotelbooking/core/constant/asset_image.dart';
import 'package:hotelbooking/core/constant/colors.dart';
import 'package:hotelbooking/core/constant/constants.dart';
import 'package:hotelbooking/presentation/details/widget/pageview_indicator.dart';
import 'package:hotelbooking/widgets/button/button_widget.dart';
import 'package:hotelbooking/widgets/text/header_widget.dart';
import 'package:hotelbooking/widgets/text/normal_widget.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({Key? key}) : super(key: key);

  @override
  _DetailsViewState createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      width: width,
      height: height,
      child: Stack(
        children: [
          Positioned(
              child: Container(
            color: Colors.red,
            height: height * .5,
            width: width,
            child: ImageSliderWithIndicator(),
          )),
          Positioned(
              bottom: 0,
              child: Container(
                  width: width,
                  height: height * .58,
                  padding: EdgeInsets.only(
                    left: Constants.defaultPadding * 2,
                    right: Constants.defaultPadding * 2,
                    top: Constants.defaultPadding * 2,
                    bottom: Constants.defaultPadding / 4,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Constants.defaultRadus),
                          topRight: Radius.circular(Constants.defaultRadus))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HeaderText('Jol Toronoto'),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: AppColors.yellow,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: AppColors.yellow,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: AppColors.yellow,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: AppColors.yellow,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: AppColors.yellow,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: width * .03,
                                ),
                                HeaderText('5.5', fontSize: width * .06),
                                NormalText(
                                  ' (53K + reviews)',
                                  fontSize: width * .04,
                                  color: AppColors.purple,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * .02,
                            ),
                            HeaderText('Address', fontSize: width * .06),
                            NormalText(
                              'Laboni Beach,Cox\'s Bazar',
                              color: AppColors.addressColor,
                            ),
                            NormalText(
                              '+977-981425348',
                              color: AppColors.addressColor,
                            ),
                            SizedBox(
                              height: height * .02,
                            ),
                            HeaderText('Facilities', fontSize: width * .06),
                            SizedBox(
                              height: height * .002,
                            ),
                            Row(
                              children: [
                                AvailableWidget(
                                  icons: Icons.wifi,
                                ),
                                AvailableWidget(
                                  icons: Icons.fitness_center,
                                ),
                                AvailableWidget(icons: Icons.desktop_windows),
                                AvailableWidget(
                                  icons: Icons.local_cafe_outlined,
                                ),
                                AvailableWidget(
                                  icons: Icons.cloud_outlined,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * .019,
                            ),
                            HeaderText('Description', fontSize: width * .06),
                            NormalText(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                              color: AppColors.addressColor,
                            ),
                          ],
                        ),
                      )),
                      Container(
                        padding: EdgeInsets.only(top: Constants.defaultPadding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  NormalText(
                                    'Start From',
                                    color: AppColors.addressColor,
                                  ),
                                  HeaderText(
                                    '\$.4500',
                                    textColor: AppColors.purple,
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: CustomRoundButton(
                                label: 'Rental Now',
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (_) {
                                        return AlertDialog(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal:
                                                  Constants.defaultPadding,
                                              vertical:
                                                  Constants.defaultPadding * 2),
                                          content: Container(
                                            height: height * .24,
                                            width: width,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                borderRadius: BorderRadius
                                                    .circular(Constants
                                                            .defaultPadding *
                                                        3)),
                                            child: Column(
                                              children: [
                                                NormalText(
                                                  'Total Payment',
                                                  fontSize: width * .06,
                                                  isBold: true,
                                                ),
                                                HeaderText(
                                                  '\$.55.00/-',
                                                  textColor: AppColors.purple,
                                                ),
                                                Row(
                                                  children: [
                                                    Checkbox(
                                                        value: false,
                                                        onChanged: (value) {}),
                                                    Expanded(
                                                      child: NormalText(
                                                        'I agree terms and conditions',
                                                        color: AppColors
                                                            .addressColor,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                CustomRoundButton(
                                                  radius:
                                                      Constants.defaultRadus /
                                                          2,
                                                  label: 'Pay',
                                                  onPressed: () {},
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                },
                                backgroundColor: AppColors.primaryCOLOR,
                                radius: Constants.defaultRadus / 2,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ))),
        ],
      ),
    ));
  }
}

class AvailableWidget extends StatelessWidget {
  const AvailableWidget({
    Key? key,
    required this.icons,
  }) : super(key: key);
  final IconData icons;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Constants.defaultPadding * 1.2),
      margin: EdgeInsets.all(Constants.defaultPadding / 2),
      decoration: BoxDecoration(
          color: AppColors.purple,
          borderRadius: BorderRadius.circular(Constants.defaultRadus / 2)),
      child: Icon(
        icons,
        color: AppColors.WHITE,
      ),
    );
  }
}

class ImageSliderWithIndicator extends StatefulWidget {
  const ImageSliderWithIndicator({
    Key? key,
  }) : super(key: key);

  @override
  _ImageSliderWithIndicatorState createState() =>
      _ImageSliderWithIndicatorState();
}

class _ImageSliderWithIndicatorState extends State<ImageSliderWithIndicator> {
  final PageController controller = PageController(initialPage: 0);
  List<String> imgPageView = [
    AppImage.img1,
    AppImage.img1,
    AppImage.img1,
    AppImage.img1,
    AppImage.img1,
  ];
  int pageIndex = 0;

  void _pageChanged(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          color: Colors.grey,
          child: PageView.builder(
            onPageChanged: _pageChanged,
            controller: controller,
            itemCount: imgPageView.length,
            itemBuilder: (context, index) {
              return Image.asset(
                AppImage.img1,
                fit: BoxFit.fitWidth,
              );
            },
          ),
        ),
        Positioned(
          top: 0,
          child: Container(
            width: width,
            height: height * .4,
            padding: const EdgeInsets.symmetric(
                horizontal: Constants.defaultmargin * 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * .1,
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: width * .16,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(
                                  Constants.defaultPadding)),
                          padding:
                              EdgeInsets.all(Constants.defaultPadding / 10),
                          child: BackButton(
                            color: AppColors.WHITE,
                          ),
                        ),
                      ),
                      Spacer(),
                      NormalText(
                        '${pageIndex + 1}/${imgPageView.length.toString()}',
                        color: AppColors.WHITE,
                        isBold: true,
                      )
                    ],
                  ),
                ),
                Indicator(
                  controller: controller,
                  itemCount: imgPageView.length,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
