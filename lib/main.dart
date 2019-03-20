import 'package:flutter/material.dart';

import 'app_content.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Neko Viewer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AppContent(),
    );
  } 
}