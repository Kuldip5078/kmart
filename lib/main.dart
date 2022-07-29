import 'package:flutter/material.dart';
import 'package:kmart/new.dart';
import 'package:kmart/slider.dart';

import 'homescreen.dart';
import 'inpute_using_form.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: debugDisableShadows,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const OtherWidget(),
      home: Cart_List(),
          // home:const MySlider(),
    );
  }
}

