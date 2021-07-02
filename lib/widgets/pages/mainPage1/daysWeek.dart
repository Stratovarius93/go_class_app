part of 'mainPage1.dart';

class _DaysWeekTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                name: state.daysList[index].name,
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
