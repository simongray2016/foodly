import 'package:flutter/material.dart';
import 'package:foodly/constants.dart';
import 'package:foodly/size_config.dart';
import 'package:get/get.dart';

import '/screens/sign_in/sign_in_screen.dart';
import '/components/default_button.dart';
import 'splash_content.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "heading": "All your favorites",
      "text":
          "Order from the best local restaurants \nwith easy, on-demand delivery.",
      "image": "assets/images/splash-1.png"
    },
    {
      "heading": "Free delivery offers",
      "text":
          "Free delivery for new customers via Apple \nPay and others payment methods.",
      "image": "assets/images/splash-2.png"
    },
    {
      "heading": "Choose your food",
      "text":
          "Easily find your type of food craving \nand you’ll get delivery in wide range.",
      "image": "assets/images/splash-3.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: PageView.builder(
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  heading: splashData[index]['heading'] ?? '',
                  text: splashData[index]['text'] ?? '',
                  image: splashData[index]["image"] ?? '',
                ),
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: [
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(),
                    DefaultButton(
                      text: "Get Started",
                      press: () {
                        Get.toNamed(SignInScreen.routeName);
                      },
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index = 0}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: kDefaultPadding / 5),
      height: kDefaultPadding / 4,
      width: currentPage == index ? kDefaultPadding : kDefaultPadding / 4,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : kGrayColor,
        borderRadius: BorderRadius.circular(kDefaultPadding / 5),
      ),
    );
  }
}
