import 'package:cometocode/resources/res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cometocode/src/home_page/ui/viewmodel/home_page_view_model_main.dart';
import 'package:cometocode/src/base/dtx/app_localization_extension.dart';

class HomePage extends StatefulWidget {
  final HomePageViewModelMain viewModel;
  final Function onPop;

  const HomePage({required this.viewModel, required this.onPop});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _showSnackbar(BuildContext context, String message) {
    if (message.isNotEmpty) {
      SnackBar snackBar =
          SnackBar(content: Text(message), behavior: SnackBarBehavior.floating);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = context.getAppLocalizations();
    widget.viewModel.showSnackBar =
        (message) => _showSnackbar(context, message);
    return WillPopScope(
      onWillPop: () => Future.value(), //widget.onPop),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => widget.onPop(),
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              localizations!.appTitle,
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: AppColors.primaryTextColor),
            ),
            Text(
              localizations.description,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: AppColors.accentColor),
            ),
          ],
        ),
      ),
    );
  }
}
