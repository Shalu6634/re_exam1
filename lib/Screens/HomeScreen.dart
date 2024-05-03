import 'package:flutter/material.dart';
import 'package:re_exam1/utils/List.dart';
import 'package:re_exam1/utils/global_var.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: GestureDetector(onTap: (){
              setState(() {
                cartList.add(index);
                Navigator.of(context).pushNamed('/cart');
              });
            },
                child: Icon(
              Icons.add_shopping_cart_outlined,
              size: 28,
              color: Colors.black,
            )),
          )
        ],
        backgroundColor: Colors.white,
        elevation: 8,
        title: Text(
          'HomePage',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: 360,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.black12,
                border: Border.all(color: Colors.black),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/img/s1.jpg'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 260),
              child: Text(
                'Shoes Bar',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),
            Wrap(
              children: [
                ...List.generate(
                  proList.length,
                  (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                        Navigator.of(context).pushNamed('/detail');
                      });
                    },
                    child: box1(
                      img: proList[index]['img'],
                      name: proList[index]['name'],
                      price: proList[index]['price'],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Container box1(
      {required String img, required int price, required String name}) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 200,
      width: 175,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black12, width: 3),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(img),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 130),
        child: Container(
          height: 100,
          width: 210,
          decoration: BoxDecoration(
              color: Colors.black12,
              border: Border.all(color: Colors.black54, width: 2)),
          child: Row(
            children: [
              Text(
                name,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 27),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  '${price}/-',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
