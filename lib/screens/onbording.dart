import 'dart:math';

import 'package:coupon/default.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'loginandsignup/login.dart';

class Boarding{
  final String image;
  final String title;
  final String body;
  Boarding({ required this.title,
    required this.image,
    required this.body
  });
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController? pageController;

  double viewportFraction = 0.83;

  double? pageOffset = 0;
int pagNum=1;
  // void submit(){
  //   CacheHelper.setData(key: 'onBoarding', value: true).then((value) {
  //     navigateToAndDelete(context: context, screen: LoginScreen());
  //   }).catchError((error){print("error is ${error}");});
  //
  // }
  bool isLast=false;
  List<Boarding>boardingItem=[
    Boarding(
      title:'onBoardingScreen1',
      image:'https://marketersplatform.com/wp-content/uploads/2021/08/online-1617947180.jpg',
      body:'onBoardingBody1',
    ),
    Boarding(
      title:'onBoardingScreen2',
      image:'https://i1.wp.com/dl.img-news.com/dl/img/s0/dl/2020/09/1471701-559173709.jpeg?fit=%2C&ssl=1',
      body:'onBoardingBody2',
    ),
    Boarding(
      title:'onBoardingScreen3',
      image:'https://5.imimg.com/data5/GQ/FP/MY-26802338/online-shopping-system-500x500.jpg',
      body:'onBoardingBody3',
    ),
  ];
  @override
  void initState() {
    super.initState();
    pageController =
    PageController(initialPage: 0, viewportFraction: viewportFraction)
      ..addListener(() {
        setState(() {
          pageOffset = pageController!.page;
        });
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
            top:60.0,
          bottom:40.0,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(boardingItem[pagNum].title,
              style:const TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 25,
                fontStyle: FontStyle.italic
              ) ,
              ),
            ),
            Expanded(
                child: PageView.builder(
                  itemBuilder: (context,index){
                    double scale = max(viewportFraction,
                        (1 - (pageOffset! - index).abs()) + viewportFraction);
                    return Container(
                      padding: EdgeInsets.only(
                        right: 10,
                        left: 10,
                        top: 150 - scale * 25,
                        bottom: 150 - scale * 25,
                      ),
                      child: itemBuilderPage(boardingItem[index]),
                    );
                  },
                  onPageChanged: (int index) {
                    setState(() {
                      pagNum = index;
                    });
                      if (index == boardingItem.length - 1) {
                        setState(() {
                          isLast = true;
                        });
                      }
                      else {
                        setState(() {
                          isLast = false;
                        });
                      }
                    },
                  itemCount: boardingItem.length,
                  controller: pageController,
                  physics: const BouncingScrollPhysics(),
                ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:30.0,),
              child: Column(
                children: [
                  SmoothPageIndicator(
                    controller: pageController!,
                    count: boardingItem.length,
                    effect:  ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      expansionFactor: 2,
                      activeDotColor: Colors.blue[700]!,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:30.0),
                    child: Container(
                      width: double.infinity,
                      child: MaterialButton(
                        onPressed: (){
                          navigateToAndDelete(context: context, screen: LoginScreen());
                        },
                        child: const Text('Start shoping',
                          style: TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w900
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue[700],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget itemBuilderPage(Boarding model)=> Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colors.grey[300],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [
        Image(image: NetworkImage(model.image,),
          fit: BoxFit.fill,
        ),
      ],
    ),
  );
}
