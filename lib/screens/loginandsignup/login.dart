import 'package:coupon/cubit/bloc.dart';
import 'package:coupon/cubit/cubit.dart';
import 'package:coupon/default.dart';
import 'package:coupon/screens/home.dart';
import 'package:coupon/screens/loginandsignup/sginuoassalesman.dart';
import 'package:coupon/screens/loginandsignup/sginupasstudent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class LoginScreen extends StatelessWidget {
  var formKey=GlobalKey<FormState>();
  var   textcontroller =TextEditingController();
  var  passwordtcontroller =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CouponCubit,couponAppStates>(
      listener: (BuildContext context,couponAppStates state) {},
      builder: (BuildContext context, couponAppStates state) {
        var cubit=CouponCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Column(
                children: [
                  Expanded(child: Container(color: Colors.blueAccent,)),
                  Expanded(child: Container(color: Colors.white,)),
                ],
              ),
              Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(
                            child: Image(image: AssetImage('assets/couponuni.png'),
                             ),
                          ),
                          const SizedBox(height: 20,),
                          const Center(
                            child: Text(' get our offers now !!!  ',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                              ),),
                          ),
                          const SizedBox(height: 20,),
                          defaultFormField(
                            validator: (value){
                              if(value.isEmpty){
                                return 'pleas enter an email';
                              }
                              return null;
                            },
                            prefix:Icons.email,
                            controller: textcontroller,
                            label: 'email',
                            type: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 20,),
                          defaultFormField(
                              validator: (value){
                                if(value.isEmpty){
                                  return 'pleas enter an password';
                                }
                                return null;
                              },
                              prefix:Icons.lock,
                              controller: passwordtcontroller,
                              label: 'password',
                              type: TextInputType.visiblePassword,
                              suffix: cubit.isPassword ? Icons.visibility : Icons.visibility_off,
                              isPassword: cubit.isPassword,
                              function: (){
                                cubit.isPasswordState();
                              }
                          ),
                          const SizedBox(height: 30,),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.blue[800],
                            ),
                            width: double.infinity,
                            child: MaterialButton(
                              child: const Text('Sign In',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),),
                              height: 50,
                              onPressed: (){
                                if(formKey.currentState!.validate()) {
                                  navigateToAndDelete(
                                      screen: HomeScreen(), context: context);
                                  cubit.isGuestFalseState();
                                  cubit.bottomNaveChange(0);
                                }
                              },
                            ),
                          ),
                          const SizedBox(height: 30,),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.blue[800]!,
                                  width: 2
                              ),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            width: double.infinity,
                            child: MaterialButton(
                              child:  Text('Sign Up',
                                style: TextStyle(
                                  color: Colors.blue[800],
                                  fontSize: 25,
                                ),),
                              height: 50,
                              onPressed: () => showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => SimpleDialog(
                                  title: const Text('Register',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900

                                    ),),
                                  children: <Widget>[
                                    SizedBox(height: 15,),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          color: Colors.blue[800],
                                        ),
                                        child: TextButton(
                                          onPressed: () {navigateTo(context: context, screen: SignUpStudentScreen());},
                                          child:   const Text('انشاء حساب لطلاب الجامعة',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w900

                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 15,),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.blue[800]!,
                                              width: 2
                                          ),
                                          borderRadius: BorderRadius.circular(30.0),
                                        ),
                                        child: TextButton(
                                          onPressed: () {navigateTo(context: context, screen: SignUpSalesManeScreen());},
                                          child:  Text('تسجيل كبائع',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.blue[900],
                                                fontWeight: FontWeight.w900

                                            ),),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 15,),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      child: TextButton(
                                        onPressed: () => Navigator.pop(context, 'Cancel'),
                                        child:  Text('Cancel',
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.blue[600],

                                          ),),
                                      ),
                                    ),
                                  ],
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
            ],
          ),
        );
      },
    );
  }
}