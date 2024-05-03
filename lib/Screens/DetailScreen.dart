
import 'package:flutter/material.dart';

import 'package:re_exam1/utils/List.dart';
import 'package:re_exam1/utils/global_var.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 7,
        title: Text(
          'DetailScreen',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            height: 200,
            width: 350,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black12),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(proList[selectedIndex]['img']),
                        ),
                      ),
                    ),
                    Text(
                      proList[index]['price'].toString() + '/-',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 100),
                      child: Text(
                        proList[index]['name'],
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Text('⭐⭐⭐⭐⭐..'),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Text(
                proList[selectedIndex]['des'].toString(),
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
          GestureDetector(onTap: () {
            setState(() {
              cartList.add(proList[selectedIndex]);
              bool status=false;
              int index=0;
              for(int i=0;i<cartList.length;i++)
              {
                if(cartList[i]['name']==proList[selectedIndex]['name'])
                {
                  index=i;
                  status=true;
                }
              }
              if(status)
              {
                cartList[index]['qty']++;
              }
            });
          },
            child: Container(
              margin: EdgeInsets.all(70),
              height: 80,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 3),
                  borderRadius: BorderRadius.circular(40)),
              child: Center(
                child: Text(
                  'Add to Cart',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),),
            ),
          )
        ],
      ),
    );
  }
}
