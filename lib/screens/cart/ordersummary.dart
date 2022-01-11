import 'package:coupon/default.dart';
import 'package:coupon/screens/cart/changeadress.dart';
import 'package:coupon/screens/cart/payment.dart';
import 'package:coupon/screens/products/products.dart';
import 'package:coupon/wepview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model.dart';

class OrderSummaryScreen extends StatelessWidget {
 var name;
 var description;
 var address;
 var city;
 var num;
 OrderSummaryScreen(
     this.name,
     this.description,
     this.address,
     this.city,
     this.num,
     );

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        title: const Text('order Summery'),
        centerTitle: true,
        elevation: 0,
      ) ,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Expanded(
              child: Container(
                  height: 60,
                  color:Colors.white,
                  child: MaterialButton(
                    onPressed: (){},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('\$70',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600
                          ),),
                        SizedBox(height: 10,),
                        Text('see price details',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400
                          ),),
                      ],
                    ),
                  )
              ),
            ),
            Expanded(
              child: Container(
                color:Colors.blue[600],
                height: 60,
                child: MaterialButton(
                  onPressed: (){
                    navigateTo(context: context, screen: const PaymentsScreen());
                  },
                  child: const Text('continue',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text('$name',
                        style: const TextStyle(
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
                      const SizedBox(height: 5,),
                       Text('$description',
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300
                        ),
                      ),
                      const SizedBox(height: 5,),
                       Text('$address',
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300
                        ),
                      ),
                      const SizedBox(height: 5,),
                       Text('$city',
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(height: 15,),
                       Text('$num',
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                      const SizedBox(height: 30,),
                      Container(
                        width: double.infinity,
                        height: 45,
                        child: MaterialButton(
                          onPressed: (){
                            navigateTo(context: context, screen: ChangeAddressScreen());
                          },
                          child: const Text('Change address',
                            style: TextStyle(
                                fontSize: 20,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w900
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.blue[600],
                        ),
                      ),
                    ],
                  ),
                ),
                height: 260,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(
                      color: Colors.grey[200]!,
                      width: 2
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount:3,
                  separatorBuilder: (BuildContext context, int index)=>Container(height: 20,color: Colors.white,),
                  itemBuilder: (BuildContext context, int index)=> bestproducts(index,context),
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
Widget bestproducts(index,context)=>InkWell(
  onTap: (){navigateTo(context: context, screen: ProductsScreen(name: '${data[index]['name']}',image: '${data[index]['image']}',price: '${data[index]['price']}',oldPrice:'${data[index]['old_price']}' ,));},
  child:   Container(
    height: 150,
    color: Colors.grey[100],
    child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
              alignment:AlignmentDirectional.topStart,
              children: [
                Image(
                  image: NetworkImage('${data[index]['image']}',),
                  height:150,
                  width: 150,
                ),
                if(data[index]['old_price']!=null)
                  CircleAvatar(
                    radius:18 ,
                    backgroundColor: Colors.grey[600],
                    child:const Text(
                      'تخفيص',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600,
                      ),
                    ) ,
                  )  ,
              ]
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start ,
              children: [
                const SizedBox(height: 10,),
                Text('${data[index]['name']}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    Text('${data[index]['price']}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style:  TextStyle(
                        fontSize: 14,
                        color:Colors.blue[800],
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(width: 15,),
                    if(data[index]['old_price']!=null)
                      Text('${data[index]['old_price']}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.5,
                          color: Colors.grey[500],
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.bookmark_border_outlined,
                        ),
                        Text('next time buy',
                          style: TextStyle(
                              fontSize: 13
                          ),)
                      ],
                    ),
                    const SizedBox(width:20,),
                    Row(
                      children: const [
                        Icon(
                          Icons.restore_from_trash_outlined,
                        ),
                        Text('remove')
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]
    ),
  ),
);





