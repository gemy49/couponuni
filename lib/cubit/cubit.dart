import 'package:bloc/bloc.dart';
import 'package:coupon/screens/profile.dart';
import 'package:coupon/screens/newestoffers.dart';
import 'package:coupon/screens/cart/cart.dart';
import 'package:coupon/screens/favorite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';

class CouponCubit extends Cubit<couponAppStates>{
  CouponCubit() : super(AppInitialState());
  static CouponCubit get(context)=>BlocProvider.of(context);
  List<Widget>screens=[
    NewOffers(),
    favorite(),
    CatrScreen(),
    profileScreen(),
  ];
  List<Text>title=[
   const Text(' newest products'),
   const Text(' favorite'),
   const Text(' cart'),
   const Text(' profile'),
  ];
  int currentIndex=0;
  void bottomNaveChange(index){
    currentIndex=index;
   emit(BottomNaveChangeState());
  }
  bool? isGuest=false;
  void isGuestTrueState(){
   isGuest=true;
    emit(IsGuestChangeTrueState());
  }
  void isGuestFalseState(){
   isGuest=false;
    emit(IsGuestChangeFalseState());
  }
  bool? progressState=true;
  void wepViewFalseState(){
    progressState=false;
    emit(ProgressChangeFalseState());
  }
  void wepViewTrueState(){
    progressState=true;
    emit(ProgressChangeTrueState());
  }
  bool isPassword = true;
  void isPasswordState(){
    isPassword=!isPassword;
    emit(IsPasswordChangeState());
  }
  bool isGrid = true;
  void isGridState(){
    isGrid=!isGrid;
    emit(IsGridChangeState());
  }
  var isCheck;
  void isCheckState(index){
    isCheck=index;
    print(isCheck);
    emit(IsCheckState());
  }
}