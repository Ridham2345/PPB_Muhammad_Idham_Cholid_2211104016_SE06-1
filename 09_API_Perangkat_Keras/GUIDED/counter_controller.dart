import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  var counter = 0.obs;

  void tambahCounter() => counter.value++;
  void resetCounter() => counter.value = 0;

  void increment() => counter.value++;
  void decrement() => counter.value--;

  void showSnackBar() {
    Get.snackbar(
      "Snackbar isi",
      "ini Snackbar ",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.blue,
      colorText: Colors.white,
      duration: Duration(seconds: 2),
    );
  }

  void showBottomSheet() {
    Get.bottomSheet(
      Container(
        height: 200,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Bottom Sheet'),
            ElevatedButton(
              onPressed: () => Get.back(),
              child: Text('tutup'),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
