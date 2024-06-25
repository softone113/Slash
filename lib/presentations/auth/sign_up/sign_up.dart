import 'package:flutter/material.dart';
import 'package:sign_in_button/sign_in_button.dart';
import '../../../routes/route_name.dart';
import '../../../utils/color.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final mq=MediaQuery.of(context).size;
    final width=mq.width;
    final height=mq.height;

    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          body: Container(
            width: width,
            height: height,
            child: Center(
              child:SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      heightFactor: height * .0009,
                      alignment: Alignment.topLeft,
                      child: Transform.translate(
                        offset: const Offset(-60, -90),
                        child: Transform.rotate(
                          angle: 1.3,
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
                          Text(
                            "Create Account",
                            style: TextStyle(fontSize: width * .04),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Name",
                              suffixIcon: Icon(Icons.person_outline),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                            ),
                          ),
                          SizedBox(
                            height: 10,
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
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Contact",
                              suffixIcon: Icon(Icons.call_outlined),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: _passwordController,
                            obscureText: !_isPasswordVisible,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Password",
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            controller: _confirmPasswordController,
                            obscureText: !_isConfirmPasswordVisible,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Confirm password",
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isConfirmPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                                  });
                                },
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
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
                                "Sign up",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: ColorResource.whiteColor,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: width,
                            height: 40,
                            margin: EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: ColorResource.outlineBtnColor,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 15),
                              child: FittedBox(
                                child: SignInButton(
                                  elevation: 0,
                                  Buttons.google,
                                  text: "Sign in with Google",
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, RouteName.login);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Sign in",
                                    style: TextStyle(
                                      color: ColorResource.lightBlack,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * .1,
                                    height: 3,
                                    child: Divider(
                                      color: ColorResource.textInputBorderColor,
                                      thickness: 1.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      heightFactor: height * .0002,
                      alignment: Alignment.topRight,
                      child: Transform.translate(
                        offset: const Offset(25, -30),
                        child: Transform.rotate(
                          angle: 3.2,
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
                    SizedBox(height: 20,),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        "assets/images/bottomblacklogo.png",
                        width: 50,
                      ),
                    ),
                    SizedBox(height: 10)
                  ],
                ),
              )
            ),
          ),
        ),
      ),
    );
  }
}
