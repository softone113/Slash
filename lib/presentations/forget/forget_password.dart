import 'package:flutter/material.dart';
import '../../routes/route_name.dart';
import '../../utils/color.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    final mq=MediaQuery.of(context).size;
    final width= mq.width;
    final height= mq.height;
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(child: Scaffold(
        body: Container(
          width: width,
          height: height,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    heightFactor:  height * .0012,
                    alignment: Alignment.topLeft,
                    child: Transform.translate(
                      offset: const Offset(-42, -35),
                      child: Opacity(
                        opacity: 0.2,
                        child: Image.asset(
                          "assets/images/blackhexagon.png",
                          width: 200,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: width,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/images/darklogo.png",
                          width: width * .3,
                        ),
                        SizedBox(height: 5,),
                        Text(
                          "Enter your email id to recieve an email to reset your password",
                          style: TextStyle(fontSize: width * .04),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Email",
                            suffixIcon: Icon(Icons.email_outlined),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                          ),
                        ),
                        SizedBox(height: 15),
                        SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, RouteName.login);
                            },
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all<Color>(
                                  ColorResource.orangeColor),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                            ),
                            child: Text(
                              "Send",
                              style: TextStyle(
                                fontSize: 18.0,
                                color: ColorResource.whiteColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 50,),
                  Align(
                    heightFactor: height * .0014,
                    alignment: Alignment.topRight,
                    child: Transform.translate(
                      offset: const Offset(38, -30),
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
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      "assets/images/bottomblacklogo.png",
                      width: 50,
                    ),
                  ),
                  SizedBox(height: 10,)
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
