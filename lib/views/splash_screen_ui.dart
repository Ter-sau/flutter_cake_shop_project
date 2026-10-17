// ignore_for_file: unused_import, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_cake_shop_project/views/cake_shop_detail_ui.dart';
import 'package:flutter_cake_shop_project/views/cake_shop_list_ui.dart';

class SplashScreenUi extends StatefulWidget {
  const SplashScreenUi({super.key});

  @override
  State<SplashScreenUi> createState() => _SplashScreenUiState();
}

class _SplashScreenUiState extends State<SplashScreenUi> {
  
//คำสั่งใดที่เขียนใน initState() จะทำงานตอนหน้าจอเปิด
  @override
  void initState() {
    Future.delayed(
      // เวลาหน่วง
      Duration(
        seconds: 3,
      ),
      // ครบเวลาหน่วงแล้วจะให้ทำอะไรก็ว่ากันไป
      (){
        //เปิดไปหน้าจอ CakeShopListUI() แบบย้อนกลับไม่ได้
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => CakeShopListUi(),
          ),
        );
      },
    );
 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/bg_welcome.png'
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Text(
                  'สายด่วนกินเค้ก',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.045,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'CAKE CALL FAST',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.025,
                    color: const Color.fromARGB(255, 255, 152, 145),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.09,
                ),
                CircularProgressIndicator(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}