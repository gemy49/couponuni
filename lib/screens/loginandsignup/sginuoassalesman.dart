import 'package:coupon/cubit/bloc.dart';
import 'package:coupon/cubit/cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../default.dart';
import '../home.dart';
import 'login.dart';

class SignUpSalesManeScreen extends StatelessWidget {

    var emailController = TextEditingController();
    var firstNameController = TextEditingController();
    var lastNameController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    var textcontroller = TextEditingController();
    var passwordtcontroller = TextEditingController();
    var ConfirmPasswordtcontroller = TextEditingController();

    @override
    Widget build(BuildContext context) {
      return BlocConsumer<CouponCubit, couponAppStates>(
        listener: (BuildContext context, couponAppStates state) {},
        builder: (BuildContext context, couponAppStates state) {
          var cubit = CouponCubit.get(context);
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
                              child: Image(
                                image: AssetImage('assets/couponuni.png'),
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
                            Row(
                              children: [
                                Container(
                                  width: 150,
                                  height: 45,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'pleas enter the name';
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.name,
                                    controller: firstNameController,
                                    decoration: InputDecoration(
                                      labelStyle: TextStyle(
                                          color: Colors.black),
                                      label: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Firs name'),
                                      ),
                                      fillColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            30.0),
                                        borderSide: BorderSide(
                                          color: Colors.grey[300]!,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            30.0),
                                        borderSide: BorderSide(
                                          color: Colors.grey[300]!,
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  width: 150,
                                  height: 45,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'pleas enter the name';
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.name,
                                    controller: lastNameController,
                                    decoration: InputDecoration(
                                      labelStyle: TextStyle(
                                          color: Colors.black),
                                      label: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Last name'),
                                      ),
                                      fillColor: Colors.white,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            25.0),
                                        borderSide: BorderSide(
                                          color: Colors.grey[300]!,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            25.0),
                                        borderSide: BorderSide(
                                          color: Colors.grey[300]!,
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 30,),
                            defaultFormField(
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'pleas enter an email';
                                }
                                return null;
                              },
                              prefix: Icons.email,
                              controller: textcontroller,
                              label: 'email',
                              type: TextInputType.emailAddress,
                            ),
                            const SizedBox(height: 30,),
                            defaultFormField(
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'pleas enter an password';
                                  }
                                  return null;
                                },
                                prefix: Icons.lock,
                                controller: passwordtcontroller,
                                label: 'password',
                                type: TextInputType.visiblePassword,
                                suffix: cubit.isPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                isPassword: cubit.isPassword,
                                function: () {
                                  cubit.isPasswordState();
                                }
                            ),
                            const SizedBox(height: 30,),
                            defaultFormField(
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'pleas confirm the password';
                                  }
                                  return null;
                                },
                                prefix: Icons.lock,
                                controller: ConfirmPasswordtcontroller,
                                label: 'confirm password',
                                type: TextInputType.visiblePassword,
                                suffix: cubit.isPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                isPassword: cubit.isPassword,
                                function: () {
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
                                child: const Text('Sign Up',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                  ),),
                                height: 50,
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    navigateToAndDelete(
                                        screen: HomeScreen(), context: context);
                                    cubit.isGuestFalseState();
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
                                  child: Text('Sign In',
                                    style: TextStyle(
                                      color: Colors.blue[800]!,
                                      fontSize: 25,
                                    ),),
                                  height: 50,
                                  onPressed: () =>
                                      navigateTo(context: context,
                                          screen: LoginScreen())
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
