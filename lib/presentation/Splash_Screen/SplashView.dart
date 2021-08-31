import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hotelbooking/core/Size/app_size.dart';
import 'package:hotelbooking/core/constant/constants.dart';
import 'package:hotelbooking/routes/routers.dart';
import 'package:hotelbooking/widgets/text/header_widget.dart';
import 'package:hotelbooking/widgets/text/normal_widget.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  loadPage() {
    var _duration = Duration(seconds: 3);
    Timer(_duration, naviation);
  }

  void naviation() {
    Navigator.of(context).pushNamed(
      RouteGenerator.home,
    );
  }

  @override
  void initState() {
    loadPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: LayoutBuilder(
      builder: (builder, constraints) {
        // var hasDetailpage = constraints.maxWidth > 600;
        return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: Constants.defaultRadus * 2,
                child: NormalText('Logo Here'),
              ),
              HeaderText('Design By Subash khatri..'),
              CircularProgressIndicator(),
            ],
          ),
        );
      },
    )));
  }
}
