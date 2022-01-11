import 'package:coupon/default.dart';
import 'package:coupon/screens/products/products.dart';
import 'package:coupon/screens/search.dart';
import 'package:coupon/wepview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model.dart';

class favorite extends StatelessWidget {
  const favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView.separated(
            shrinkWrap: true,
            itemCount:data.length,
            separatorBuilder: (BuildContext context, int index)=>Container(height: 20,color: Colors.white,),
            itemBuilder: (BuildContext context, int index)=> bestproducts(index,context),
          ),
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
                Spacer(),
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.add_shopping_cart,
                        ),
                        Text('add to cart')
                      ],
                    ),
                    SizedBox(width:30,),
                    Row(
                      children: [
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