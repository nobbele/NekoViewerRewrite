import 'package:flutter/material.dart';

import '../page_tab.dart';

class NekosLifePage extends StatefulWidget with PageTab {
  @override
  Widget get tabChild => Text("Hello World");

  @override
  Widget get tabIcon => Icon(Icons.copyright);

  NekosLifePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new NekosLifePageState();
}

class NekosLifePageState extends State<NekosLifePage> {
  @override
  Widget build(BuildContext context) {
    return Text("Test Tab");
  }
}