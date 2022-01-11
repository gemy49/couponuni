import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
class ReviewsScreen extends StatelessWidget {
 final img;
 ReviewsScreen(this.img);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
              CircleAvatar(
                backgroundColor: Colors.grey[300],
                radius: 60,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('3.0 ',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.italic,
                              fontSize: 22,

                            ),
                          ),
                          Icon(Icons.star,color: Colors.amber,size: 22,)
                        ],
                      ),
                    ),
                    Text('6 Review ',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 18,

                      ),
                    ),
                  ],
                ),
              ),
                Spacer(),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        Text('5 ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.italic,
                            fontSize: 22,

                          ),
                        ),
                        Icon(Icons.star,color: Colors.amber,size: 22,),
                        LinearPercentIndicator(
                          width: 140.0,
                          lineHeight: 14.0,
                          percent: 0.4,
                          backgroundColor: Colors.grey,
                          progressColor: Colors.green,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        Text('4 ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.italic,
                            fontSize: 22,

                          ),
                        ),
                        Icon(Icons.star,color: Colors.amber,size: 22,),
                        LinearPercentIndicator(
                          width: 140.0,
                          lineHeight: 14.0,
                          percent: 0.3,
                          backgroundColor: Colors.grey,
                          progressColor: Colors.green,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        Text('3 ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.italic,
                            fontSize: 22,

                          ),
                        ),
                        Icon(Icons.star,color: Colors.amber,size: 22,),
                        LinearPercentIndicator(
                          width: 140.0,
                          lineHeight: 14.0,
                          percent: 0.6,
                          backgroundColor: Colors.grey,
                          progressColor: Colors.orangeAccent,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        Text('2 ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.italic,
                            fontSize: 22,

                          ),
                        ),
                        Icon(Icons.star,color: Colors.amber,size: 22,),
                        LinearPercentIndicator(
                          width: 140.0,
                          lineHeight: 14.0,
                          percent: 0.3,
                          backgroundColor: Colors.grey,
                          progressColor: Colors.yellow,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        Text('1 ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.italic,
                            fontSize: 22,

                          ),
                        ),
                        Icon(Icons.star,color: Colors.amber,size: 22,),
                        LinearPercentIndicator(
                          width: 140.0,
                          lineHeight: 14.0,
                          percent: 0.2,
                          backgroundColor: Colors.grey,
                          progressColor: Colors.red,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height:20),
            Row(
              children: [
                const Text('Reviews',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.italic,
                    fontSize: 18,
                  ),
                ),
                const Spacer(),
                Container(
                  width: 100,
                  height: 35,
                  child: MaterialButton(
                    onPressed: (){},
                    child:  Text('Rate Now ',
                      style: TextStyle(
                        color: Colors.blue[800],
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic,
                        fontSize: 15,

                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.blue[800]!,
                        width: 2
                    ),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ],
            ),
            ListView.separated(
              shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context,index)=>Rev(img),
                separatorBuilder:(context,index)=>SizedBox(),
                itemCount: 2,
            )
          ],
        ),
      ),
    );
  }
}
Widget Rev(img)=>Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 60,
            height: 30,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('3.0 ',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.italic,
                      fontSize: 15,

                    ),
                  ),
                  Icon(Icons.star,color: Colors.white,size: 20,)
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ),
        SizedBox(width: 10,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('Marting James',style: TextStyle(fontSize: 18),),
              SizedBox(height: 10,),
              Text('Nice Product',style: TextStyle(fontSize: 16),),
            ],
          ),
        )
      ],
    ),
    SizedBox(height: 20,),
    SizedBox(
        width:150,
        height: 150,
        child: Image(image: NetworkImage('$img'))),
    SizedBox(height: 15,),
    Row(
      children: [
        CircleAvatar(
          radius: 15,
          backgroundColor: Colors.green,
          child: Icon(Icons.check,color: Colors.white,),
        ),
        SizedBox(width: 10,),
        Text('Verified Buyer',style: TextStyle(fontSize: 18),),
        Spacer(),
        Text('26 June 2019',style: TextStyle(fontSize: 16),),

      ],
    )
  ],
);