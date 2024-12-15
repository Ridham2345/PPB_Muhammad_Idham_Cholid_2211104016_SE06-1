import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view_model/counter_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final CounterController controller = Get.put(CounterController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: Center(
        child: Obx(() => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Counter Value:'),
                Text(
                  controller.counter.value.toString(),
                  style: TextStyle(fontSize: 24),
                ),
              ],
            )),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => controller.tambahCounter(),
            child: Icon(Icons.layers),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => controller.resetCounter(),
            child: Icon(Icons.refresh),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () =>
                Get.toNamed('/detail_page'), // Pastikan sesuai routing
            child: Icon(Icons.details),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => controller.showSnackBar(),
            child: Icon(Icons.message),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => controller.showBottomSheet(),
            child: Icon(Icons.layers),
          ),
        ],
      ),
    );
  }
}
