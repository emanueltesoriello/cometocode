import 'dart:async';

import 'package:cometocode/resources/app_localization.dart';
import 'package:cometocode/src/start/domain/model/start_page_user_response_domain_model.dart';
import 'package:cometocode/src/start/domain/start_page_repository.dart';
import 'package:cometocode/src/start/ui/model/start_page_navigator_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

part 'start_page_view_model_navigation.dart';

part 'start_page_view_model_first_page.dart';

part 'start_page_view_model_second_page.dart';

mixin StartPageViewModelShared on ChangeNotifier {
  // ignore: unused_field
  late AppLocalizations? _appLocalizations;
  late Function(String) showSnackBarInLoginPage;
  late Function(String) showSnackBarInStartPage;
  late Function(String) showSnackBar;
  late StartPageRepository startPageRepository;

  StartPageUserResponseDomainModel _selectedUserModel =
      StartPageUserResponseDomainModel();

  StartPageUserResponseDomainModel get selectedUserModel => _selectedUserModel;
  set selectedUserModel(StartPageUserResponseDomainModel newUser) {
    _selectedUserModel = newUser;
    notifyListeners();
  }

  late int usersDropDownValue;

  List<StartPageUserResponseDomainModel> _listOfUsers = [];

  List<StartPageUserResponseDomainModel> get listOfUsers => _listOfUsers;

  set listOfUsers(List<StartPageUserResponseDomainModel> newListOfUsers) {
    listOfUsers = newListOfUsers;
    notifyListeners();
  }

  update(
    BuildContext context,
    StartPageRepository repository,
    AppLocalizations? localizations,
  ) async {
    this._appLocalizations = localizations;
    startPageRepository = repository;
  }

  StartPageNavigationState _navigationState =
      StartPageNavigationState.startPage;

  StartPageNavigationState get navigationState => _navigationState;

  set navigationState(StartPageNavigationState state) {
    _navigationState = state;
    notifyListeners();
  }
}
