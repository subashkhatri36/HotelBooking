import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotelbooking/presentation/Home/home_screen.dart';
import 'package:hotelbooking/presentation/Maps/maps_view.dart';

import 'package:hotelbooking/presentation/Splash_Screen/SplashView.dart';
import 'package:hotelbooking/presentation/details/details_view.dart';
import 'package:hotelbooking/presentation/error_router.dart';
import 'package:hotelbooking/presentation/search/searchview_widget.dart';

///Use to generate router path throught the applications.
class RouteGenerator {
  static const String initial = '/';
  static const String home = '/home';
  static const String search = '/search';
  static const String details = '/details';
  static const String map = '/map';
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;
    switch (settings.name) {
      case initial:
        return MaterialPageRoute(builder: (context) => SplashView());
      case home:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case search:
        return MaterialPageRoute(builder: (context) => SearchView());
      case details:
        return MaterialPageRoute(builder: (context) => DetailsView());
      case map:
        return MaterialPageRoute(builder: (context) => MapView());
      default:
        return MaterialPageRoute(builder: (context) => ErrorRoute());
    }
  }
}

//Navigator.of(context).pushNamed('/location',arguments:wheatherdata);
//final dynamic weather;
