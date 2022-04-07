import 'package:flutter/material.dart';
import 'package:flutter_mvp_demo/presenter/presenter.dart';
import 'package:flutter_mvp_demo/view/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter MVP Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(
        BasicCounterPresenter(),
        title: 'Flutter MVP Demo',
      ),
    );
  }
}
