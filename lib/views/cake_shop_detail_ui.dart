// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, must_be_immutable, sort_child_properties_last
 
import 'package:flutter/material.dart';
import 'package:flutter_cake_shop_project/model/cake_shop.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
 
class CakeShopDetailUi extends StatefulWidget {
  // สร้างตัวแปรมารับค่าข้อมูลร้านที่จะส่งมาจากหน้า ShopList
  final CakeShop shop;
 
  //เอาตัวแปรที่สร้างมารับค่าที่จะส่งมาจากหน้า ShopList
  CakeShopDetailUi({super.key, required this.shop});
 
  @override
  State<CakeShopDetailUi> createState() => _CakeShopDetailUiState();
}
 
class _CakeShopDetailUiState extends State<CakeShopDetailUi> {
  // เมธอดโทร
  Future<void> _makePhoneCall(String phoneNumber) async {
    final launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber.replaceAll(RegExp(r'\s+'), ''),
    );
    await launchUrl(launchUri);
  }
 
  // เมธอดเปิดแอป เช่น Browser, Google Map, Facebook, Instagram, TikTok, ...
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ส่วนของ appBar
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
          onPressed: () {
            // ย้อนกลับไปหน้าก่อนหน้า
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        title: Text(
          widget.shop.name!,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      // ส่วนของ body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 50,
            bottom: 50,
            left: 45,
            right: 45,
          ),
          child: Center(
            child: Column(
              children: [
                // แสดงรูปที่ 1 ของแต่ละร้าน
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    widget.shop.image1!,
                    width: MediaQuery.of(context).size.width * 0.3,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // แสดงรูปที่ 2 และ 3 ของแต่ละร้านในแนวนอน
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        widget.shop.image2!,
                        width: MediaQuery.of(context).size.width * 0.3,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        widget.shop.image3!,
                        width: MediaQuery.of(context).size.width * 0.3,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                // แสดงชื่อร้าน
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ชื่อร้าน 🏪',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.shop.name!,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                // แสดงเวลาเปิดปิด
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'เวลาเปิดปิด 🕒',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.shop.openCloseTime!,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                // แสดงรายละเอียดของร้าน
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'รายละเอียดของร้าน 📋',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.shop.description!,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                // แสดงรายละเอียดของร้าน
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ที่อยู่ของร้าน📍',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.shop.address!,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                // แสดงปุ่มเบอร์โทร และให้โทรได้
                ElevatedButton(
                  onPressed: () {
                    // เรียกใช้งานเมธอดโทร
                    _makePhoneCall(widget.shop.phone!);
                  },
                  child: Text(
                    // widget.cakeShop!.phone!,
                    '📞  ${widget.shop.phone!}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(
                      MediaQuery.of(context).size.width * 0.45,
                      50.5,
                    ),
                    backgroundColor: Colors.green,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                // แสดงเว็บไซต์ แล้วเปิดเว็บได้
                ListTile(
                  onTap: () {
                    _launchInBrowser(
                      Uri.parse(widget.shop.website!),
                    );
                  },
                  leading: FaIcon(
                    FontAwesomeIcons.globe,
                    color: Colors.amber,
                    size: 30,
                  ),
                  trailing: Icon(
                    Icons.link,
                  ),
                  title: Text(
                    widget.shop.website!,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // แสดงfacebook แล้วเปิด facebook ได้
                ListTile(
                  onTap: () {
                    _launchInBrowser(
                      Uri.parse(widget.shop.facebook!),
                    );
                  },
                  leading: FaIcon(
                    FontAwesomeIcons.facebook,
                    color: const Color.fromARGB(255, 17, 81, 178),
                    size: 30,
                  ),
                  trailing: Icon(
                    Icons.link,
                  ),
                  title: Text(
                    widget.shop.facebook!,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                // แสดงแผนที่ และ Marker แล้วเปิด Google Map ได้
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: FlutterMap(
                    // กำหนดตำแหน่ง lat/lng และระยะ zoom ของแผนที่
                    options: MapOptions(
                      initialCenter: LatLng(
                        double.parse(widget.shop.latitude!),
                        double.parse(widget.shop.longitude!),
                      ),
                      initialZoom: 15.0,
                    ),
                    // กำหนด เลเยอร์ที่จะแสดงบนแผนที่ ประกอบด้วย แผนที่และ Marker
                    children: [
                      // แผนที่
                      TileLayer(
                        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.sau.flutter_cake_shop_project',
                      ),
                      // Marker
                      MarkerLayer(
                        markers: [
                          Marker(
                            point: LatLng(
                              double.parse(widget.shop.latitude!),
                              double.parse(widget.shop.longitude!),
                            ),
                            width: 50,
                            height: 50,
                            child: GestureDetector(
                              onTap: (){
                                //เปิด Google Map
                                _launchInBrowser(
                                  Uri.parse(
                                    'https://www.google.com/maps/@${widget.shop.latitude},${widget.shop.longitude},15.55z',
                                  ),
                                );
                              },
                              child: FaIcon(
                                FontAwesomeIcons.locationDot,
                                color: Colors.red,
                                size: 50,
                              ),
                            ),
                          ),
                        ],
                      ),
                      RichAttributionWidget(
                        attributions: [
                          TextSourceAttribution(
                            'OpenStreetMap contributors',
                            onTap: () {
                              _launchInBrowser(
                                Uri.parse('https://www.openstreetmap.org/copyright'),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
 