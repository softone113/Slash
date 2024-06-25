import 'package:flutter/material.dart';
import '../../routes/route_name.dart';
import '../../utils/color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, RouteName.login);
    });
  }
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    final width = mq.width;
    final height = mq.height;
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorResource.lightBlack,
      body: Container(
        width: width,
        height: height,
        child: Center(
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Transform.translate(
                    offset: const Offset(-80, 0),
                    child: Opacity(
                        opacity: 0.5,
                        child: Image.asset(
                          "assets/images/whitehexagon.png",
                          height: height * .3,
                          width: 200,
                        )),
                  ),
                ),
                SizedBox(height: height * .03),
                Image.asset(
                  "assets/images/logo.png",
                  height: height * .1,
                  width: 200,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: height * .02),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Transform.translate(
                      offset: Offset(-33, 0),
                      child: Transform.rotate(
                          angle: -2.4,
                          child: Opacity(
                            opacity: 0.5,
                            child: Image.asset(
                              "assets/images/whitehexagon.png",
                              height: height * .3,
                              width: 200,
                            ),
                          )),
                    )),
                SizedBox(height: height * .04),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    "assets/images/bottomlogo.png",
                    width: 80,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
