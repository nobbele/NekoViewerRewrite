import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AppPage(),
    );
  } 
}

class AppPage extends StatefulWidget {
  AppPage({Key key}) : super(key: key);

  @override
  AppPageState createState() => AppPageState();
}

class AppPageState extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Hello World"),
    );
  }
}
