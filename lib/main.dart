import 'package:flutter/material.dart';

import 'package:get/get.dart';

import './views/home_screen.dart';
import './controllers/cat_controller.dart';
import './controllers/dog_controller.dart';
import './controllers/drawer_controller.dart';


void main() {
  Get.put(DrawController());
  Get.put(CatController());
  Get.put(DogController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dokatsu',
        theme: ThemeData(
          primaryColor: Colors.blue[700],
        ),
        home: SafeArea(child: HomeScreen()));
  }
}
