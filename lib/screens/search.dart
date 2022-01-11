import 'package:coupon/default.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  var   searchController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
     body: Padding(
       padding: const EdgeInsets.all(20.0),
       child: defaultFormField(
         label: 'search',
         prefix: Icons.search,
         controller: searchController,
        ),
     ),
    );
  }
}
