import 'package:flutter/material.dart';

class AppConfig extends InheritedWidget {
  final String host;
  final String env;
  final Widget child;

  AppConfig({required this.host, required this.env, required this.child})
      : super(child: child);

  static AppConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
