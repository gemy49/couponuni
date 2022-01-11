import 'package:coupon/default.dart';
import 'package:coupon/screens/drwar/contactusemail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
             InkWell(
               onTap: (){

               },
               child: Row(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Call Request',
                        style: TextStyle(fontSize: 18),),
                        SizedBox(height: 10,),
                        Text('01066846456`', style: TextStyle(fontSize: 16),),
                      ],
                    ),
                   Spacer(),
                   Icon(Icons.keyboard_arrow_right_rounded),
                 ],
               ),
             ),
            SizedBox(height: 15,),
             Container(
               height: 1,
               width: double.infinity,
               color: Colors.grey,
             ),
             SizedBox(height: 15,),
             InkWell(
               onTap: ()=>navigateTo(context: context, screen: ContactEmailScreen()),
               child: Row(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Email',
                        style: TextStyle(fontSize: 18),),
                        SizedBox(height: 10,),
                        Text('Responc within 24 business hours', style: TextStyle(fontSize: 16),),
                      ],
                    ),
                   Spacer(),
                   Icon(Icons.keyboard_arrow_right_rounded),
                 ],
               ),
             ),
          ],
        ),
      ),
    );
  }
}
