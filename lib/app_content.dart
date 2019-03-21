import 'package:flutter/material.dart';

import 'page_tab.dart';

import 'nekos_life/nekos_life_page.dart';

class AppContent extends StatefulWidget {
  AppContent({Key key}) : super(key: key);

  @override
  AppContentState createState() => AppContentState();
}

class AppContentState extends State<AppContent> with TickerProviderStateMixin {
  final pages = <PageTab>[
    new NekosLifePage(),
  ];

  TabController pageTabController;

  @override
  void initState() {
    super.initState();
    pageTabController = TabController(
      vsync: this,
      length: pages.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: pages[pageTabController.index].tabTitle,
        bottom: TabBar(
          controller: pageTabController,
          tabs: pages.map((PageTab page) => 
            Tab(
              icon: page.tabIcon,
              child: page.tabTitle,
            )
          ).toList(),
        ),
      ),
      body: TabBarView(
        controller: pageTabController,
        children: pages.map((PageTab page) => page.tabContent).toList(),
      ),
    );
  }
}