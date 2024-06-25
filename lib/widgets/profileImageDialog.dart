import 'package:flutter/material.dart';
import 'package:slashtribe1/utils/color.dart';

class ProfileImageDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    final width = mq.width;
    final backgroundColor =ColorResource.lightBlack.withOpacity(0.7);
    return AlertDialog(
      backgroundColor: backgroundColor,
      insetPadding: EdgeInsets.symmetric(horizontal: 2),
      contentPadding: EdgeInsets.zero,
      content: SingleChildScrollView(
        child: SizedBox(
          width: width*.8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 30,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: ColorResource.orangeColor,
                ),
                child: FittedBox(
                  child: Text(
                    'Choose Photos',
                    style: TextStyle(color: ColorResource.whiteColor),
                  ),
                ),
                width: width * .45,
                height: 30,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: width * .32,
                    child: Column(
                      children: [
                        Icon(
                          Icons.camera_alt_rounded,
                          size: width * .15,
                          color: ColorResource.whiteColor,
                        ),
                        FittedBox(
                          child: Text(
                            "Take photos",
                            style: TextStyle(
                                color: ColorResource.whiteColor, fontSize: 14),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: width * .32,
                    child: Column(
                      children: [
                        Icon(
                          Icons.image_rounded,
                          size: width * .15,
                          color: ColorResource.whiteColor,
                        ),
                        FittedBox(
                          child: Text(
                            "Choose from \n Gallery",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: ColorResource.whiteColor, fontSize: 14),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 80,)
            ],
          ),
        ),
      ),
    );
  }
}
