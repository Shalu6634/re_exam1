import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/global_var.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Padding(
          padding: const EdgeInsets.only(bottom: 190),
          child: GestureDetector(onTap: (){
            setState(() {
              Navigator.of(context).pushNamed('/check');
            });
          },child: Text('ChecKOut',style: TextStyle(fontWeight: FontWeight.bold),)),
        ),
      ),
      body: Container(
        height: 200,
        width: 350,
        margin: EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Colors.black12
        ),
        child: Row(
          children: [
            Column(
              children: [
                Text('Total qty   = $qty',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
                Text('  Gst          = 10%',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25)),
                Text('Amount = $amount',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
