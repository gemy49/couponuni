import 'package:coupon/cubit/bloc.dart';
import 'package:coupon/cubit/cubit.dart';
import 'package:coupon/default.dart';
import 'package:coupon/screens/drwar/account.dart';
import 'package:coupon/screens/drwar/contact.dart';
import 'package:coupon/screens/drwar/myorder.dart';
import 'package:coupon/screens/drwar/settings.dart';
import 'package:coupon/screens/search.dart';
import 'package:coupon/wepview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model.dart';
import 'drwar/faq.dart';
import 'loginandsignup/login.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CouponCubit,couponAppStates>(
      listener: (BuildContext context,couponAppStates state) {},
      builder: (BuildContext context, couponAppStates state) {
        var cubit=CouponCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title:cubit.title[cubit.currentIndex],
            actions: [
              IconButton(
                  onPressed: (){navigateTo(context: context, screen: SearchScreen());},
                  icon: const Icon(Icons.search,size: 27,)
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index){
              cubit.bottomNaveChange(index);
            },
            currentIndex:cubit.currentIndex,
            type: BottomNavigationBarType.fixed,
            elevation: 0.0,
            backgroundColor: Colors.white,
            items:const [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: 'newest  offers'),
              BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'favorite'),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label:'cart'),
              BottomNavigationBarItem(icon: Icon(Icons.person),label: 'profile'),
            ],
          ),
          drawer: Drawer(
            child: ListView(
                children: [
                  const SizedBox(height: 20,),
                  SizedBox(
                    width: double.infinity,
                    height: 250,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:  <Widget>[
                        InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: const [
                              CircleAvatar(
                                radius: 50,
                                backgroundImage: AssetImage("assets/profile.png"),
                              ),
                              CircleAvatar(
                                  radius: 14,
                                  backgroundColor: Colors.red,
                                  child: Icon(Icons.camera_alt_outlined,color: Colors.white,)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20,),
                        const Text('User name',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Container(
                          height: 80,
                          width: double.infinity,
                          color: Colors.grey[300],
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                     InkWell(
                                       onTap:(){
                                         navigateTo(context: context, screen: MyOrderScreen());
                                       },
                                       child: Column(
                                  children:  const [
                                    Text('My order',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                     Text('08',
                                       style: TextStyle(
                                         color: Colors.deepOrange,
                                         fontWeight: FontWeight.w600,
                                         fontSize: 18,
                                       ),
                                     ),
                                  ],
                                ),
                        ),
                                const Spacer(),
                                InkWell(
                                  onTap: (){
                                    Navigator.pop(context);
                                    cubit.bottomNaveChange(1);
                                  },
                                  child: Column(
                                    children: const [
                                      Text('Wishlist ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                        ),
                                      ),
                                       SizedBox(height: 10,),
                                      Text('07',
                                        style: TextStyle(
                                          color: Colors.deepOrange,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                   ListView.separated(
                     physics: NeverScrollableScrollPhysics(),
                     shrinkWrap: true,
                     itemBuilder: (context,index)=> ExpansionTile(
                       title: Text('${category[index]['name']}'),
                       controlAffinity: ListTileControlAffinity.leading,
                       trailing: SizedBox(
                           height: 30,
                           width: 30,
                           child: Image(image: NetworkImage('${category[index]['image']}'),)
                       ),
                       children: <Widget>[
                         ListView.separated(
                           shrinkWrap: true,
                           itemBuilder: (context,num)=>   InkWell(
                             onTap: () {
                               navigateTo(context: context,
                                   screen: WebViewScreen(supCategory[index][num]['url'],
                                       supCategory[index][num]['name'])
                               );
                             },
                             child: ListTile(
                               title: Text('${supCategory[index][num]['name']}'),
                               trailing: SizedBox(
                                   height: 30,
                                   width: 30,
                                   child: Image(image: NetworkImage('${supCategory[index][num]['image']}'),)
                               ),
                             ),
                           ),
                           separatorBuilder: (context,index)=>Container(
                             width: double.infinity,
                             height: 2.0,
                             color: Colors.grey[500],
                           ),
                           itemCount: supCategory[index].length,
                         ),
                       ],
                     ),
                     separatorBuilder: (context,index)=>divider(),
                     itemCount: category.length,
                   ),
                  const SizedBox(height: 15,),
                  InkWell(
                    onTap: () {
                      navigateTo(context: context, screen: WebViewScreen('https://www.instagram.com/uni.coupon/?igshid=1w2a9hpjqzfqx', 'instagram'));
                    },
                    child: Padding(
                      padding:  const EdgeInsets.all(20.0),
                      child: Row(
                        children:  const [
                          SizedBox(
                              height:30,
                              width: 30,
                              child: Image(image: AssetImage('assets/instagram.jpg'),)
                          ),
                          SizedBox(width: 13),
                          Text('instagram',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.italic,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      navigateTo(context: context, screen:AccountScreen());
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: const [
                          Icon(Icons.person),
                          SizedBox(width: 20),
                          Text('Account ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.italic,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                     onTap: (){
                       navigateTo(context: context, screen: ContactUsScreen());
                     }
                    // {
                    //   showDialog<String>(
                    //       context: context,
                    //       builder: (BuildContext context) =>  SimpleDialog(
                    //         title: const Text('Contact us',
                    //           style: TextStyle(
                    //             fontSize: 20,
                    //             fontWeight: FontWeight.w900,
                    //             fontStyle: FontStyle.italic,
                    //           ),
                    //         ),
                    //         children: [
                    //           const Padding(
                    //             padding: EdgeInsets.all(8.0),
                    //             child: Text('البريد الالكترونى : info@couponuni.com \n +رقم الهاتف :  966504321143',
                    //               style: TextStyle(
                    //                 fontSize: 20,
                    //                 fontWeight: FontWeight.w900,
                    //                 fontStyle: FontStyle.italic,
                    //               ),
                    //             ),
                    //           ),
                    //           const SizedBox(height: 15,),
                    //           Padding(
                    //             padding:  const EdgeInsets.symmetric(horizontal: 20),
                    //             child: TextButton(
                    //               onPressed: () => Navigator.pop(context, 'Cancel'),
                    //               child:  Text('Cancel',
                    //                 style: TextStyle(
                    //                   fontSize: 17,
                    //                   color: Colors.blue[600],
                    //
                    //                 ),
                    //               ),
                    //             ),
                    //           ),
                    //         ],
                    //       )
                    //   );
                    // },
                      ,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: const [
                          Icon(Icons.add_ic_call_outlined),
                          SizedBox(width: 20),
                          Text('Contact us',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.italic,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      navigateTo(context: context, screen: WebViewScreen('https://couponuni.com/عن-كوبوني/', 'عن كوبوني'));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: const [
                          Icon(Icons.info),
                          SizedBox(width: 20),
                          Text('About us',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.italic,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      navigateTo(context: context, screen: FaqScreen());
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: const [
                          Icon(Icons.description),
                          SizedBox(width: 20),
                          Text('FAQ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.italic,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      navigateTo(context: context, screen: SettingsScreen());
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: const [
                          Icon(Icons.settings),
                          SizedBox(width: 20),
                          Text('Settings',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.italic,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
          ),

          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
