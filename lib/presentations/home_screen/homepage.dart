import 'package:flutter/material.dart';
import 'package:hexagon/hexagon.dart';
import 'package:slashtribe1/widgets/profileImageDialog.dart';
import 'package:slashtribe1/widgets/shape.dart';
import '../../routes/route_name.dart';
import '../../utils/color.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    final width = mq.width;
    final height = mq.height;

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: GestureDetector(
          onTap: () {
            if (_scaffoldKey.currentState!.isDrawerOpen) {
              Navigator.pop(context);
            }
          },
          child: Container(
            width: width,
            height: height,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: width * .6,
                        height: 200,
                        child: Stack(
                          children: [
                            Align(
                              heightFactor: height * .001,
                              alignment: Alignment.topLeft,
                              child: Transform.translate(
                                offset: const Offset(-40, -28),
                                child: Transform.rotate(
                                  angle: 0,
                                  child: Opacity(
                                    opacity: 0.2,
                                    child: Image.asset(
                                      "assets/images/blackhexagon.png",
                                      width: 200,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 113,
                              left: 40,
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            ProfileImageDialog(),
                                      );
                                    },
                                    child: HexagonWidget.flat(
                                      width: 100,
                                      child: Image.asset(
                                        'assets/images/profile.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Image.asset(
                                    "assets/images/slasht.png",
                                    height: 75,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: width * .4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: IconButton(
                                icon: Image.asset(
                                  "assets/images/hamburger.png",
                                  width: 40,
                                  fit: BoxFit.contain,
                                ),
                                onPressed: () {
                                  _scaffoldKey.currentState!
                                      .openEndDrawer();
                                },
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: width,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Container(
                                width: width * .8,
                                child: Stack(
                                  children: [
                                    ClipPath(
                                      clipper: Hexagon(),
                                      child: Container(
                                        height: 60,
                                        padding: EdgeInsets.only(
                                            left: 5,
                                            right: 5,
                                            bottom: 6,
                                            top: 5),
                                        color: ColorResource.lightBlack,
                                        child: ClipPath(
                                          clipper: Hexagons(),
                                          child: Container(
                                            color: ColorResource.whiteColor,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: TextField(
                                                    decoration:
                                                    InputDecoration(
                                                      border:
                                                      InputBorder.none,
                                                      hintText: 'Enter text...',
                                                      contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 20),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      bottom: 4.0,
                                                      right: 9),
                                                  child: HexagonWidget.flat(
                                                    width: 60,
                                                    color: ColorResource
                                                        .lightBlack,
                                                    child: HexagonWidget.flat(
                                                      width: 50,
                                                      color: ColorResource
                                                          .whiteColor,
                                                      child: Center(
                                                        child: Icon(Icons.mic,
                                                            size: 30),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      right: 0,
                                      child: Transform.rotate(
                                        angle: 0.5,
                                        child: Container(
                                          margin: EdgeInsets.only(left: 2),
                                          decoration: BoxDecoration(
                                              color: ColorResource
                                                  .whiteColor,
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft: Radius.elliptical(
                                                      50, 0),
                                                  bottomRight:
                                                  Radius.elliptical(
                                                      50, 0),
                                                  topRight: Radius.elliptical(
                                                      50, 0),
                                                  topLeft: Radius.elliptical(
                                                      60, 10))),
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 4),
                                            height: 55,
                                            width: 5,
                                            decoration: BoxDecoration(
                                                color: ColorResource
                                                    .orangeColor,
                                                borderRadius: BorderRadius.only(
                                                    bottomRight: Radius.elliptical(
                                                        20, 10),
                                                    topLeft: Radius.elliptical(
                                                        20, 10))),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                right: 0,
                                child: ClipPath(
                                  clipper: hexagonOuter(),
                                  child: Container(
                                    width: width * .17,
                                    padding: EdgeInsets.only(
                                        left: 7, right: 5, top: 5, bottom: 8),
                                    height: 60,
                                    color: ColorResource.lightBlack,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, RouteName.hobby);
                                      },
                                      child: ClipPath(
                                        clipper: hexagon(),
                                        child: Container(
                                          width: 60,
                                          height: 60,
                                          color: ColorResource.whiteColor,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, top: 10),
                                            child: Text(
                                              "GO",
                                              style: TextStyle(
                                                color:
                                                ColorResource.lightBlack,
                                                fontFamily: 'FontMain',
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      HexagonWidget.pointy(
                        width: width * .2,
                        color: ColorResource.orangeColor,
                        child: Text(
                          "0",
                          style: TextStyle(
                            color: ColorResource.whiteColor,
                            fontSize: 30,
                            fontFamily: 'FontMain',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      HexagonWidget.pointy(
                        width: width * .2,
                        color: ColorResource.orangeColor,
                        child: Text(
                          "5",
                          style: TextStyle(
                            color: ColorResource.whiteColor,
                            fontSize: 30,
                            fontFamily: 'FontMain',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      HexagonWidget.pointy(
                        width: width * .2,
                        color: ColorResource.lightBlack,
                        child: Text(
                          "1",
                          style: TextStyle(
                            color: ColorResource.whiteColor,
                            fontSize: 30,
                            fontFamily: 'FontMain',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      HexagonWidget.pointy(
                        width: width * .2,
                        color: ColorResource.lightBlack,
                        child: Text(
                          "5",
                          style: TextStyle(
                            color: ColorResource.whiteColor,
                            fontSize: 30,
                            fontFamily: 'FontMain',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "DAYS",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'FontMain',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "HOURS",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'FontMain',
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Text(
                        "To Launch..",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'FontMain',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Transform.translate(
                      offset: Offset(35, 0),
                      child: Opacity(
                        opacity: 0.2,
                        child: Image.asset(
                          "assets/images/blackhexagon.png",
                          width: 200,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      "assets/images/bottomblacklogo.png",
                      width: 50,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ),
        ),
        endDrawer: Drawer(
          backgroundColor: ColorResource.lightBlack,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                width: width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.close,
                            size: 30,
                            color: ColorResource.whiteColor,
                          ))),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ListTile(
                title: Text(
                  'Blog',
                  style: TextStyle(
                    color: ColorResource.whiteColor,
                  ),
                ),
                trailing: Icon(
                  Icons.navigate_next,
                  color: ColorResource.whiteColor,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Social',
                    style: TextStyle(
                      color: ColorResource.whiteColor,
                    )),
                trailing: Icon(
                  Icons.navigate_next,
                  color: ColorResource.whiteColor,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Our Story',
                    style: TextStyle(
                      color: ColorResource.whiteColor,
                    )),
                trailing: Icon(
                  Icons.navigate_next,
                  color: ColorResource.whiteColor,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Privacy Policy',
                    style: TextStyle(
                      color: ColorResource.whiteColor,
                    )),
                trailing: Icon(
                  Icons.navigate_next,
                  color: ColorResource.whiteColor,
                ),
                onTap: () {},
              ),
              Divider(color: ColorResource.whiteColor),
              ListTile(
                title: Text('Logout',
                    style: TextStyle(
                      color: ColorResource.whiteColor,
                    )),
                trailing: Icon(
                  Icons.navigate_next,
                  color: ColorResource.whiteColor,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
