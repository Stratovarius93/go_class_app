part of 'mainPage1.dart';

class _DaysWeekTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      if (state.daysList.length > 0) {
        return Container(
          height: 60,
          child: ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: state.daysList.map((e) {
              int index = state.daysList.indexOf(e);
              return _DayButton(
                name: weekDaysName[state.daysList[index].name],
                enable: state.daysList[index].enable,
                onTap: () {
                  BlocProvider.of<WeekDaysBloc>(context)
                      .add(EditDayState(index));
                  if (state.currentDay != null) {
                    _pageController!.animateToPage(index,
                        duration: Duration(milliseconds: 1000),
                        curve: Curves.easeOut);
                  }
                },
              );
            }).toList(),
          ),
        );
      } else {
        return Container();
      }
    });
  }
}
