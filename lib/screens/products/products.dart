import 'package:coupon/screens/products/description.dart';
import 'package:coupon/screens/products/moreinfo.dart';
import 'package:coupon/screens/products/reviews.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  final image;
  final name;
  final price;
  final oldPrice;
  ProductsScreen({this.image,this.name,this.price,this.oldPrice});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body:  CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 450,
              floating: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 300,
                    decoration:  BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage('$image'),
                            fit:BoxFit.fill
                        )
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children:  [
                        Text('$name',style: const TextStyle(fontSize: 23,fontWeight: FontWeight.w600),),
                        Spacer(),
                        Text('$price',style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children:  [
                        Container(
                          width: 80,
                          height: 35,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text('3.0 ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 20,

                                  ),
                                ),
                                Icon(Icons.star,color: Colors.white,)
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        const SizedBox(width: 20,),
                        const Text('6 Reviewer',style: TextStyle(fontSize: 23,fontWeight: FontWeight.w600),),
                        const Spacer(),
                       Text(oldPrice=='null'?'':'$oldPrice',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[700],
                            decoration: TextDecoration.lineThrough,),),
                      ],
                    ),
                  )
                ],
              ) ,
              ),
              bottom:  TabBar(
                tabs: [
                  Tab(child:Text('Description',style: TextStyle(color: Colors.black),) ,),
                  Tab(child:Text('More info',style: TextStyle(color: Colors.black),) ,),
                  Tab(child:Text('Reviews',style: TextStyle(color: Colors.black),) ,),
                ],
              ),
            ),
             SliverFillRemaining(
              child: TabBarView(
                children: [
                 DescriptionScreen(),
                MoreInfoScreen(),
                ReviewsScreen(image)
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  color: Colors.white,
                  child:  MaterialButton(
                      onPressed: (){},
                      child: const Text(
                        'Add to Cart',
                        style: TextStyle(
                            color: Colors.black
                        ),
                      )
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 50,
                  color: Colors.blue,
                  child:  MaterialButton(
                      onPressed: (){},
                      child: const Text(
                        'Buy Now',
                        style: TextStyle(
                            color: Colors.white
                        ),
                      )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
