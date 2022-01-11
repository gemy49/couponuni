import 'package:coupon/cubit/bloc.dart';
import 'package:coupon/cubit/cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  final  String url;
  final  String name;
  WebViewScreen( this.url,this.name);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CouponCubit,couponAppStates>(
        listener: (BuildContext context,couponAppStates state) { },
        builder: (BuildContext context, couponAppStates state) {
          var cubit=CouponCubit.get(context);
          return  Scaffold(
            appBar: AppBar(
              title: Text(name),
              centerTitle: true,
            ),
            body: Stack(
              children: <Widget>[
                WebView(
                  initialUrl: url,
                  javascriptMode: JavascriptMode.unrestricted,
                  onPageFinished: (finish) {
                      cubit.wepViewFalseState();
                  },
                  onProgress: (progress){
                    if(progress==10){
                      cubit.wepViewTrueState();
                    }
                  },
                ),
                cubit.progressState! ? Center( child: CircularProgressIndicator(),)
                    : Stack(),
              ],
            ),
          );
        }
        );
  }
}