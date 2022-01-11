import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ'),
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children:  [
          ExpansionTile(
            expandedAlignment: Alignment.topLeft,
              title: Text('Account Deactivate',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
            children: [
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: const [
                   Padding(
                     padding: EdgeInsets.symmetric(horizontal: 15.0),
                     child: Text('Account Deactivate',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 18),),
                   ),
                   Padding(
                     padding: EdgeInsets.all( 15.0),
                     child: Text('Quick Pay',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 18),),
                   ),
                   Padding(
                     padding: EdgeInsets.symmetric(horizontal: 15.0),
                     child: Text('Return items',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 18),),
                   ),
                   Padding(
                     padding: EdgeInsets.all( 15.0),
                     child: Text('Replace items',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 18),),
                   ),

                 ],
               ),
            ],
          ),
          ExpansionTile(
            expandedAlignment: Alignment.topLeft,
              title: Text('Quick Pay',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
            children: [
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: const [
                   Padding(
                     padding: EdgeInsets.symmetric(horizontal: 15.0),
                     child: Text('Account Deactivate',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 18),),
                   ),
                   Padding(
                     padding: EdgeInsets.all( 15.0),
                     child: Text('Quick Pay',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 18),),
                   ),
                   Padding(
                     padding: EdgeInsets.symmetric(horizontal: 15.0),
                     child: Text('Return items',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 18),),
                   ),
                   Padding(
                     padding: EdgeInsets.all( 15.0),
                     child: Text('Replace items',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 18),),
                   ),

                 ],
               ),
            ],
          ),
          ExpansionTile(
            expandedAlignment: Alignment.topLeft,
              title: Text('Return items',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
            children: [
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: const [
                   Padding(
                     padding: EdgeInsets.symmetric(horizontal: 15.0),
                     child: Text('Account Deactivate',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 18),),
                   ),
                   Padding(
                     padding: EdgeInsets.all( 15.0),
                     child: Text('Quick Pay',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 18),),
                   ),
                   Padding(
                     padding: EdgeInsets.symmetric(horizontal: 15.0),
                     child: Text('Return items',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 18),),
                   ),
                   Padding(
                     padding: EdgeInsets.all( 15.0),
                     child: Text('Replace items',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 18),),
                   ),

                 ],
               ),
            ],
          ),
          ExpansionTile(
            expandedAlignment: Alignment.topLeft,
              title: const Text('Replace items',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
            children: [
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: const [
                   Padding(
                     padding: EdgeInsets.symmetric(horizontal: 15.0),
                     child: Text('Account Deactivate',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 18),),
                   ),
                   Padding(
                     padding: EdgeInsets.all( 15.0),
                     child: Text('Quick Pay',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 18),),
                   ),
                   Padding(
                     padding: EdgeInsets.symmetric(horizontal: 15.0),
                     child: Text('Return items',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 18),),
                   ),
                   Padding(
                     padding: EdgeInsets.all( 15.0),
                     child: Text('Replace items',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 18),),
                   ),

                 ],
               ),
            ],
          ),
          ],
        ),
      ),
    );
  }
}
