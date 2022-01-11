import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactEmailScreen extends StatelessWidget {
var Controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Email to Woobox'),
            SizedBox(height: 10,),
            Text('Mohamed.gamal1579@gmail.com',style: TextStyle(fontSize: 18),),
            SizedBox(height: 10,),
            Container(width: double.infinity,height: 1,color: Colors.grey,),
            TextFormField(
              controller:Controller,
              decoration: const InputDecoration(
                label:Text(' Description'),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: double.infinity,
                child: MaterialButton(
                  onPressed: (){Navigator.pop(context);},
                  child: const Text('Send Email',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.italic,
                      fontSize: 18,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blue[800],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
