import 'dart:async';
import 'package:flutter/material.dart';

import '../page_tab.dart';

import 'endpoints.dart';
import 'nekos_life.dart';

class NekosLifePage extends StatefulWidget with PageTab {
  @override
  Widget get tabTitle => Text("Nekos Life");

  @override
  Widget get tabIcon => Icon(Icons.book);

  NekosLifePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new NekosLifePageState();
}

class NekosLifePageState extends State<NekosLifePage> {

  String selectedTag;

  Widget loadingWidget() {
    return Align(
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    );
  }

  Widget buildImageItem(Image image) {
    return image;
  }

  Widget buildImage() {
    return FutureBuilder<Image>(
      future: NekosLife.getImage(selectedTag),
      builder: (BuildContext context, AsyncSnapshot<Image> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return buildImageItem(snapshot.data);
          } else if (snapshot.hasError) {
            return Card(
              child: Text(
                '${snapshot.error}',
                style: TextStyle(color: Colors.red),
              ),
            );
          }
        } else {
          return Container();
        }
      },
    );
  }

  Widget buildImageList() {
    return PageView.builder(
      controller: imagePageController,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int i) => Stack(
        children: [
          Center(child: loadingWidget()),
          Center(child: buildImage()),
        ],
      ),
    );
  }

  PageController imagePageController;

  @override
  void initState() {
    super.initState();
    imagePageController = PageController(
      keepPage: true,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: DropdownButton<String>(
            items: NekosLifeEndpoints.getAvailableTags().map((String tag) {
              return DropdownMenuItem(
                value: tag,
                child: Text(tag),
              );
            }).toList(),
            onChanged: (String tag) {
              setState(() {
              selectedTag = tag; 
              });
            },
            hint: Text("Choose a Tag"),
            value: selectedTag,
          ),
        ),
      ),
      body: (selectedTag != null) 
              ? buildImageList() 
              : Container(),
    );
  }
}

class KeepAliveFutureBuilder<T> extends StatefulWidget {

  final Future<T> future;
  final AsyncWidgetBuilder<T> builder;

  KeepAliveFutureBuilder({
    this.future,
    this.builder
  });

  @override
  KeepAliveFutureBuilderState<T> createState() => KeepAliveFutureBuilderState<T>();
}

class KeepAliveFutureBuilderState<T> extends State<KeepAliveFutureBuilder<T>> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: widget.future,
      builder: widget.builder,
    );
  }

  @override
  bool get wantKeepAlive => true;
}