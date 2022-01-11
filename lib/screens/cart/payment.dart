import 'dart:math';

import 'package:coupon/default.dart';
import 'package:coupon/screens/cart/addcard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentsScreen extends StatefulWidget {
  const PaymentsScreen({Key? key}) : super(key: key);

  @override
  State<PaymentsScreen> createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {
  PageController? pageController;

  double viewportFraction = 1;

  double? pageOffset = 1;
  @override
  void initState() {
    super.initState();
    pageController =
    PageController(initialPage: 1, viewportFraction: viewportFraction)
      ..addListener(() {
        setState(() {
          pageOffset = pageController!.page;
        });
      });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payments'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(
              height: 324,
              width: double.infinity,
              child: PageView.builder(
                itemBuilder: (context,index){
                  double scale = max(viewportFraction,
                      (1 - (pageOffset! - index).abs()) + viewportFraction);
                  return Container(
                    padding: EdgeInsets.only(
                       top: 50 - scale * 25,
                        bottom: 82 - scale * 25,
                    ),
                    child: card(),
                  );
                },
                itemCount:3,
                controller: pageController,
                physics: const BouncingScrollPhysics(),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.grey[200]!,
                    width: .5
                ),
              ),
            ),
            const SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:15.0),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Text('Pay with Debit/Credit card',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ),
            ),
            const SizedBox(height:15,),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.grey[200]!,
                    width: .5
                ),
              ),
            ),
            const SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Text('Cash on delivery',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ),
            ),
            const SizedBox(height:15,),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.grey[200]!,
                    width: .5
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Payment Details',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                      const SizedBox(height:10,),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey[200]!,
                              width: .5
                          ),
                        ),
                      ),
                      const SizedBox(height: 15,),
                      Row(
                        children: const [
                          Text('offers -',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                          Text('offers not available',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15,),
                      Row(
                        children: const [
                          Text('shipping charge -',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                          Text('free',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.green
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15,),
                      Row(
                        children: const [
                          Text('Total Amount -',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                          Text('\$70',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.deepOrange
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey[200]!,
                      width: 2
                  ),
                ),
              ),
            ),
          ],
        ),
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