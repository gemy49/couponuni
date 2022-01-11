import 'package:coupon/cubit/bloc.dart';
import 'package:coupon/cubit/cubit.dart';
import 'package:coupon/default.dart';
import 'package:coupon/model.dart';
import 'package:coupon/screens/cart/newaddress.dart';
import 'package:coupon/screens/cart/ordersummary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeAddressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CouponCubit,couponAppStates>(
      listener: (BuildContext context,couponAppStates state) {  },
      builder: (BuildContext context, couponAppStates state) {
        var cubit=CouponCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('Address Manger'),
            actions: [
              IconButton(onPressed: (){//navigateTo(context: context, screen: newaddreess());
                },
                icon: Icon(Icons.add),
              ),
            ],
          ),
          body:  ListView.separated(
            itemBuilder: (Context,index)=> AddressMAngerList(index,context),
            separatorBuilder:(context,index)=> SizedBox(height: 0,),
            itemCount: Address.length,
          ),
          bottomNavigationBar: BottomAppBar(
            child: Container(
                height: 60,
                color:Colors.blueAccent[700],
                child: MaterialButton(
                  onPressed: (){
                    navigateToAndDelete(screen: OrderSummaryScreen( Address[cubit.isCheck]['name'], Address[cubit.isCheck]['description'], Address[cubit.isCheck]['address'], Address[cubit.isCheck]['city'], Address[cubit.isCheck]['num']), context: context);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Save',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ],
                  ),
                )
            ),
          ),
        );
      },
    );
  }
}
Widget AddressMAngerList(index,context)=>Padding(
  padding: const EdgeInsets.all(15.0),
  child: InkWell(
    onTap: (){
        CouponCubit.get(context).isCheckState(index);
    },
    child: Container(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: RadioListTile<dynamic>(
                value: index,
                groupValue:  CouponCubit.get(context).isCheck,
                onChanged: (ind) =>  CouponCubit.get(context).isCheckState(ind),
              ),
            ),
            SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text('${Address[index]['name']}',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600
                  ),
                ),
                SizedBox(height:10,),
                SizedBox(height: 5,),
                Text('${Address[index]['description']}',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300
                  ),
                ),
                SizedBox(height: 5,),
                Text('${Address[index]['address']}',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300
                  ),
                ),
                SizedBox(height: 5,),
                Text('${Address[index]['city']}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 15,),
                Text('${Address[index]['num']}',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600
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
        color: Colors.grey[200],
        border: Border.all(
            color: Colors.grey[200]!,
            width: 2
        ),
      ),
    ),
  ),
);