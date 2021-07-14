part of 'mainPage1.dart';

class _PageViewDays extends StatefulWidget {
  const _PageViewDays({
    Key? key,
  }) : super(key: key);

  @override
  __PageViewDaysState createState() => __PageViewDaysState();
}

class __PageViewDaysState extends State<_PageViewDays> {
  @override
  void initState() {
    BlocProvider.of<WeekDaysBloc>(context).add(LoadDays());
    BlocProvider.of<ScheduleBloc>(context).add(LoadSchedule());
    BlocProvider.of<SignaturesBloc>(context).add(LoadSignature());
    BlocProvider.of<TeacherBloc>(context).add(LoadTeacherList());
    BlocProvider.of<ClassroomBloc>(context).add(Loadclassroom());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignaturesBloc, SignaturesState>(
      builder: (context, stateSignature) =>
          BlocBuilder<TeacherBloc, TeacherState>(
        builder: (context, stateTeacher) =>
            BlocBuilder<ClassroomBloc, ClassroomState>(
          builder: (context, stateClassroom) => BlocBuilder<ScheduleBloc,
                  ScheduleState>(
              builder: (context, stateSchedule) =>
                  BlocBuilder<WeekDaysBloc, WeekDaysState>(
                    builder: (context, state) {
                      //if (state.daysList.length > 0) {
                      if (stateSchedule.scheduleList.length > 0) {
                        if (state.currentDay != null) {
                          _pageController =
                              PageController(initialPage: state.currentDay!);
                          return Expanded(
                            child: PageView.builder(
                              physics: BouncingScrollPhysics(),
                              controller: _pageController,
                              onPageChanged: (int value) {
                                BlocProvider.of<WeekDaysBloc>(context)
                                    .add(EditDayState(value));
                                print('Moviendo: $value');
                                //_scrollController.animateTo(
                                //1.0,
                                //curve: Curves.easeOut,
                                //duration: const Duration(milliseconds: 300),
                                //);
                              },
                              itemCount: state.daysList.length,
                              itemBuilder: (context, index) {
                                return ListSignaturesView(
                                  pos: index,
                                  listItemScheduleModel: stateSchedule
                                      .scheduleList[index].scheduleList,
                                  listTeacher: stateTeacher.listTeachers,
                                  listClassroom: stateClassroom.listclassroom,
                                  listSignatures: stateSignature.listSignatures,
                                );
                              },
                            ),
                          );
                        } else {
                          return _NoClassWidget();
                        }
                      } else {
                        return _NoDayWidget();
                      }
                    },
                  )),
        ),
      ),
    );
  }
}

class _NoClassWidget extends StatelessWidget {
  const _NoClassWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CircleAvatar(
            backgroundColor: Color(0xFFc5dce8).withOpacity(0.5),
            radius: 66,
            child: CircleAvatar(
              backgroundColor: Color(0xFFc5dce8),
              radius: 33,
              child: Icon(
                Ionicons.calendar_outline,
                color: Color(0xFF59656e),
                size: 44,
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Center(
              child: Text(
                '${AppLocalizations.of(context)!.mainPage1_selectDay}',
                textAlign: TextAlign.center,
                style: AppFont.font(TextStyle(
                    color: Color(0xFF59656e),
                    fontSize: 20,
                    fontWeight: FontWeight.w300)),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class _NoDayWidget extends StatelessWidget {
  const _NoDayWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CircleAvatar(
            backgroundColor: Color(0xFFc5dce8).withOpacity(0.5),
            radius: 66,
            child: CircleAvatar(
              backgroundColor: Color(0xFFc5dce8),
              radius: 33,
              child: Icon(
                Ionicons.search_outline,
                color: Color(0xFF59656e),
                size: 44,
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                  text:
                      '${AppLocalizations.of(context)!.mainPage1_selectDaySettings}',
                  style: AppFont.font(TextStyle(
                      color: Color(0xFF59656e),
                      fontSize: 20,
                      fontWeight: FontWeight.w300)),
                ),
                TextSpan(
                  text: '${AppLocalizations.of(context)!.bottomNavigation_4}',
                  style: AppFont.font(TextStyle(
                      color: Color(0xFF59656e),
                      fontSize: 20,
                      fontWeight: FontWeight.w600)),
                ),
                TextSpan(
                  text: '.',
                  style: AppFont.font(TextStyle(
                      color: Color(0xFF59656e),
                      fontSize: 20,
                      fontWeight: FontWeight.w300)),
                ),
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}
