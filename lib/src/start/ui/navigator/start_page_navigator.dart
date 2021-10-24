import 'package:cometocode/src/base/widget/ui/navigator_pop_scope.dart';
import 'package:cometocode/src/home_page/ui/navigator/home_page_navigator.dart';
import 'package:cometocode/src/start/ui/model/start_page_navigator_state.dart';
import 'package:cometocode/src/start/ui/pages/splash_screen_page.dart';
import 'package:cometocode/src/start/ui/viewmodel/start_page_view_model_main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/start_page.dart';

final _startPageNavigationKey = GlobalKey<NavigatorState>();

class StartPageNavigator extends StatelessWidget {
  StartPageNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<StartPageViewModelMain>(
      builder: (context, viewModel, child) {
        return NavigatorPopScope(
          navigatorStateKey: _startPageNavigationKey,
          pages: [
            if (viewModel.navigationState != StartPageNavigationState.homePage)
              MaterialPage(
                key: ValueKey('StartPage'),
                child: StartPage(viewModel),
              ),
            if (viewModel.navigationState == StartPageNavigationState.homePage)
              MaterialPage(
                key: ValueKey('HomePage'),
                child: HomePageNavigator(
                  onMainPop: () => viewModel.navigationState =
                      StartPageNavigationState.startPage,
                ),
              ),
            if (viewModel.navigationState ==
                StartPageNavigationState.splashScreen)
              MaterialPage(
                key: ValueKey('SplashScreenPage'),
                child: SplashScreenPage(),
              ),
          ],
          onPopPage: (route, result) {
            viewModel.navigationState = StartPageNavigationState.startPage;
            return false;
          },
        );
      },
    );
  }
}
