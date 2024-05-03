
import 'package:flutter/material.dart';

import 'package:re_exam1/utils/global_var.dart';

import '../utils/List.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 4,
        title: Text(
          'CartScreen',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...List.generate(
              cartList.length,
              (index) => GestureDetector(
                onTap: () {},
                child: box2(
                    img: proList[index]['img'],
                    price: proList[selectedIndex]['price'],
                    index: index,
                    name: proList[selectedIndex]['name'],),
              ),
            ),
            Container(
              margin: EdgeInsets.all(40),
              height: 80,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(40)
              ),
              child: Center(child: GestureDetector(onTap: (){
                setState(() {
                  for(int i=0; i<cartList.length; i++)
                    {
                      qty=(qty+cartList[i]['qty'].toInt());
                      amount=amount+cartList[i]['price']*cartList[i]['qty'];
                    }
                  total = (total*10)/amount;
                  Navigator.of(context).pushNamed('/check');
                });
              },child: Text('CheckOut',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),)),),
            ),
          ],
        ),
      ),
    );
  }
  Column box2(
      {required String img,
      required int price,
      required int index,
      required String name}) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              margin: EdgeInsets.all(30),
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage(img),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 140),
                child: Container(
                  height: 200,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          name,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 110, top: 20),
                        child: Text(
                          '${price}/-',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            cartList.removeAt(selectedIndex);
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30,left: 10),
                          child: Icon(Icons.delete),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
