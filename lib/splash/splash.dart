import 'package:flutter/material.dart';
import 'package:web_devop/splash/loader1.dart';
import 'package:web_devop/splash/loader2.dart';
import 'package:web_devop/splash/loader3.dart';
import 'package:web_devop/splash/loader4.dart';

const int awesomeLoader1 = 1;
const int awesomeLoader2 = 2;
const int awesomeLoader3 = 3;
const int awesomeLoader4 = 4;

class AwesomeLoader extends StatelessWidget {
  const AwesomeLoader({super.key, this.loaderType, this.color});

  final int? loaderType;
  final Color? color;

  int? _getAnimationLoaderType() => loaderType ?? awesomeLoader1;

  Color? _getColor(BuildContext context) =>
      color ?? Theme.of(context).colorScheme.primary;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 50,
        height: 50,
        child: _getLoader(context),
      );

  Widget _getLoader(BuildContext context) {
    switch (_getAnimationLoaderType()) {
      case awesomeLoader1:
        return Loader1(
          color: _getColor(context),
        );

      case awesomeLoader2:
        return Loader2(
          color: _getColor(context),
        );

      case awesomeLoader3:
        return Loader3(
          color: _getColor(context),
        );

      case awesomeLoader4:
        return Loader4(
          color: _getColor(context),
        );

      default:
        return Loader1(
          color: _getColor(context),
        );
    }
  }
}
