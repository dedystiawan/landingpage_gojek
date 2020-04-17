import 'package:flutter/material.dart';
import 'package:landing_page/launcher/launcher_view.dart';
import 'package:landing_page/constant.dart';
import 'package:flutter/services.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UTY',
      theme: new ThemeData(
        fontFamily: 'NeoSans',
        primaryColor: UtyPalette.green,
        accentColor: UtyPalette.green,

      ),
      home: new LauncherPage(),
    );
  }
}