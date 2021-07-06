import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_class_app/bloc/CRUDsignature/CRUDsignature_bloc.dart';
import 'package:go_class_app/bloc/name/name_bloc.dart';
import 'package:go_class_app/bloc/roomClass/classroom_bloc.dart';
import 'package:go_class_app/bloc/schedule/schedule_bloc.dart';
import 'package:go_class_app/bloc/signatures/signatures_bloc.dart';
import 'package:go_class_app/bloc/teachers/teachers_bloc.dart';
import 'package:go_class_app/bloc/weekDays/weekDays_bloc.dart';
import 'package:go_class_app/data/db.dart';
import 'package:go_class_app/widgets/generics/CRUDviews/addRoomClass.dart';
import 'package:go_class_app/widgets/generics/CRUDviews/addSchedule/addSchedule.dart';
import 'package:go_class_app/widgets/generics/CRUDviews/addTeacher.dart';
import 'package:go_class_app/widgets/pages/homePage2.dart';
import 'package:go_class_app/widgets/pages/mainIndex.dart';
import 'package:go_class_app/widgets/pages/mainPage1/mainPage1.dart';
import 'package:go_class_app/widgets/pages/mainPage2/mainPage2.dart';
import 'package:go_class_app/widgets/pages/mainPage3/mainPage3.dart';
import 'package:go_class_app/widgets/pages/mainPage4/appearance.dart';
import 'package:go_class_app/widgets/pages/mainPage4/mainPage4.dart';
import 'package:go_class_app/widgets/theme/theme.dart';

import 'data/store/mainState_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DB.instance.init();
  await MainStateStore.instance.init();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(AppState(
    savedThemeMode: savedThemeMode,
  ));
}

class AppState extends StatefulWidget {
  final AdaptiveThemeMode? savedThemeMode;

  const AppState({Key? key, this.savedThemeMode}) : super(key: key);

  @override
  _AppStateState createState() => _AppStateState();
}

class _AppStateState extends State<AppState> {
  @override
  void dispose() {
    DB.instance.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiBlocProvider(
      providers: [
        BlocProvider<NameBloc>(create: (_) => NameBloc()),
        BlocProvider<WeekDaysBloc>(create: (_) => WeekDaysBloc()),
        BlocProvider<SignaturesBloc>(create: (_) => SignaturesBloc()),
        BlocProvider<ClassroomBloc>(create: (_) => ClassroomBloc()),
        BlocProvider<TeacherBloc>(create: (_) => TeacherBloc()),
        BlocProvider<ScheduleBloc>(create: (_) => ScheduleBloc()),
        BlocProvider<CRUDsignatureBloc>(create: (_) => CRUDsignatureBloc()),
      ],
      child: ThemeController(
        savedThemeMode: widget.savedThemeMode,
      ),
    );
  }
}

class ThemeController extends StatefulWidget {
  final AdaptiveThemeMode? savedThemeMode;

  const ThemeController({Key? key, this.savedThemeMode}) : super(key: key);
  @override
  _ThemeControllerState createState() => _ThemeControllerState();
}

class _ThemeControllerState extends State<ThemeController> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return AdaptiveTheme(
        light: lightThemeData(context),
        dark: darkThemeData(context),
        //initial: AdaptiveThemeMode.system,
        initial: widget.savedThemeMode ?? AdaptiveThemeMode.light,
        builder: (theme, darkTheme) => MaterialApp(
              localizationsDelegates: GlobalMaterialLocalizations.delegates,
              supportedLocales: [
                const Locale('es', 'ES'), // American English
                // ...
              ],
              debugShowCheckedModeBanner: false,
              theme: theme,
              darkTheme: darkTheme,
              title: 'MyApp',
              initialRoute: (MainStateStore.instance.mainState)
                  ? 'mainIndex'
                  : 'homePage2',
              routes: {
                'mainIndex': (BuildContext context) => MainIndex(),
                'mainPage1': (BuildContext context) => MainPage1(),
                'mainPage2': (BuildContext context) => MainPage2(),
                'mainPage3': (BuildContext context) => MainPage3(),
                'mainPage4': (BuildContext context) => MainPage4(),
                'mainPage2CreateRoom': (BuildContext context) =>
                    AddClassroomPage(),
                'mainPage3CreateTeacher': (BuildContext context) =>
                    AddTeacherPage(),
                'mainPage1AddSchedule': (BuildContext context) =>
                    AddSchedulePage(),
                'mainPage4Appearance': (BuildContext context) =>
                    MainPage4Appearance(),
                'homePage2': (BuildContext context) => HomePage2(),
              },
            ));
  }
}
