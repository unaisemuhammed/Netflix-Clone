import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'netflix_screen/home_page.dart';
import 'netflix_screen/list.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
