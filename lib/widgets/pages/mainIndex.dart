import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_class_app/widgets/constants/screenSize.dart';
import 'package:go_class_app/widgets/pages/mainPage1/mainPage1.dart';
import 'package:go_class_app/widgets/pages/mainPage2/mainPage2.dart';
import 'package:go_class_app/widgets/pages/mainPage3/mainPage3.dart';
import 'package:go_class_app/widgets/pages/mainPage4/mainPage4.dart';
import 'package:go_class_app/widgets/utils/fontTextStyle.dart';
import 'package:ionicons/ionicons.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//PersistentTabController _controller;

class MainIndex extends StatefulWidget {
  @override
  _MainIndexState createState() => _MainIndexState();
}

class _MainIndexState extends State<MainIndex> {
  var _controller = PersistentTabController(initialIndex: 0);
  double _iconSize = 24;
  List<Widget> _tabs = [];
  List<ElementItemIcon> _elementItemIconList = [];

  @override
  Widget build(BuildContext context) {
    _tabs = [
      MainPage1(
        contextRoute: context,
      ),
      MainPage2(
        contextRoute: context,
      ),
      MainPage3(
        contextRoute: context,
      ),
      MainPage4(
        contextRoute: context,
      )
    ];
    _elementItemIconList = [
      ElementItemIcon(Ionicons.calendar_outline,
          AppLocalizations.of(context)!.bottomNavigation_1),
      ElementItemIcon(Ionicons.list_outline,
          AppLocalizations.of(context)!.bottomNavigation_2),
      ElementItemIcon(Ionicons.person_outline,
          AppLocalizations.of(context)!.bottomNavigation_3),
      ElementItemIcon(Ionicons.cog_outline,
          AppLocalizations.of(context)!.bottomNavigation_4),
    ];
    _iconSize = screenWidth(context) * 0.065;
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarIconBrightness:
              Theme.of(context).appBarTheme.brightness,
          systemNavigationBarColor:
              Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          systemNavigationBarDividerColor: Colors.transparent,
          statusBarBrightness: Theme.of(context).appBarTheme.brightness,
          statusBarIconBrightness: Theme.of(context).appBarTheme.brightness),
      child: Scaffold(
        body: PersistentTabView(
          context,
          controller: _controller,
          screens: _tabs,
          items: _elementItemIconList
              .map((e) => PersistentBottomNavBarItem(
                  textStyle: AppFont.font(
                      TextStyle(fontSize: screenWidth(context) * 0.038)),
                  iconSize: _iconSize,
                  icon: Icon(e.iconData),
                  title: e.name,
                  activeColorPrimary: Theme.of(context)
                      .bottomNavigationBarTheme
                      .selectedItemColor!,
                  inactiveColorPrimary: Theme.of(context)
                      .bottomNavigationBarTheme
                      .unselectedItemColor))
              .toList(),
          confineInSafeArea: true,
          backgroundColor:
              Theme.of(context).bottomNavigationBarTheme.backgroundColor!,
          handleAndroidBackButtonPress: true, // Default is true.
          resizeToAvoidBottomInset:
              true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
          stateManagement: true, // Default is true.
          hideNavigationBarWhenKeyboardShows:
              true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(20),
            colorBehindNavBar:
                Theme.of(context).bottomNavigationBarTheme.backgroundColor!,
          ),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: ItemAnimationProperties(
            // Navigation Bar's items animation properties.
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: ScreenTransitionAnimation(
            // Screen transition animation on change of selected tab.
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle
              .style1, // Choose the nav bar style with this property.
        ),
      ),
    );
  }
}

class ElementItemIcon {
  IconData iconData;
  String name;
  ElementItemIcon(this.iconData, this.name);
}
