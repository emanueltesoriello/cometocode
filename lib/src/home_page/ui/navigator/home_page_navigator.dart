import 'package:flutter/material.dart';
import 'package:cometocode/src/base/widget/ui/navigator_pop_scope.dart';
import 'package:cometocode/src/home_page/di/home_page_providers.dart';
import 'package:cometocode/src/home_page/ui/model/home_page_navigation_state.dart';
import 'package:cometocode/src/home_page/ui/pages/home_page.dart';
import 'package:cometocode/src/home_page/ui/viewmodel/home_page_view_model_main.dart';
import 'package:provider/provider.dart';

final _homePageNavigationKey = GlobalKey<NavigatorState>();

class HomePageNavigator extends StatefulWidget {
  final Function onMainPop;

  const HomePageNavigator({required this.onMainPop});

  @override
  _HomePageNavigatorState createState() => _HomePageNavigatorState();
}

class _HomePageNavigatorState extends State<HomePageNavigator> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: homePageProviders,
      child: Consumer<HomePageViewModelMain>(
        builder: (_, viewModel, __) {
          return NavigatorPopScope(
            navigatorStateKey: _homePageNavigationKey,
            pages: [
              MaterialPage(
                child: HomePage(viewModel: viewModel, onPop: widget.onMainPop),
              ),
            ],
            onPopPage: (route, result) {
              viewModel.homeNavigationState =
                  HomePageNavigationState.baseHomePage;
              return false;
            },
          );
        },
      ),
    );
  }
}
