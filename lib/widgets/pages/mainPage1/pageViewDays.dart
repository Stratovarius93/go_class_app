part of 'mainPage1.dart';

class _PageViewDays extends StatelessWidget {
  const _PageViewDays({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeekDaysBloc, WeekDaysState>(
      builder: (context, state) {
        if (state.currentDay != null) {
          _pageController = PageController(initialPage: state.currentDay!);
          return Expanded(
            child: PageView.builder(
              physics: BouncingScrollPhysics(),
              controller: _pageController,
              onPageChanged: (int value) {
                BlocProvider.of<WeekDaysBloc>(context).add(EditDayState(value));
              },
              itemCount: state.daysList.length,
              itemBuilder: (context, index) {
                if (state.daysList[index].visible) {
                  //return Container(
                  //child: Center(
                  //child: Text('${state.daysList[index].name}',
                  //style: TextStyle(color: Colors.black)),
                  //),
                  //);
                  return ListSignaturesView(
                    day: state.daysList[index].name,
                  );
                } else {
                  return Container();
                }
              },
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
