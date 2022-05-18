// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:final_project/utils/routers.dart';
import 'package:flutter/material.dart';
//import 'package:wave/config.dart';
//import 'package:wave/wave.dart';
import 'screens/TaskPages/home_page.dart';
import 'provider/Shared_preferences/shared_preferencesProvider.dart';
import 'screens/authentication/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Image(
                image: AssetImage('assets/images/png02.png'),
                fit: BoxFit.cover,
              ),
              Text(
                "Terms And Conditions",
                style: TextStyle(),
              )
            ],
          ),

          // child: Image.asset('assets/images/png02.png',
          // fit: BoxFit.cover,
          // ),

          // child: WaveWidget(
          //   config:CustomConfig(

          //     gradients: [
          //       [Colors.red,Colors.pinkAccent],
          //       [Colors.redAccent,Colors.deepOrange],
          //       [Colors.orange, Colors.yellowAccent],
          //       [Colors.yellowAccent, Colors.pink]
          //     ],

          //     gradientBegin: Alignment.centerRight,
          //     gradientEnd: Alignment.centerLeft,
          //     durations: [3500,19440,10800,6000],
          //     heightPercentages: [0.20,0.23,0.25,0.30]),
          //     size: const Size(double.infinity, double.infinity)),
        ),
      ),
    );
  }

  void navigate() {
    Future.delayed(const Duration(seconds: 10), () {
      SharedDataProvider().getToken().then((value) {
        if (value == '') {
          PageNavigator(ctx: context).nextPageOnly(page: const LoginPage());
        } else {
          PageNavigator(ctx: context).nextPageOnly(page: const HomePage());
        }
      });
      //PageNavigator(ctx: context).nextPageOnly(page: const LoginPage());
    });
  }
}
