import 'package:flutter/material.dart';
import 'package:hotelbooking/core/constant/colors.dart';
import 'package:hotelbooking/data/repositories/category_repositories.dart';
import 'package:hotelbooking/presentation/Home/widget/category_list_widget.dart';
import 'package:hotelbooking/presentation/Home/widget/different_hotel_option.dart';
import 'package:hotelbooking/presentation/Home/widget/offer_image_widget.dart';
import 'package:hotelbooking/presentation/Home/widget/search_widget.dart';
import 'package:hotelbooking/presentation/Home/widget/topheader.dart';
import 'package:hotelbooking/routes/routers.dart';
import 'package:hotelbooking/widgets/custom_layout.dart';
import 'package:hotelbooking/widgets/text/normal_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController tabcontroller;

  @override
  void initState() {
    tabcontroller = new TabController(length: 4, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    CategoryRepositiories category = new CategoryImpl();
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopHeaderWidget(height: height, width: width),

          InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(
                  RouteGenerator.search,
                );
              },
              child: SearchWidget(width: width)),
          OfferImageWidget(width: width, height: height),

          CategoryListWidget(width: width, height: height, category: category),
          TabBar(
              controller: tabcontroller,
              indicatorSize: TabBarIndicatorSize.label,
              isScrollable: true,
              labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: width * .02,
                  color: AppColors.BLACK),
              unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: width * .01,
                  color: AppColors.GREY),
              labelColor: AppColors.textColor,
              tabs: [
                Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: width * .03, vertical: height * .009),
                    child: NormalText('3 Star')),
                Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: width * .03, vertical: height * .009),
                    child: NormalText('5 Star')),
                Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: width * .03, vertical: height * .009),
                    child: NormalText('2 Star')),
                Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: width * .03, vertical: height * .009),
                    child: NormalText('1 Star')),
              ]),
          ContainerWIthMargin(
            height: height * .4,
            width: width,
            child: TabBarView(controller: tabcontroller, children: [
              DIffereHotelOptionsWidget(
                  category: category, width: width, height: height),
              DIffereHotelOptionsWidget(
                  category: category, width: width, height: height),
              DIffereHotelOptionsWidget(
                  category: category, width: width, height: height),
              DIffereHotelOptionsWidget(
                  category: category, width: width, height: height),
            ]),
          ),
          //  DifferentOptionWIdget(height: height, width: width)
        ],
      ),
    )));
  }
}
