import 'package:flutter/material.dart';
import 'view/my_home_page.dart';
import 'view/detail_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Counter App',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomePage(title: 'Counter App')),
        GetPage(name: '/detail_page', page: () => DetailPage()),
      ],
      home: HomePage(title: 'Counter App'),
    );
  }
}
