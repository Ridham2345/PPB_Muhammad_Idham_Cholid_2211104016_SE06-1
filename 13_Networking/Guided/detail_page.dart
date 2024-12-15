import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Detail Page', style: TextStyle(fontSize: 24)),
            ElevatedButton(
              onPressed: () => Get.back(),
              child: Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}
