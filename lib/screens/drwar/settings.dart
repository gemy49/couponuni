import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool value=false;
  var valueChose;

  List item=[
    'English(US)',
    'Italy',
    'Arabic',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: [
       SwitchListTile(
        title: const Text('Push Notification',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
        subtitle:const Text('Notification arrive on order status',style: TextStyle(fontWeight: FontWeight.w700),),
        value: value,
        onChanged: (e) {
          setState(() {
            value=!value;
          });
        },
      ),
       SwitchListTile(
        title: const Text('SMS Notification',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
        subtitle:const Text('01066846456',style: TextStyle(fontWeight: FontWeight.w700),),
        value: value,
        onChanged: (e) {
          setState(() {
            value=!value;
          });
        },
      ),
       SwitchListTile(
        title: const Text('Email Notification',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
        subtitle:const Text('mohamed.gamal1579@gmail.com',style: TextStyle(fontWeight: FontWeight.w700),),
        value: value,
        onChanged: (e) {
          setState(() {
            value=!value;
          });
        },
      ),
        SizedBox(height: 20,),
        Container(
            width:double.infinity,
            height: 70,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey[300]!,
                width: .5,
              ),
            ),
            child: Row(
              children: [
             Padding(
               padding: const EdgeInsets.all(15.0),
               child: SizedBox(width: 100,
                   child: const Text('Language',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),)
               ),
             ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: 150,
                    child: DropdownButton(
                      underline: SizedBox(),
                      elevation: 0,
                      isExpanded: true,
                      hint: const Text('Language',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900),),
                      value:valueChose,
                      onChanged: (value){
                        setState(() {
                          valueChose=value;
                        });
                      },
                      items: item.map((e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
