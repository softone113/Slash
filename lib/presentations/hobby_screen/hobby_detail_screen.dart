import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:hexagon/hexagon.dart';
import '../../utils/color.dart';

class HobbyDetail extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String price;
  final String description;

  const HobbyDetail({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.description,
  }) : super(key: key);

  @override
  State<HobbyDetail> createState() => _HobbyDetailState();
}

class _HobbyDetailState extends State<HobbyDetail> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final imageUrls = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSy1di9-3t28C8o_5sH6oY-MYtpAkeH7JSF0w&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVo1oEN15vw683PGBB8eMU4Wg2j3TgPE4P8A&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUXrVERst6vfJgAefil9QpEdENTHnvpXyylw&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLZsLsdhbVwU-R8E_mErRhi_MhaBRObbwgyw&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgDxPuKV56ebnEGwt8UZA3qihPAn2Isl_egA&s'
  ];

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
                          width: width * .58,
                          height: 200,
                          child: Stack(
                            children: [
                              Align(
                                heightFactor: height * .001,
                                alignment: Alignment.topLeft,
                                child: Transform.translate(
                                  offset: const Offset(-45, -30),
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
                                    HexagonWidget.flat(
                                      width: 90,
                                      color: ColorResource.lightBlack,
                                      child: HexagonWidget.flat(
                                        width: 80,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.network(
                                            widget.imageUrl,
                                            fit: BoxFit.cover,
                                          ),
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
                          width: width * .37,
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
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: 15, right: 15, top: 20, bottom: 5),
                            child: Container(
                              width: width,
                              decoration: BoxDecoration(
                                color: ColorResource.lightBlack,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 15),
                                  Text(
                                    "SKILL LEVEL: ${widget.title}",
                                    maxLines: 2,
                                    style: TextStyle(
                                      color: ColorResource.whiteColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    widget.description,
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: ColorResource.whiteColor,
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorResource.orangeColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 20),
                            child: Container(
                              width: width,
                              decoration: BoxDecoration(
                                color: ColorResource.lightBlack,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 15),
                                  Text(
                                    "SKILL LEVEL: ${widget.title}",
                                    maxLines: 2,
                                    style: TextStyle(
                                      color: ColorResource.whiteColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    widget.description,
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: ColorResource.whiteColor,
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorResource.orangeColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          height: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                10),
                          ),
                          child: Swiper(
                            autoplay: true,
                            itemCount: imageUrls.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  imageUrls[index],
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
                            pagination: SwiperPagination(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: width * .43,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 50),
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
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            )),
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
