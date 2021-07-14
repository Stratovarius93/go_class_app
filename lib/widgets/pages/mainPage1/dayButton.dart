part of 'mainPage1.dart';

class _DayButton extends StatefulWidget {
  final bool? enable;
  final String? name;
  final VoidCallback? onTap;
  const _DayButton({
    Key? key,
    this.enable,
    this.name,
    this.onTap,
  }) : super(key: key);

  @override
  __DayButtonState createState() => __DayButtonState();
}

class __DayButtonState extends State<_DayButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 7, right: 7),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          margin: EdgeInsets.symmetric(vertical: 8),
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                widget.enable!
                    ? shadowDayButton(Theme.of(context).primaryColor)
                    : noneShadow
              ],
              color: widget.enable!
                  ? Theme.of(context).primaryColor
                  : Colors.orange.withOpacity(0),
              border: widget.enable!
                  ? Border.all(
                      width: 0, color: Color(0xFF609696).withOpacity(0))
                  : Border.all(
                      width: 2, color: Color(0xFF609696).withOpacity(0.5))),
          duration: Duration(milliseconds: 300),
          child: Center(
            child: Text(
              widget.name!,
              style: AppFont.font(TextStyle(
                  fontSize: 17,
                  color: widget.enable! ? Colors.white : Color(0xFF609696))),
            ),
          ),
        ),
      ),
    );
  }
}
