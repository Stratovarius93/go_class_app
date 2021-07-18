import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_class_app/bloc/CRUDsignature/CRUDsignature_bloc.dart';
import 'package:go_class_app/bloc/name/name_bloc.dart';
import 'package:go_class_app/bloc/roomClass/classroom_bloc.dart';
import 'package:go_class_app/bloc/schedule/schedule_bloc.dart';
import 'package:go_class_app/bloc/signatures/signatures_bloc.dart';
import 'package:go_class_app/bloc/teachers/teachers_bloc.dart';
import 'package:go_class_app/bloc/weekDays/weekDays_bloc.dart';
import 'package:go_class_app/models/classroom/room_model.dart';
import 'package:go_class_app/models/itemSchedule/itemSchedule_model.dart';
import 'package:go_class_app/models/signature/signature_model.dart';
import 'package:go_class_app/models/teacher/teacher_model.dart';
import 'package:go_class_app/widgets/constants/colors.dart';
import 'package:go_class_app/widgets/constants/screenSize.dart';
import 'package:go_class_app/widgets/constants/shadows.dart';
import 'package:go_class_app/widgets/generics/CRUDviews/classroom/editClassroom.dart';
import 'package:go_class_app/widgets/generics/CRUDviews/schedule/editSchedule.dart';
import 'package:go_class_app/widgets/generics/CRUDviews/schedule/removeSchedule.dart';
import 'package:go_class_app/widgets/generics/addNewItem.dart';
import 'package:go_class_app/widgets/generics/background.dart';
import 'package:go_class_app/widgets/generics/card.dart';
import 'package:go_class_app/widgets/generics/category.dart';
import 'package:go_class_app/widgets/generics/popMenuItem/popMenuItem.dart';
import 'package:go_class_app/widgets/generics/popMenuItem/popMenuItemModel.dart';
import 'package:go_class_app/widgets/generics/snackBar.dart';
import 'package:go_class_app/widgets/generics/subtitle.dart';
import 'package:go_class_app/widgets/generics/title.dart';
import 'package:go_class_app/widgets/utils/classroomUtils.dart';
import 'package:go_class_app/widgets/utils/fontTextStyle.dart';
import 'package:go_class_app/widgets/utils/signatureUtils.dart';
import 'package:go_class_app/widgets/utils/teacherUtils.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:math' as math;

part 'listSignatures.dart';
part 'daysWeek.dart';
part 'dayButton.dart';
part 'pageViewDays.dart';

PageController? _pageController;
BuildContext? _context;
ScrollController? _scrollController;
//new ScrollController(initialScrollOffset: 1.0);

class MainPage1 extends StatefulWidget {
  final BuildContext? contextRoute;

  const MainPage1({Key? key, this.contextRoute}) : super(key: key);
  @override
  _MainPage1State createState() => _MainPage1State();
}

class _MainPage1State extends State<MainPage1> {
  @override
  void initState() {
    super.initState();
    _context = widget.contextRoute;
    BlocProvider.of<NameBloc>(context).add(LoadName());
    BlocProvider.of<ScheduleBloc>(context).add(LoadSchedule());
    BlocProvider.of<WeekDaysBloc>(context).add(CurrentDay(context));
  }

  @override
  void dispose() {
    //BlocProvider.of<WeekDaysBloc>(context).add(UpdateWeekDaysStore());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<WeekDaysBloc>(context).add(CurrentDay(context));
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarIconBrightness:
              Theme.of(context).appBarTheme.brightness,
          statusBarBrightness: Theme.of(context).appBarTheme.brightness,
          statusBarIconBrightness: Theme.of(context).appBarTheme.brightness),
      child: AnimatedTheme(
        duration: Duration(milliseconds: 500),
        data: Theme.of(context),
        curve: Curves.easeInOutExpo,
        child: Stack(children: [
          (Theme.of(context).scaffoldBackgroundColor ==
                  AppColorLight.scaffoldBackground)
              ? Background(
                  colorTopRight1:
                      AppColorLight.listSchedule[2]!.withOpacity(0.2),
                  colorTopRight2:
                      AppColorLight.listSchedule[2]!.withOpacity(0.3),
                  colorBottomLeft1:
                      Theme.of(context).primaryColor.withOpacity(0.2),
                  colorBottomLeft2:
                      Theme.of(context).primaryColor.withOpacity(0.3),
                )
              : Background(
                  colorTopRight1:
                      AppColorLight.listSchedule[3]!.withOpacity(0.2),
                  colorTopRight2:
                      AppColorLight.listSchedule[3]!.withOpacity(0.2),
                  colorBottomLeft1:
                      AppColorLight.listSchedule[3]!.withOpacity(0.2),
                  colorBottomLeft2:
                      AppColorLight.listSchedule[3]!.withOpacity(0.2),
                ),
          _MainPage()
        ]),
      ),
    );
  }
}

class _MainPage extends StatelessWidget {
  const _MainPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NameBloc, NameState>(
      builder: (context, state) => Scaffold(
        //backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: GenericTitle(
                  title:
                      '${AppLocalizations.of(context)!.mainPage1_hello}, ${state.name}',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 0, bottom: 4),
                child: GenericSubtitle(
                  title: '${AppLocalizations.of(context)!.mainPage1_class}',
                ),
              ),
              _DaysWeekTop(),
              _PageViewDays(),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
