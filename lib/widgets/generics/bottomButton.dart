import 'package:flutter/material.dart';
import 'package:go_class_app/widgets/constants/screenSize.dart';
import 'package:go_class_app/widgets/utils/fontTextStyle.dart';
import 'package:ionicons/ionicons.dart';

class GenericBottomButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const GenericBottomButton(
      {Key? key, required this.title, required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Theme.of(context).primaryColor.withOpacity(0.5);
      }
      return Theme.of(context).primaryColor.withOpacity(0.2);
    }

    return Center(
      child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          highlightColor: Theme.of(context).primaryColor.withOpacity(0.2),
          overlayColor: MaterialStateProperty.resolveWith(getColor),
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16)),
            padding: EdgeInsets.all(16),
            width: screenWidth(context) * 0.9,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(
                Ionicons.save,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                title,
                style: AppFont.font(TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 18)),
              ),
            ]),
          )),
    );
  }
}
