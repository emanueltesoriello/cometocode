import 'package:cometocode/resources/app_localization.dart';
import 'package:cometocode/resources/res.dart';
import 'package:cometocode/src/start/ui/viewmodel/start_page_view_model_main.dart';
import 'package:flutter/material.dart';
import 'package:cometocode/src/base/dtx/app_localization_extension.dart';

class GoHomeBtn extends StatelessWidget {
  final StartPageViewModelMain viewModel;

  const GoHomeBtn(this.viewModel, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AppLocalizations? localizations = context.getAppLocalizations();
    return Padding(
      padding: EdgeInsets.all(
        Dimension.padding,
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: ElevatedButton(
          onPressed: () => viewModel.goToHomePage(),
          child: Text(localizations!.goToHomeBtn),
        ),
      ),
    );
  }
}
