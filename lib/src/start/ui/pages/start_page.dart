import 'package:cometocode/resources/app_localization.dart';
import 'package:cometocode/resources/res.dart';
import 'package:cometocode/src/start/ui/viewmodel/start_page_view_model_main.dart';
import 'package:cometocode/src/start/ui/widget/go_home_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cometocode/src/base/dtx/app_localization_extension.dart';

import 'package:provider/provider.dart';

class StartPage extends StatelessWidget {
  final StartPageViewModelMain viewModel;
  StartPage(this.viewModel);

  @override
  Widget build(BuildContext context) {
    AppLocalizations? localizations = context.getAppLocalizations();
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Container(
        child: Scaffold(
          body: Builder(
            builder: (context) {
              Provider.of<StartPageViewModelMain>(
                context,
                listen: false,
              ).showSnackBarInStartPage =
                  (message) => _showSnackbar(context, message);
              return Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: Dimension.padding,
                        right: Dimension.padding,
                        bottom: Dimension.padding),
                    child: Column(
                      children: [
                        SafeArea(
                          child: Container(
                            height: AppBar().preferredSize.height,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                /*Image.asset(
                                  ImageSrc.logo,
                                  height: 40,
                                ),*/
                              ],
                            ),
                          ),
                        ),
                        Placeholder(),
                        Divider(
                          color: Colors.transparent,
                          height: Dimension.paddingM,
                        ),
                        Divider(
                          color: Colors.transparent,
                          height: Dimension.paddingM,
                        ),
                        SizedBox(height: Dimension.padding)
                      ],
                    ),
                  ),
                  GoHomeBtn(viewModel)
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

void _showSnackbar(BuildContext context, String message) {
  if (message != null && message.isNotEmpty) {
    SnackBar snackBar =
        SnackBar(content: Text(message), behavior: SnackBarBehavior.floating);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
