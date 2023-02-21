import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app_pro/di/providers.dart';
import 'package:test_app_pro/view/home_screen.dart';

void main() => runApp(MultiProvider(
      providers: globalProvides,
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "テスト1",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: HomeScreen(),
    );
  }
}
