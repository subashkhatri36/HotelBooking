import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotelbooking/core/constant/Strings.dart';
import 'package:hotelbooking/core/constant/themes.dart';
import 'package:hotelbooking/routes/routers.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appName,
      theme: Themes.light,
      initialRoute: RouteGenerator.initial,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
