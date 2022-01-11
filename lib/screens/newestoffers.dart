import 'package:carousel_slider/carousel_slider.dart';
import 'package:coupon/default.dart';
import 'package:coupon/model.dart';
import 'package:coupon/screens/products/products.dart';
import 'package:coupon/wepview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'newestproducts.dart';

class NewOffers extends StatelessWidget {
  const NewOffers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
              options: CarouselOptions(
                height: 250,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval:Duration(seconds: 3,),
                autoPlayAnimationDuration: Duration(seconds: 1,),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
                viewportFraction: 1,
              ),
              items: category.map((e) => Image(
                image: NetworkImage('${e['image']}'),
                width: double.infinity,
              )).toList()
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child:  Text('categories',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 22,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Container(
              height: 120,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context,index)=> InkWell(
                  child: Column(
                    children: [
                      SizedBox(
                        child: Image(image: NetworkImage('${category[index]['image']}'),),
                        height: 50,
                        width: 50,
                      ),
                      SizedBox(height: 10,),
                      SizedBox(
                        child: Text('${category[index]['name']}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        height: 50,
                        width: 50,
                      ),
                    ],
                  ),
                ),
                separatorBuilder:  (context,index)=>const SizedBox(width: 15,),
                itemCount: category.length,
              ),
            ),
          ),

           Row(
             children:  [
               const Padding(
                 padding: EdgeInsets.only(top: 20.0,bottom: 20,right: 10,left: 10),
                 child: Text('Newest products',
                   style: TextStyle(
                     fontWeight: FontWeight.w600,
                     fontSize: 22,
                   ),
                 ),
               ),
               const Spacer(),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 10.0),
                 child: TextButton(
                     onPressed: (){
                       navigateTo(context: context, screen: NewestProductsScreen(name: 'Newest products',));
                     },
                     child:     Text('View all',
                       style: TextStyle(
                         fontWeight: FontWeight.w600,
                         fontSize: 20,
                         color: Colors.grey[600],
                       ),
                     ),
                 ),
               ),
             ],
           ),
          SizedBox(
            height: 263,
            child:ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context,index)=> products(index, context),
              separatorBuilder:  (context,index)=> Container(width: 1,color: Colors.grey[300],),
              itemCount: data.length,
            ),
          ),
          Row(
             children:  [
               const Padding(
                 padding: EdgeInsets.only(top: 20.0,bottom: 20,right: 10,left: 10),
                 child: Text('Featured products',
                   style: TextStyle(
                     fontWeight: FontWeight.w600,
                     fontSize: 22,
                   ),
                 ),
               ),
               const Spacer(),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 10.0),
                 child: TextButton(
                     onPressed: (){
                       navigateTo(context: context, screen: NewestProductsScreen(name: 'Featured products',));
                     },
                     child:Text('View all',
                       style: TextStyle(
                         fontWeight: FontWeight.w600,
                         fontSize: 20,
                         color: Colors.grey[600],
                       ),
                     ),
                 ),
               ),
             ],
           ),
          SizedBox(
            height: 263,
            child:ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context,index)=> products(index, context),
              separatorBuilder:  (context,index)=> Container(width: 1,color: Colors.grey[300],),
              itemCount: data.length,
            ),
          ),
        ],
      ),
    );
  }
}
Widget products(index,context)=>InkWell(
  onTap: (){navigateTo(context: context, screen:ProductsScreen(image:'${data[index]['image']}',name: '${data[index]['name']}',price: '${data[index]['price']}',oldPrice: '${data[index]['old_price']}',) );},
  child:   Container(
    width: 200,
    color: Colors.white,
    child: Column(
        children: [
          Stack(
              alignment:AlignmentDirectional.topStart,
              children: [
                Image(
                  image: NetworkImage('${data[index]['image']}',),
                  width: double.infinity,
                  height: 200,
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
                Text('${data[index]['name']}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
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
              ],
            ),
          ),
        ]
    ),
  ),
);