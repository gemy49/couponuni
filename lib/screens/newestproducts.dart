import 'package:coupon/cubit/bloc.dart';
import 'package:coupon/cubit/cubit.dart';
import 'package:coupon/screens/products/products.dart';
import 'package:coupon/wepview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../default.dart';
import '../model.dart';

class NewestProductsScreen extends StatelessWidget {
  final String name;

  NewestProductsScreen({
    required this.name,

  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CouponCubit,couponAppStates>(
      listener: (BuildContext context,couponAppStates state) {  },
      builder: (BuildContext context, couponAppStates state) {
        var cupit =CouponCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title:  Text(name,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            actions:  [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: IconButton(
                    onPressed: (){

                    },
                    icon: Icon(Icons.filter_list_sharp),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: IconButton(
                    onPressed: (){
                      cupit.isGridState();
                    },
                    icon:cupit.isGrid? Icon(Icons.window_outlined):Icon(Icons.list)
                ),
              ),

            ],
          ),
          body:cupit.isGrid? Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount:data.length,
                separatorBuilder: (BuildContext context, int index)=>Container(height: 20,color: Colors.white,),
                itemBuilder: (BuildContext context, int index)=> newOffersList(index,context),
              ),
            ),
          ):Container(
            color: Colors.grey[300],
            child: GridView.count(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 2,
                childAspectRatio: 1/1.35,
                mainAxisSpacing: 2,
                children:
                List.generate(data.length,
                      (index) => newOffersGrid(index,context),
                )
            ),
          ) ,

        );
      },
    );
  }
}
Widget newOffersGrid(index,context)=>InkWell(
  onTap: (){navigateTo(context: context, screen: ProductsScreen(name: '${data[index]['name']}',image: '${data[index]['image']}',price: '${data[index]['price']}',oldPrice:'${data[index]['old_price']}' ,));},
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
Widget newOffersList(index,context)=>InkWell(
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    children: [
                      Container(
                        height: 20,
                      width: 20,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.star_border,
                          ),
                        ),
                      ),
                      SizedBox(width: 5,),
                      Container(
                        height: 20,
                      width: 20,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.star_border,
                          ),
                        ),
                      ),
                      SizedBox(width: 5,),
                      Container(
                        height: 20,
                      width: 20,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.star_border,
                          ),
                        ),
                      ),
                      SizedBox(width: 5,),
                      Container(
                        height: 20,
                      width: 20,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.star_border,
                          ),
                        ),
                      ),
                      SizedBox(width: 5,),
                      Container(
                        height: 20,
                      width: 20,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.star_border,
                          ),
                        ),
                      ),
                      SizedBox(width: 30,),
                      Container(
                        height: 20,
                      width: 20,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite_border,
                          ),
                        ),
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