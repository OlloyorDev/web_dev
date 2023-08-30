import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web_devop/main.dart';
import 'package:web_devop/splash/splash.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    automaticNavigator();
    super.initState();
  }

  void automaticNavigator() async {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) => const MyHomePage(
          title: 'Web Development',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) =>
      const AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
        ),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Positioned.fill(
                child: Center(
                  child: Text(
                    'nepster',
                  ),
                ),
              ),
              Positioned(
                bottom: 80,
                left: 0,
                right: 0,
                child: Center(
                  child: AwesomeLoader(
                    loaderType: awesomeLoader3,
                  ),
                ),
              )
            ],
          ),
        ),
      );
}
