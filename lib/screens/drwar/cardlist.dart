import 'package:coupon/screens/cart/addcard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../default.dart';

class CardList extends StatelessWidget {
  const CardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment',style: TextStyle(fontSize: 20),),
        elevation: 3,
      ),
      body: ListView(
        children: [
      Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              const Text('Quick pay',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic,
                  fontSize: 18,
                ),
              ),
              const Spacer(),
              Container(
                width: 100,
                height: 35,
                child: MaterialButton(
                  onPressed: (){
                    navigateTo(context: context, screen: AddCardScreen());
                  },
                  child:  Text('add card ',
                    style: TextStyle(
                      color: Colors.blue[800],
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.italic,
                      fontSize: 15,

                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.blue[800]!,
                      width: 2
                  ),
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ],
          ),
        ),
      ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context,index)=>card(),
          separatorBuilder: (context,index)=>SizedBox(),
          itemCount: 5
      ),
      ],
    ),
        ],
    ),
    );
  }
}
Widget card()=> Padding(
  padding: const EdgeInsets.all(15.0),
  child: Container(
    width: double.infinity,
    height: 240,
    decoration: BoxDecoration(
      gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [
            .1,
            .5,
            .9,
          ],
          colors: [
            Colors.blue,
            Colors.red,
            Colors.deepPurpleAccent
          ]
      ),
      border: Border.all(
          color: Colors.grey[200]!,
          width: 2
      ),
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: Padding(
      padding: const EdgeInsets.only(right: 15.0,left: 15,top: 20,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Text('Debit card',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic,
                  fontSize: 18,
                  color: Colors.white,

                ),
              ),
              Spacer(),
              Text('The United Bank',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20,),
          Container(
              height: 50,
              width: 50,

              child:Image(
                image: NetworkImage('https://p.kindpng.com/picc/s/603-6039982_sim-card-chip-png-transparent-png.png'),
              )
          ),
          const SizedBox(height: 20,),
          const Text('3434 3434 3434',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic,
              fontSize: 18,
              color: Colors.white,
            ),),
          const SizedBox(height: 5,),
          const Text('valid 12/12',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic,
              fontSize: 15,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 15,),
          const Text('Bader',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic,
              fontSize: 15,
              color: Colors.white,
            ),),

        ],
      ),
    ),
  ),
);