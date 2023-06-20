import 'package:flutter/material.dart';
import 'calendar.dart';

void main() {
  runApp(MyApp());
}

// 남 0xff1d1647 회 0xffb9b9b9 백 0xffeaeaea
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'calender',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: Calendar(),
        debugShowCheckedModeBanner: false);
  }
}
