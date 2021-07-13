import 'package:flutter/material.dart';
import 'package:go_class_app/widgets/utils/fontTextStyle.dart';
import 'package:ionicons/ionicons.dart';

class GenericAddNewItem extends StatelessWidget {
  final String? title;
  final VoidCallback onTap;
  final IconData iconData;
  const GenericAddNewItem({
    Key? key,
    this.title = 'Añadir nuevo',
    required this.onTap,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(children: [
          GestureDetector(
            onTap: onTap,
            child: CircleAvatar(
              backgroundColor: Color(0xFFc5dce8).withOpacity(0.3),
              radius: 66,
              child: CircleAvatar(
                backgroundColor: Color(0xFFc5dce8).withOpacity(0.5),
                radius: 33,
                child: Icon(
                  iconData,
                  color: Theme.of(context).textTheme.headline5!.color,
                  size: 44,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              decoration: BoxDecoration(
                color: Color(0xFFc5dce8).withOpacity(0.5),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title!,
                      style: AppFont.font(TextStyle(
                          color: Theme.of(context).textTheme.headline5!.color,
                          fontSize: 20,
                          fontWeight: FontWeight.w300)),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    IconButton(
                        onPressed: onTap,
                        icon: Icon(
                          Ionicons.add_circle,
                          color: Theme.of(context).textTheme.headline5!.color,
                        ))
                  ]),
            ),
          ),
        ]),
      ),
    );
  }
}
