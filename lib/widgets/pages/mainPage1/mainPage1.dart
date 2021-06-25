import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_class_app/bloc/CRUDsignature/CRUDsignature_bloc.dart';
import 'package:go_class_app/bloc/name/name_bloc.dart';
import 'package:go_class_app/bloc/schedule/schedule_bloc.dart';
import 'package:go_class_app/bloc/weekDays/weekDays_bloc.dart';
import 'package:go_class_app/data/daysWeek_data.dart';
import 'package:go_class_app/models/itemSchedule_model.dart';
import 'package:go_class_app/models/room_model.dart';
import 'package:go_class_app/widgets/constants/colors.dart';
import 'package:go_class_app/widgets/constants/shadows.dart';
import 'package:go_class_app/widgets/generics/CRUDviews/editSchedule.dart';
import 'package:go_class_app/widgets/generics/background.dart';
import 'package:go_class_app/widgets/generics/card.dart';
import 'package:go_class_app/widgets/generics/popMenuItem/popMenuItem.dart';
import 'package:go_class_app/widgets/generics/popMenuItem/popMenuItemModel.dart';
import 'package:go_class_app/widgets/generics/snackBar.dart';
import 'package:go_class_app/widgets/generics/subtitle.dart';
import 'package:go_class_app/widgets/generics/title.dart';
import 'package:go_class_app/widgets/utils/fontTextStyle.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/url_launcher.dart';

part 'listSignatures.dart';
part 'daysWeek.dart';
part 'dayButton.dart';
part 'pageViewDays.dart';

PageController? _pageController;
BuildContext? _context;

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
    BlocProvider.of<WeekDaysBloc>(context).add(CurrentDay());
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<WeekDaysBloc>(context).add(CurrentDay());
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarIconBrightness: Theme.of(context).brightness,
          statusBarBrightness: Theme.of(context).brightness,
          statusBarIconBrightness: Theme.of(context).brightness),
      child: AnimatedTheme(
        duration: Duration(milliseconds: 500),
        data: Theme.of(context),
        curve: Curves.easeInOutExpo,
        child: Stack(children: [
          (Theme.of(context).scaffoldBackgroundColor ==
                  AppColorLight.scaffoldBackground)
              ? Background(
                  colorTopRight1: Color(0xFFC6D8D3).withOpacity(0.8),
                  colorTopRight2: Color(0xFFC6D8D3),
                  //colorBottomLeft1: Color(0xFFFBB5A4).withOpacity(0.8),
                  //colorBottomLeft2: Color(0xFFFBB5A4),
                  colorBottomLeft1: Colors.orangeAccent.withOpacity(0.4),
                  colorBottomLeft2: Colors.orange.withOpacity(0.3),
                )
              : Container(),
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
                  title: 'Hola, ${state.name}',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 0, bottom: 4),
                child: GenericSubtitle(
                  title: 'Tu clase de hoy',
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