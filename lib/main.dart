import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spacex_app/controllers/slider_controller.dart';
import 'package:spacex_app/views/home_page.dart';

void main() {
  Get.lazyPut(() => SliderController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
