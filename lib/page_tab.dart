import 'package:flutter/material.dart';

class PageTab<T extends Widget> {
  Widget get tabIcon => null;
  Widget get tabChild => null;
  T get tabContent => this as T;
}
