import 'package:coupon/default.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class profileScreen extends StatefulWidget {
  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  var firstNameController=TextEditingController();

  var lastNameController=TextEditingController();

  var emailController=TextEditingController();

 var valueChose;

  List item=[
    'Male',
    'Female',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: const [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/profile.png'),
                  ),
                  CircleAvatar(
                    radius: 17,
                    backgroundColor:  Colors.red,
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Container(
                    width:150,
                    height: 40,
                    child: TextFormField(
                      validator: (value){
                        if(value!.isEmpty){
                          return 'pleas enter the name';
                        }
                        return null;
                      },
                      keyboardType:TextInputType.name ,
                      controller: firstNameController,
                      decoration: InputDecoration(
                        label: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Firs name'),
                        ),
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(
                            color: Colors.grey[300]!,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(
                            color: Colors.grey[300]!,
                            width: 1.0,
                          ),
                        ),
                    ),
                  ),
                  ),
                  Spacer(),
                  Container(
                    width:150,
                    height: 40,
                    child: TextFormField(
                      validator: (value){
                        if(value!.isEmpty){
                          return 'pleas enter the name';
                        }
                        return null;
                      },
                      keyboardType:TextInputType.name ,
                      controller:lastNameController,
                      decoration: InputDecoration(
                          label: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Last name'),
                          ),
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: Colors.grey[300]!,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: Colors.grey[300]!,
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Container(
                width:double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey[300]!,
                      width: 1,
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: DropdownButton(
                    underline: SizedBox(),
                    elevation: 0,
                    isExpanded: true,
                    hint: const Text('select gender'),
                    value:valueChose,
                    onChanged: (value){
                      setState(() {
                        valueChose=value;
                      });
                      },
                    items: item.map((e) {
                      return DropdownMenuItem(
                        value: e,
                          child: Text(e),
                      );
                    }).toList(),
                  )
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width:double.infinity,
                height: 50,
                child: TextFormField(
                  validator: (value){
                    if(value!.isEmpty){
                      return 'pleas enter the name';
                    }
                    return null;
                  },
                  keyboardType:TextInputType.name ,
                  controller: emailController,
                  decoration: InputDecoration(
                      label: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Email'),
                      ),
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Colors.grey[300]!,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Colors.grey[300]!,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: (){
                    },
                    child: const Text('Save profile',
                      style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.italic,
                        fontSize: 18,
                    ),
                  ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blue[800],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: (){
                    },
                    child:  Text('change password ',
                    style: TextStyle(
                      color: Colors.blue[800],
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.italic,
                      fontSize: 18,

                    ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue[800]!,
                      width: 2
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ],
          ),
      ),
    );
  }
}
