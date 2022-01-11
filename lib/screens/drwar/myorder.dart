import 'package:coupon/screens/products/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../default.dart';
import '../../model.dart';
import '../../wepview.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Order'),
      ),
      body: ListView.separated(
        shrinkWrap: true,
        itemCount:data.length,
        separatorBuilder: (BuildContext context, int index)=>Container(color: Colors.white,),
        itemBuilder: (BuildContext context, int index)=> Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: MyOrderList(index,context),
        ),
      ),
    );
  }
}
Widget MyOrderList(index,context)=>InkWell(
  onTap: (){navigateTo(context: context, screen: ProductsScreen(name: '${data[index]['name']}',image: '${data[index]['image']}',price: '${data[index]['price']}',oldPrice:'${data[index]['old_price']}' ,));},
  child:   Container(
    height: 200,
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
                SizedBox(height: 10,),
                Text('${data[index]['name']}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 20,),
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                          CircleAvatar(
                            radius: 5,
                            backgroundColor: Colors.yellowAccent,
                          ),
                            Container(
                              width: .5,
                              height: 55,
                              color: Colors.blueGrey,
                            ),
                            CircleAvatar(
                              radius: 5,
                              backgroundColor: Colors.blueGrey,
                            ),
                          ],
                        ),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('14 apr 2020'),
                            Text('order placed'),
                            SizedBox(height:30 ),
                            Text('order pending'),
                          ],
                        ),
                      ],
                    ),
                ),
              ],
            ),
          ),
        ]
    ),
  ),
);