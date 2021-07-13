import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_class_app/bloc/name/name_bloc.dart';
import 'package:go_class_app/bloc/schedule/schedule_bloc.dart';
import 'package:go_class_app/bloc/weekDays/weekDays_bloc.dart';
import 'package:go_class_app/data/store/daysWeek_store.dart';
import 'package:go_class_app/widgets/generics/card.dart';
import 'package:go_class_app/widgets/generics/cardSubtitle.dart';
import 'package:go_class_app/widgets/generics/cardTitle.dart';
import 'package:go_class_app/widgets/generics/category.dart';
import 'package:go_class_app/widgets/generics/grouped_buttons/src/checkbox_group.dart';
import 'package:go_class_app/widgets/generics/input.dart';
import 'package:go_class_app/widgets/generics/snackBar.dart';
import 'package:go_class_app/widgets/generics/title.dart';
import 'package:go_class_app/widgets/utils/fontTextStyle.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'homeName.dart';

//bool? _switchListTileValue;
late List<String> _categories;
late List<Widget> _categoriesWidget;

class MainPage4 extends StatefulWidget {
  final BuildContext? contextRoute;

  const MainPage4({Key? key, this.contextRoute}) : super(key: key);

  @override
  _MainPage4State createState() => _MainPage4State();
}

class _MainPage4State extends State<MainPage4> {
  @override
  Widget build(BuildContext context) {
    const double _betweenSpace = 24.0;
    const double _betweenSpaceCardCategory = 6.0;
    const double _paddingSubtitleLR = 16.0;
    const double _paddingCardLR = 10.0;
    _categoriesWidget = [
      _appeareance(context, widget.contextRoute),
      //_notifications(context, (value) {
      //setState(() {
      //_switchListTileValue = value;
      //});
      //}),
      _NameHome(),
      _weekDays(context),
    ];
    _categories = [
      '${AppLocalizations.of(context)!.mainPage4_appearance}',
      //'Notificaciones',
      '${AppLocalizations.of(context)!.mainPage4_homeName}',
      '${AppLocalizations.of(context)!.mainPage4_weekDays}'
    ];
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Theme.of(context).brightness,
          statusBarIconBrightness: Theme.of(context).brightness),
      child: AnimatedTheme(
        duration: Duration(milliseconds: 500),
        data: Theme.of(context),
        curve: Curves.easeInOutExpo,
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: SafeArea(
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: GenericTitle(
                    title: '${AppLocalizations.of(context)!.mainPage4_title}',
                  ),
                ),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _categories.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: _paddingSubtitleLR,
                                      right: _paddingSubtitleLR,
                                      top: 0,
                                      bottom: _betweenSpaceCardCategory),
                                  child: GenericCategory(
                                    title: _categories[index],
                                  )),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: _paddingCardLR),
                                child: GenericCard2(
                                  child: _categoriesWidget[index],
                                ),
                              ),
                              SizedBox(
                                height: _betweenSpace,
                              ),
                            ]),
                      );
                    }),
                BlocBuilder<ScheduleBloc, ScheduleState>(
                  builder: (context, state) => Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {
                              int _count = 0;
                              for (var i = 0, len = state.scheduleList.length;
                                  i < len;
                                  ++i) {
                                if (state
                                    .scheduleList[i].scheduleList.isEmpty) {
                                  _count++;
                                }
                              }
                              if (_count == state.scheduleList.length) {
                                SnackBar _snackBar = GenericSnackBar(
                                        context: context,
                                        content: 'El horario está vacío')
                                    .snackBar();
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(_snackBar);
                              } else {
                                BlocProvider.of<ScheduleBloc>(context)
                                    .add(RemoveScheduleList());
                                SnackBar _snackBar = GenericSnackBar(
                                        context: context,
                                        content: 'Se eliminó el horario')
                                    .snackBar();
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(_snackBar);
                              }
                            },
                            child: Text(
                              '${AppLocalizations.of(context)!.mainPage4_removeSchedule}',
                              style: AppFont.font(TextStyle(
                                  fontSize: 17,
                                  color: Theme.of(context)
                                      .bottomNavigationBarTheme
                                      .selectedItemColor)),
                            )),
                        IconButton(
                            icon: Icon(
                              Ionicons.trash_sharp,
                              color: Theme.of(context).primaryColor,
                            ),
                            onPressed: () {
                              int _count = 0;
                              for (var i = 0, len = state.scheduleList.length;
                                  i < len;
                                  ++i) {
                                if (state
                                    .scheduleList[i].scheduleList.isEmpty) {
                                  _count++;
                                }
                              }
                              if (_count == state.scheduleList.length) {
                                SnackBar _snackBar = GenericSnackBar(
                                        context: context,
                                        content:
                                            '${AppLocalizations.of(context)!.snackBar_cleanSchedule1}')
                                    .snackBar();
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(_snackBar);
                              } else {
                                BlocProvider.of<ScheduleBloc>(context)
                                    .add(RemoveScheduleList());
                                SnackBar _snackBar = GenericSnackBar(
                                        context: context,
                                        content:
                                            '${AppLocalizations.of(context)!.snackBar_cleanSchedule2}')
                                    .snackBar();
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(_snackBar);
                              }
                            })
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: Text(
                    'GoClass v1.0',
                    style: AppFont.font(TextStyle(
                        color: Theme.of(context).textTheme.headline2!.color)),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _appeareance(BuildContext context, BuildContext? contextRoute) {
  return ListTile(
    onTap: () {
      Navigator.pushNamed(
        contextRoute!,
        'mainPage4Appearance',
      );
    },
    title: Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GenericCardTitle(
        title: '${AppLocalizations.of(context)!.appearancePage_title}',
      ),
    ),
    subtitle: GenericCardSubtitle(title: AdaptiveTheme.of(context).mode.name),
  );
}

//Widget _notifications(BuildContext context, Function(bool) onChanged) {
//return SwitchListTile(
//activeColor: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
//value: _switchListTileValue ?? true,
//onChanged: onChanged,
//title: Text(
//'Notificaciones',
//style: AppFont.font(
//TextStyle(color: Theme.of(context).textTheme.headline3!.color)),
//),
//subtitle: Text(
//'Activa/Desactiva las notificaciones',
//style: AppFont.font(
//TextStyle(color: Theme.of(context).textTheme.headline2!.color)),
//),
//);
//}

Widget _weekDays(BuildContext context) {
  List<String> weekDaysName = [
    AppLocalizations.of(context)!.mainPage1_day1,
    AppLocalizations.of(context)!.mainPage1_day2,
    AppLocalizations.of(context)!.mainPage1_day3,
    AppLocalizations.of(context)!.mainPage1_day4,
    AppLocalizations.of(context)!.mainPage1_day5,
    AppLocalizations.of(context)!.mainPage1_day6,
    AppLocalizations.of(context)!.mainPage1_day7,
  ];
  return BlocBuilder<WeekDaysBloc, WeekDaysState>(
    builder: (BuildContext context, state) {
      List<String>? _list;
      _list = state.daysList.map((e) {
        if (e.visible) {
          return weekDaysName[e.name];
        }
        return '';
      }).toList();
      return CheckboxGroup(
        onChange: (visible, dayName, position) {
          print('$visible , $dayName, $position');
          BlocProvider.of<WeekDaysBloc>(context)
              .add(EditDayVisible(visible, position));
          BlocProvider.of<ScheduleBloc>(context)
              .add(EditScheduleVisible(visible, position));

          BlocProvider.of<WeekDaysBloc>(context).add(UpdateWeekDaysStore());
        },
        checked: _list,
        activeColor: Theme.of(context).primaryColor,
        labelStyle: AppFont.font(
            TextStyle(color: Theme.of(context).textTheme.headline3!.color)),
        labels: weekList.map((e) => weekDaysName[e.name]).toList(),
      );
    },
  );
}
