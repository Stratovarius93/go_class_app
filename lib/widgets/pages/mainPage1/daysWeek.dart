part of 'mainPage1.dart';

class _DaysWeekTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeekDaysBloc, WeekDaysState>(
        builder: (BuildContext context, state) {
      return Container(
        height: 60,
        child: ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            if (state.daysList[index].visible) {
              return _DayButton(
                name: state.daysList[index].name,
                enable: state.daysList[index].enable,
                onTap: () {
                  BlocProvider.of<WeekDaysBloc>(context)
                      .add(EditDayState(index));
                  _pageController!.animateToPage(index,
                      duration: Duration(milliseconds: 1000),
                      curve: Curves.easeOut);
                },
              );
            } else {
              return Container();
            }
          },
          itemCount: state.daysList.length,
        ),
      );
    });
  }
}
