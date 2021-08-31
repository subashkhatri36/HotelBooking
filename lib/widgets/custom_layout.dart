import 'package:flutter/material.dart';
import 'package:hotelbooking/core/constant/constants.dart';

class ContainerWIthMargin extends StatelessWidget {
  const ContainerWIthMargin({
    Key? key,
    this.width,
    this.height,
    required this.child,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: Constants.defaultPadding,
          vertical: Constants.defaultPadding / 1.2),
      width: width,
      height: height,
      child: child,
    );
  }
}
