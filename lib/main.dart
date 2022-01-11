import 'package:bloc/bloc.dart';
import 'package:coupon/screens/onbording.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'cubit/bloc.dart';
import 'cubit/cubit.dart';
import 'default.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>CouponCubit(),
      child: BlocConsumer<CouponCubit,couponAppStates>(
        listener: (BuildContext context,couponAppStates state) {},
        builder: (BuildContext context, couponAppStates state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              textTheme:  const TextTheme(
                  bodyText1: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,

                  )
              ),
              primarySwatch: Colors.blue,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme:  const AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
                backgroundColor: Colors.white,
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
              ),
            ),
            title: 'Splash screen Demo',
            home: SplashScreenView(
              pageRouteTransition: PageRouteTransition.SlideTransition,
              speed: 500,
              navigateRoute:  OnBoardingScreen(),
              duration: 4000,
              imageSize: 130,
              imageSrc: "assets/couponuni.png",
              text: 'coupon',
              textType: TextType.ColorizeAnimationText,
              textStyle: const TextStyle(
                  fontSize: 60.0,
                  color: Colors.red
              ),
              colors: const [
                Colors.deepPurpleAccent,
                Colors.white70,
                Colors.red,
                Colors.deepOrange,
                Colors.amber
              ],
              backgroundColor: Colors.blueAccent,
            ),
          );
        },
      ),
    );
  }
}