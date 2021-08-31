import 'package:flutter/material.dart';

import 'package:hotelbooking/core/constant/Strings.dart';
import 'package:hotelbooking/core/constant/asset_image.dart';
import 'package:hotelbooking/core/constant/colors.dart';
import 'package:hotelbooking/core/constant/constants.dart';
import 'package:hotelbooking/presentation/Home/widget/drop_down_widget.dart';
import 'package:hotelbooking/routes/routers.dart';
import 'package:hotelbooking/widgets/button/button_widget.dart';
import 'package:hotelbooking/widgets/text/header_widget.dart';
import 'package:hotelbooking/widgets/text/normal_widget.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
    required this.width,
    this.isSeaching = false,
  }) : super(key: key);

  final double width;
  final isSeaching;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(
            horizontal: Constants.defaultPadding,
            vertical: Constants.defaultPadding / 1.2),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: Constants.defaultPadding * 2,
                    vertical: Constants.defaultPadding * 1.6),
                color: AppColors.GREY.withOpacity(.3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.search),
                        SizedBox(width: width * .03),
                        NormalText(
                          Strings.search,
                          color: AppColors.GREY,
                        ),
                      ],
                    ),
                    if (isSeaching)
                      CircleAvatar(
                        radius: Constants.defaultRadus / 2,
                        child: Icon(
                          Icons.close,
                          color: AppColors.textColor,
                        ),
                        backgroundColor: AppColors.WHITE,
                      ),
                  ],
                ),
              ),
            ),
            SizedBox(width: width * .03),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext bc) {
                      return Container(
                        height: MediaQuery.of(context).size.height * .5,
                        color: Colors.transparent,
                        margin: EdgeInsets.only(top: Constants.defaultmargin),
                        child: SearchBottomSheet(),
                      );
                    });
              },
              child: Image.asset(
                AppImage.filter,
                width: width * .07,
                fit: BoxFit.fitWidth,
              ),
            ),
            // Icon(Icons.sort),
          ],
        ));
  }
}

class SearchBottomSheet extends StatelessWidget {
  const SearchBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    List<String> ids = ['Street 34', 'Street 28', 'Street 34', 'Street 89'];
    String id = 'Yogyakarta, ID';
    List<String> houseType = ['Big', 'Medium', 'Small', 'Apartment'];
    String house = 'Type of House';

    return Container(
      padding: EdgeInsets.only(
        left: Constants.defaultPadding * 2,
        right: Constants.defaultPadding * 2,
        top: Constants.defaultPadding,
        bottom: Constants.defaultPadding * 2,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Constants.defaultRadus),
              topRight: Radius.circular(Constants.defaultRadus))),
      child: SingleChildScrollView(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Container(
                width: Constants.defaultmargin * 4,
                height: 3,
                color: AppColors.GREY,
              ),
            ),
            SizedBox(height: Constants.defaultmargin + 5),
            HeaderText('Search Your Location', fontSize: height * .022),
            SizedBox(height: height * .01),
            Container(
              width: width,
              height: height * .06,
              padding:
                  EdgeInsets.symmetric(horizontal: Constants.defaultPadding),
              decoration: BoxDecoration(
                  color: AppColors.GREY.withOpacity(.2),
                  borderRadius: BorderRadius.all(
                    Radius.circular(Constants.defaultRadus / 2),
                  )),
              child: Row(
                children: [
                  Icon(Icons.location_on_outlined),
                  Expanded(
                      child: DropDown(
                    data: ids,
                    hintText: id,
                  )),
                ],
              ),
            ),
            SizedBox(height: height * .03),
            HeaderText('Type of House', fontSize: height * .022),
            SizedBox(height: height * .01),
            Container(
              width: width,
              height: height * .06,
              padding:
                  EdgeInsets.symmetric(horizontal: Constants.defaultPadding),
              decoration: BoxDecoration(
                  color: AppColors.GREY.withOpacity(.2),
                  borderRadius: BorderRadius.all(
                    Radius.circular(Constants.defaultRadus / 2),
                  )),
              child: Row(
                children: [
                  Icon(Icons.home_outlined),
                  Expanded(
                      child: DropDown(
                    data: houseType,
                    hintText: house,
                  )),
                ],
              ),
            ),
            SizedBox(height: height * .03),
            HeaderText('Filter My Price', fontSize: height * .022),
            RangeSliding(),
            CustomRoundButton(
              label: 'Conform',
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(
                  RouteGenerator.map,
                );
              },
              radius: Constants.defaultRadus / 2,
              backgroundColor: AppColors.primaryCOLOR,
            )
          ],
        ),
      ),
    );
  }
}

class RangeSliding extends StatefulWidget {
  const RangeSliding({
    Key? key,
  }) : super(key: key);

  @override
  _RangeSlidingState createState() => _RangeSlidingState();
}

class _RangeSlidingState extends State<RangeSliding> {
  RangeLabels labels = RangeLabels('500', "15000");
  RangeValues values = RangeValues(500, 15000);

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
        divisions: 50,
        activeColor: AppColors.purple,
        inactiveColor: AppColors.GREY.withOpacity(.3),
        min: 500,
        max: 15000,
        values: values,
        labels: labels,
        onChanged: (value) {
          setState(() {
            values = value;
            labels = RangeLabels("${value.start.toInt().toString()}\$",
                "${value.end.toInt().toString()}\$");
          });
        });
  }
}
