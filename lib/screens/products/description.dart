import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DescriptionScreen extends StatefulWidget {
  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  var firstNameController = TextEditingController();
bool chose=false;
bool chose2=false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('البرنامج ده نفخني مع انه سهل بس في تكات و انا مش فاضي معلش بقي علي التاخير بس الكلية كانت بتهظر شوية و عندي امتحان الاربعاء والله بس قلت كفاية كدة\nامضاء المنفوخ جيمي ',
              style: TextStyle(
              fontSize: 20,
            ),),
            SizedBox(height: 20,),
            Row(
              children: [
                Container(
                  width:100,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
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
                          hintText: 'PinCode',
                          border: InputBorder.none,
                        )
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey[200]!,
                        width: 2
                    ),
                  ),
                ),
                Container(
                  width:130,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey[200]!,
                        width: 2
                    ),
                  ),
                  child: MaterialButton(
                    onPressed: (){},
                    child: const Text('Check Availability'),
                  ),
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Delivvry by ,'),
                    SizedBox(height: 10,),
                    Text('25 June, monday',style: TextStyle(fontWeight: FontWeight.w600),),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20,),
            Text('Colors',style:TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
           SizedBox(height: 20,),
            Row(
              children:  [
                InkWell(
                  onTap: (){
                    setState(() {

                      chose=!chose;
                    });
                  },
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.red,
                    child: chose?Icon(Icons.check,color: Colors.white,):Text(''),
                  ),
                ),
                SizedBox(width: 20,),
                InkWell(
                  onTap: (){
                    setState(() {

                      chose=!chose;
                    });
                  },
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.blue,
                    child: chose?Text(''):Icon(Icons.check,color: Colors.white,),
                  ),
                ),
                SizedBox(width: 20,),
              ],
            ),
            SizedBox(height: 30,),
            Text('Size',style:TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
            SizedBox(height: 20,),
            Row(
              children:  [
                InkWell(
                  onTap: (){
                    setState(() {

                      chose2=!chose2;
                    });
                  },
                  child:  CircleAvatar(
                    radius: 15,
                    backgroundColor:chose2?Colors.blue:Colors.transparent,
                    child: Text('M',
                      style: TextStyle(
                          color: chose2?Colors.white:Colors.black,
                      ),
                    )
                  ),
                ),
                SizedBox(width: 20,),
                InkWell(
                  onTap: (){
                    setState(() {

                      chose2=!chose2;
                    });
                  },
                  child:  CircleAvatar(
                      radius: 15,
                      backgroundColor:chose2?Colors.transparent:Colors.blue,
                      child: Text('S',
                        style: TextStyle(
                          color: chose2?Colors.black:Colors.white,
                        ),
                      )
                  ),
                ),
                SizedBox(width: 20,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
