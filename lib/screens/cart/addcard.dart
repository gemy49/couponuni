import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class AddCardScreen extends StatefulWidget {
  const AddCardScreen({Key? key}) : super(key: key);

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  var valueChoseMonthe;
  var valueChoseyear;

  List itemyear=[
    '2021',
    '2022',
    '2023',
    '2024',
    '2025',
    '2026',
    '2027',
    '2028',
    '2029',
    '2030',
    '2031',
  ];List itemMonth=[
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Card ',
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Card Number ',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Column(
                  children: [
                    const Text('Month  ',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey[500]!,
                                width: 1
                            ),
                            borderRadius: BorderRadius.circular(5)
                        ),
                        height: 50,
                        width: 130,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: DropdownButton(
                            underline: SizedBox(),
                            elevation: 0,
                            isExpanded: true,
                            hint: const Text('Month'),
                            value:valueChoseMonthe,
                            onChanged: (value){
                              setState(() {
                                valueChoseMonthe=value;
                              });
                            },
                            items: itemMonth.map((e) {
                              return DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              );
                            }).toList(),
                          ),
                        )
                    ),
                  ],
                ),
               Spacer(),
                Column(
                  children: [
                    const Text('year  ',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey[500]!,
                            width: 1
                        ),
                        borderRadius: BorderRadius.circular(5)
                      ),
                      height: 50,
                      width: 130,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: DropdownButton(
                          underline: SizedBox(),
                          elevation: 0,
                          isExpanded: true,
                          hint: const Text('year'),
                          value:valueChoseyear,
                          onChanged: (value){
                            setState(() {
                              valueChoseyear=value;
                            });
                          },
                          items: itemyear.map((e) {
                            return DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            );
                          }).toList(),
                        ),
                      )
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 20,),
            const Text('CVV  ',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20,),
            const Text('Card Holder Name  ',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 50,),
            Container(
              width: double.infinity,
              height: 45,
              child: MaterialButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: const Text('Add card ',
                  style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w900
                  ),
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.blue[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
