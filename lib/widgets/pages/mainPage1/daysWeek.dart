part of 'mainPage1.dart';

class _DaysWeekTop extends StatefulWidget {
  @override
  __DaysWeekTopState createState() => __DaysWeekTopState();
}

class __DaysWeekTopState extends State<_DaysWeekTop> {
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
      _scrollController = ScrollController();
      if (state.daysList.length > 0) {
        if (state.currentDay != null && state.daysList.length >= 4) {
          print('Days: ${state.currentDay}');
          WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
            if (_scrollController!.hasClients) {
              double _scrollLength =
                  _scrollController!.position.maxScrollExtent;
              double _partScrollLength =
                  _scrollLength / (state.daysList.length - 1);

              if (state.currentDay == 0) {
                _scrollController!.animateTo(
                  _scrollController!.position.minScrollExtent,
                  curve: Curves.easeOut,
                  duration: const Duration(milliseconds: 300),
                );
              } else if (state.currentDay == (state.daysList.length - 1)) {
                _scrollController!.animateTo(
                  _scrollController!.position.maxScrollExtent,
                  curve: Curves.easeOut,
                  duration: const Duration(milliseconds: 300),
                );
              } else {
                _scrollController!.animateTo(
                  (_partScrollLength * state.currentDay!),
                  curve: Curves.easeOut,
                  duration: const Duration(milliseconds: 300),
                );
              }
            }
          });
        }
        return Container(
          height: 60,
          child: ListView(
            controller: _scrollController,
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
                        duration: Duration(milliseconds: 500),
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
