part of 'start_page_view_model_shared.dart';

mixin StartPageViewModelNavigation on StartPageViewModelShared {
  goToHomePage() {
    print('goToHomePage');
    navigationState = StartPageNavigationState.homePage;
  }
}
