import 'package:coupon/default.dart';
import 'package:coupon/screens/cart/changeadress.dart';
import 'package:coupon/screens/drwar/cardlist.dart';
import 'package:coupon/screens/drwar/faq.dart';
import 'package:coupon/screens/drwar/myorder.dart';
import 'package:coupon/screens/favorite.dart';
import 'package:coupon/screens/loginandsignup/login.dart';
import 'package:coupon/screens/newestproducts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  var firstNameController=TextEditingController();

  @override
  void initState() {
    super.initState();
    firstNameController =  TextEditingController(text: '01066846456');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                const CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('assets/profile.png'),
                ),
                const SizedBox(height: 20,),
                const Text('Mohamed Gamal',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey[200]!,
                          width: 2
                      ),
                    ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Text('Please verify your email or number',style: TextStyle(fontSize: 18),),
                            const SizedBox(width:40,height: 40,child: Image(image: NetworkImage('https://aws1.discourse-cdn.com/eveonline/original/4X/b/f/9/bf93648f2d4aba1999491277db5b1b277ebdc638.gif')))

                          ],
                        ),
                      ),
                      Center(child: Text('Get newest offers',style: TextStyle(fontSize: 16),),),
                      SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey[200]!,
                                width: 2
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                child: Container(
                                  width:160,
                                  height: 50,
                                  child: TextFormField(
                                    validator: (value){
                                      if(value!.isEmpty){
                                        return 'pleas enter the name';
                                      }
                                      return null;
                                    },
                                    keyboardType:TextInputType.name ,
                                    controller: firstNameController,
                                    decoration:  const InputDecoration(
                                      border: InputBorder.none,
                                    )
                                  ),
                                ),
                              ),
                              Spacer(),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: MaterialButton(
                                  onPressed: (){},
                                  child: Text('Verify now'),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                InkWell(
                  onTap: ()=>navigateTo(context: context, screen: ChangeAddressScreen()),
                  child: Container(
                    height: 62,
                  width: double.infinity,
                  decoration: BoxDecoration(
                  border: Border.all(
                  color: Colors.grey[200]!,
                  width: 2
                  ),
                  ),
                    child:  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(
                        children: const [
                          Text('Address Manger',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600
                            ),),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                InkWell(
                  onTap: ()=>navigateTo(context: context, screen: MyOrderScreen()),
                  child: Container(
                    height: 62,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey[200]!,
                          width: 2
                      ),
                    ),
                    child:  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(
                        children: const [
                          Text('My Order',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600
                            ),),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                InkWell(
                  onTap: ()=>navigateTo(context: context, screen: NewestProductsScreen(name: 'My offers')),
                  child: Container(
                    height: 62,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey[200]!,
                          width: 2
                      ),
                    ),
                    child:  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(
                        children: const [
                          Text('My Offers',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600
                            ),),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                InkWell(
                onTap: ()=>navigateTo(context: context, screen: favorite()),
                  child: Container(
                    height: 62,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey[200]!,
                          width: 2
                      ),
                    ),
                    child:  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(
                        children: const [
                          Text('Wishlist',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600
                            ),),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                InkWell(
                  onTap: ()=>navigateTo(context: context, screen: CardList()),
                  child: Container(
                    height: 62,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey[200]!,
                          width: 2
                      ),
                    ),
                    child:  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(
                        children: const [
                          Text('quick pay Cards',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600
                            ),),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                InkWell(
                  onTap: ()=>navigateTo(context: context, screen: FaqScreen()),
                  child: Container(
                    height: 62,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey[200]!,
                          width: 2
                      ),
                    ),
                    child:  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(
                        children: const [
                          Text('Help Center',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600
                            ),),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: (){
                      navigateToAndDelete(screen: LoginScreen(), context: context);
                    },
                    child: const Text('SignOut',style: TextStyle(fontSize: 16),),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
