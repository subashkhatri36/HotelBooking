import 'package:flutter/material.dart';
import 'package:hotelbooking/core/constant/asset_image.dart';
import 'package:hotelbooking/core/constant/colors.dart';
import 'package:hotelbooking/core/constant/constants.dart';
import 'package:hotelbooking/data/repositories/category_repositories.dart';
import 'package:hotelbooking/presentation/Home/widget/different_hotel_option.dart';
import 'package:hotelbooking/presentation/search/searchview_widget.dart';
import 'package:hotelbooking/widgets/button/button_widget.dart';
import 'package:hotelbooking/widgets/custom_layout.dart';
import 'package:hotelbooking/widgets/text/normal_widget.dart';

class MapView extends StatelessWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
            child: Container(
      width: width,
      height: height,
      child: Stack(
        children: [
          Image.asset(AppImage.map),
          Positioned(
              top: 0,
              child: Container(
                padding: EdgeInsets.all(Constants.defaultPadding),
                height: height * .45,
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: width * .16,
                      child: CustomRoundButton(
                        radius: Constants.defaultRadus / 2,
                        label: '',
                        onPressed: () {},
                        icon: true,
                        icons: Icons.west,
                      ),
                    ),
                    Spacer(),
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: width * .16,
                            child: CustomRoundButton(
                              radius: Constants.defaultRadus / 2,
                              label: '',
                              onPressed: () {},
                              icon: true,
                              icons: Icons.threesixty,
                            ),
                          ),
                          SizedBox(
                            height: height * .03,
                          ),
                          SizedBox(
                            width: width * .16,
                            child: CustomRoundButton(
                              radius: Constants.defaultRadus / 2,
                              label: '',
                              onPressed: () {},
                              icon: true,
                              img: true,
                              icons: AppImage.path2,
                            ),
                          ),
                          SizedBox(
                            height: height * .03,
                          ),
                          SizedBox(
                            width: width * .16,
                            child: CustomRoundButton(
                              radius: Constants.defaultRadus / 2,
                              label: '',
                              onPressed: () {},
                              icon: true,
                              img: true,
                              icons: AppImage.path1,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
          Positioned(bottom: 0, child: MapDetailBottomSheet()),
        ],
      ),
    )));
  }
}

class MapDetailBottomSheet extends StatefulWidget {
  const MapDetailBottomSheet({Key? key}) : super(key: key);

  @override
  _MapDetailBottomSheetState createState() => _MapDetailBottomSheetState();
}

class _MapDetailBottomSheetState extends State<MapDetailBottomSheet>
    with TickerProviderStateMixin {
  late TabController tabcontroller;
  CategoryRepositiories category = new CategoryImpl();

  @override
  void initState() {
    tabcontroller = new TabController(length: 4, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      height: height * .5,
      padding: EdgeInsets.only(
        left: Constants.defaultPadding / 4,
        right: Constants.defaultPadding / 4,
        top: Constants.defaultPadding,
        bottom: Constants.defaultPadding / 4,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Constants.defaultRadus),
              topRight: Radius.circular(Constants.defaultRadus))),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TabBar(
              controller: tabcontroller,
              indicatorSize: TabBarIndicatorSize.label,
              isScrollable: true,
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelColor: AppColors.GREY,
              labelColor: AppColors.textColor,
              tabs: [
                Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: width * .03, vertical: height * .009),
                    child: NormalText('5 Star')),
                Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: width * .03, vertical: height * .009),
                    child: NormalText('4 Star')),
                Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: width * .03, vertical: height * .009),
                    child: NormalText('3 Star')),
                Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: width * .03, vertical: height * .009),
                    child: NormalText('2 Star')),
              ]),
          ContainerWIthMargin(
            height: height * .4,
            width: width,
            child: TabBarView(controller: tabcontroller, children: [
              HotelSearchListWidget(
                isMap: true,
              ),
              HotelSearchListWidget(
                isMap: true,
              ),
              HotelSearchListWidget(
                isMap: true,
              ),
              HotelSearchListWidget(
                isMap: true,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
