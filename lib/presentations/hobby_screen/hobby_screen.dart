import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hexagon/hexagon.dart';
import 'package:shimmer/shimmer.dart';
import 'package:slashtribe1/presentations/hobby_screen/hobby_detail_screen.dart';
import '../../utils/color.dart';
import '../../widgets/profileImageDialog.dart';
import '../../widgets/shape.dart';

class HobbyScreen extends StatefulWidget {
  const HobbyScreen({Key? key}) : super(key: key);

  @override
  State<HobbyScreen> createState() => _HobbyScreenState();
}

class _HobbyScreenState extends State<HobbyScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late Future<List<dynamic>> _productsFuture;
  Dio _dio = Dio();

  @override
  void initState() {
    super.initState();
    _productsFuture = fetchProducts();
  }

  Future<List<dynamic>> fetchProducts() async {
    try {
      Response response = await _dio.get('https://fakestoreapi.com/products');
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server');
    }
  }

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
                                  _scaffoldKey.currentState!.openEndDrawer();
                                },
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 5),
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
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
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
                                              color: ColorResource.whiteColor,
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.elliptical(50, 0),
                                                  bottomRight:
                                                      Radius.elliptical(50, 0),
                                                  topRight:
                                                      Radius.elliptical(50, 0),
                                                  topLeft: Radius.elliptical(
                                                      60, 10))),
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 4),
                                            height: 55,
                                            width: 5,
                                            decoration: BoxDecoration(
                                                color:
                                                    ColorResource.orangeColor,
                                                borderRadius: BorderRadius.only(
                                                    bottomRight:
                                                        Radius.elliptical(
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
                                        // Navigator.pushNamed(context, RouteName.hobby);
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
                                                color: ColorResource.lightBlack,
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
                  Center(
                    child: FutureBuilder<List<dynamic>>(
                      future: _productsFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: HexagonOffsetGrid.evenFlat(
                                  padding: const EdgeInsets.all(8.0),
                                  columns: 5,
                                  rows: 4,
                                  buildTile: (col, row) => HexagonWidgetBuilder(
                                    color: row.isEven
                                        ? ColorResource.orangeColor
                                        : Colors.grey[400]!,
                                    elevation: 2.0,
                                    padding: 2.0,
                                  ), buildChild: (col, row) => Container(),
                              ),
                          );
                        } else if (snapshot.hasData) {
                          int itemCount = snapshot.data!.length;
                          int columns = 5;
                          int rows = (itemCount / columns).ceil();
                          return SingleChildScrollView(
                            child: Column(
                              children: [
                                HexagonOffsetGrid.evenFlat(
                                  padding: const EdgeInsets.all(8.0),
                                  columns: columns,
                                  rows: rows,
                                  buildTile: (col, row) => HexagonWidgetBuilder(
                                    color: row.isEven
                                        ? ColorResource.orangeColor
                                        : ColorResource.lightBlack,
                                    elevation: 2.0,
                                    padding: 2.0,
                                  ),
                                  buildChild: (col, row) {
                                    int index = row * columns + col;
                                    if (index < itemCount) {
                                      return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) => HobbyDetail(
                                                      imageUrl:
                                                          snapshot.data![index]
                                                              ['image'],
                                                      title:
                                                          snapshot.data![index]
                                                              ['title'],
                                                      price: snapshot
                                                          .data![index]['price']
                                                          .toString(),
                                                      description: snapshot
                                                              .data![index]
                                                          ['description'])));

                                          // Navigator.pushNamed(
                                          //   context,
                                          //   RouteName.hobbyDetail,
                                          //   arguments: {
                                          //     'imageUrl': snapshot.data![index]
                                          //         ['image'],
                                          //     'title': snapshot.data![index]
                                          //         ['title'],
                                          //     'price': snapshot.data![index]
                                          //             ['price']
                                          //         .toString(),
                                          //     'description': snapshot
                                          //         .data![index]['description'],
                                          //   },
                                          // );
                                        },
                                        child: HexagonWidget.flat(
                                          height: 73,
                                          color: ColorResource.whiteColor,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.network(
                                              snapshot.data![index]['image'],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      );
                                    } else {
                                      return Container();
                                    }
                                  },
                                ),
                              ],
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }
                        return Container();
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: width * .43,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 40),
                        width: width * .1,
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(
                          "assets/images/bottomblacklogo.png",
                          width: 50,
                        ),
                      ),
                      Container(
                        width: width * .45,
                        child: Align(
                          heightFactor: height * .001,
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
                      ),
                    ],
                  ),
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
                      ),
                    ),
                  ),
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
                  // Implement navigation or action for Blog
                  Navigator.pop(context); // Close the drawer
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
                  // Implement navigation or action for Social
                  Navigator.pop(context); // Close the drawer
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
                  // Implement navigation or action for Our Story
                  Navigator.pop(context); // Close the drawer
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
