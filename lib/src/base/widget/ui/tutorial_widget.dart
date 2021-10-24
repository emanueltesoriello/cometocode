import 'package:cometocode/resources/res.dart';
import 'package:flutter/material.dart';

class TutorialWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final List<Function> onPlaceHoldersPressed;
  final Function onSwipeLeft;
  final Function onSwipeRight;
  final int maxPlaceholders;
  final int currentPlaceholder;
  final Widget customWidget;

  TutorialWidget(
      this.imagePath,
      this.title,
      this.description,
      this.onPlaceHoldersPressed,
      this.maxPlaceholders,
      this.currentPlaceholder,
      this.onSwipeLeft,
      this.onSwipeRight,
      this.customWidget);

  Widget _placeHolders(int maxPlaceholders, int currentPlaceholder,
      List<Function> onEachPlaceholdersPress) {
    List<Widget> _placeHolder = [];
    for (int i = 0; i < maxPlaceholders; i++) {
      _placeHolder.add(i >= currentPlaceholder
          ? RawMaterialButton(
              onPressed: null,
              elevation: 2.0,
              constraints: BoxConstraints(minWidth: 25.0, minHeight: 25.0),
              shape: CircleBorder(
                  side: BorderSide(color: AppColors.primaryColor, width: 3)),
            )
          : RawMaterialButton(
              onPressed: () {
                onEachPlaceholdersPress[i]();
              },
              elevation: 2.0,
              constraints: BoxConstraints(minWidth: 25.0, minHeight: 25.0),
              fillColor: AppColors.primaryColor,
              shape: CircleBorder(),
            ));
    }
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _placeHolder);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onHorizontalDragEnd: (DragEndDetails details) {
          if (details.primaryVelocity! > 0) {
            onSwipeLeft();
          } else if (details.primaryVelocity! < 0) {
            onSwipeRight();
          }
        },
        child: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              Divider(
                color: Colors.transparent,
                height: Dimension.paddingM,
              ),
              customWidget != null
                  ? customWidget
                  : Column(
                      children: [
                        imagePath != null
                            ? Image.asset(
                                imagePath,
                                height:
                                    MediaQuery.of(context).size.height / 2.4,
                              )
                            : Placeholder(
                                fallbackHeight:
                                    MediaQuery.of(context).size.height / 2.4),
                        Divider(
                          color: Colors.transparent,
                          height: Dimension.paddingL,
                        ),
                        Text(
                          title, //localizations.welcomeStartPageMessage,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        Divider(
                          color: Colors.transparent,
                          height: Dimension.padding,
                        ),
                        Text(
                          description, //localizations.welcomeStartPageDescription,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: AppColors.gray),
                        ),
                      ],
                    ),
              Divider(
                color: Colors.transparent,
                height: Dimension.padding,
              ),
              if (customWidget == null) Spacer(),
              Container(
                width: 200,
                child: _placeHolders(
                  maxPlaceholders,
                  currentPlaceholder,
                  onPlaceHoldersPressed,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
