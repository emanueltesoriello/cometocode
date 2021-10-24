import 'package:flutter/material.dart';

class NavigatorPopScope extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorStateKey;
  final List<Page> pages;
  final PopPageCallback onPopPage;

  NavigatorPopScope({
    required this.navigatorStateKey,
    this.pages = const <Page<dynamic>>[],
    required this.onPopPage,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Navigator(
        key: navigatorStateKey,
        pages: pages,
        onPopPage: onPopPage,
      ),
      onWillPop: () async => !await navigatorStateKey.currentState!.maybePop(),
    );
  }
}
