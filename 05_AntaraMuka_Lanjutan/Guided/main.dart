import 'package:flutter/material.dart';
import 'package:listview_bulider/custom_scrol_view.dart';
// import 'package:listview_bulider/flexible_expanded.dart';
// import 'listview_separated.dart';
// import 'listview_bulider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const FlexibleExpandedScreen(title: 'Flexible & Expanded'),
      home: const CustomScrolViewExample(),
    );
  }
}
