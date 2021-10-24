import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cometocode/resources/app_localization.dart';
import 'package:cometocode/src/home_page/domain/home_page_repository.dart';
import 'package:cometocode/src/home_page/ui/model/home_page_navigation_state.dart';

part 'home_page_model_navigation.dart';

part 'home_page_view_model.dart';

mixin HomePageViewModelShared on ChangeNotifier {
  AppLocalizations? localizations;
  late HomePageRepository homePageRepository;
  late Function(String) showSnackBar;
  bool _showPageLoader = false;

  bool get showPageLoader => _showPageLoader;

  void update(
      HomePageRepository repository, AppLocalizations? newLocalizations) {
    homePageRepository = repository;
    localizations = newLocalizations;
  }

  exampleApiCall() {
    homePageRepository.exampleApi();
  }
}
