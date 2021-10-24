import 'package:cometocode/resources/res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyAppTheme {
  static ThemeData themeData(BuildContext context) {
    final textFormFieldBorder = UnderlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(Dimension.paddingS),
      ),
      borderSide: BorderSide(
        width: 0,
        color: Colors.transparent,
        style: BorderStyle.none,
      ),
    );
    final fontFamily = 'Nunito';

    return ThemeData(
      pageTransitionsTheme: PageTransitionsTheme(builders: {
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      }),
      brightness: Brightness.light,
      primaryColor: AppColors.primaryColor,
      accentColor: AppColors.primaryColor,
      backgroundColor: AppColors.backgroundColor,
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
        backgroundColor: AppColors.backgroundColor,
        side: BorderSide(color: AppColors.primaryColor),
        minimumSize: Size(
          double.infinity,
          Dimension.minButtonHeight,
        ),
      )),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: Theme.of(context).primaryTextTheme.button!.copyWith(
                decoration: TextDecoration.underline,
              ),
          minimumSize: Size(
            double.infinity,
            Dimension.minButtonHeight,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: Theme.of(context)
              .primaryTextTheme
              .button!
              .copyWith(fontFamily: fontFamily, fontSize: Dimension.fontSizeS),
          backgroundColor: AppColors.primaryColor,
          minimumSize: Size(
            double.infinity,
            Dimension.minButtonHeight,
          ),
        ),
      ),
      fontFamily: fontFamily,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: AppBarTheme(
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        color: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: IconTheme.of(context).copyWith(
          color: AppColors.primaryColor,
        ),
      ),
      textTheme: Theme.of(context)
          .primaryTextTheme
          .apply(
            fontFamily: fontFamily,
            bodyColor: AppColors.primaryTextColor,
            displayColor: AppColors.primaryTextColor,
          )
          .copyWith(
            button: Theme.of(context).primaryTextTheme.button!.copyWith(
                  fontFamily: fontFamily,
                  fontSize: Dimension.fontSize,
                  fontWeight: FontWeight.w600,
                ),
          ),
      inputDecorationTheme: Theme.of(context).inputDecorationTheme.copyWith(
            labelStyle: Theme.of(context).primaryTextTheme.bodyText2!.copyWith(
                  fontFamily: fontFamily,
                  color: AppColors.placeholderColor,
                ),
            filled: true,
            fillColor: AppColors.lightlue,
            focusedErrorBorder: textFormFieldBorder,
            errorBorder: textFormFieldBorder,
            focusedBorder: textFormFieldBorder,
            enabledBorder: textFormFieldBorder,
          ),
    );
  }
}
