part of 'home_page_view_model_shared.dart';

mixin HomePageViewModelNavigation on HomePageViewModelShared {
  HomePageNavigationState _homeNavigationState =
      HomePageNavigationState.baseHomePage;
  HomePageNavigationState get homeNavigationState => _homeNavigationState;

  set homeNavigationState(HomePageNavigationState newState) {
    _homeNavigationState = newState;
    notifyListeners();
  }
}
