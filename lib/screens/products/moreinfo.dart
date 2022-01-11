import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MoreInfoScreen extends StatelessWidget {
  const MoreInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                height: 40,
                width: 170,
                child: Center(child: Text('Lenth')),
                color: Colors.grey[300],
              ),
              SizedBox(height: 10,),
              Container(
                height: 40,
                width: 170,
                child: Center(child: Text('Height')),
                color: Colors.grey[300],
              ),
              SizedBox(height: 10,),
              Container(
                height: 40,
                width: 170,
                child: Center(child: Text('Width')),
                color: Colors.grey[300],
              ),
              SizedBox(height: 10,),
              Container(
                height: 40,
                width: 170,
                child: Center(child: Text('Brand')),
                color: Colors.grey[300],
              ),
            ],
          ),
          Column(
            children: [
              Container(
                height: 40,
                width: 170,
                child: Center(child: Text('50 Cm')),
                color: Colors.grey[100],
              ),
              SizedBox(height: 10,),
              Container(
                height: 40,
                width: 170,
                child: Center(child: Text('30 Cm')),
                color: Colors.grey[100],
              ),
              SizedBox(height: 10,),
              Container(
                height: 40,
                width: 170,
                child: Center(child: Text('30 Cm')),
                color: Colors.grey[100],
              ),
              SizedBox(height: 10,),
              Container(
                height: 40,
                width: 170,
                child: Center(child: Text('son3 Edya (:')),
                color: Colors.grey[100],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
