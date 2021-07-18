import 'package:flutter/material.dart';
import 'package:go_class_app/widgets/constants/screenSize.dart';
import 'package:go_class_app/widgets/generics/rive/resting.dart';
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

class GenericAddNewItemRive extends StatefulWidget {
  final String? title;
  final VoidCallback onTap;
  final IconData iconData;
  const GenericAddNewItemRive({
    Key? key,
    this.title = 'Añadir nuevo',
    required this.onTap,
    required this.iconData,
  }) : super(key: key);

  @override
  _GenericAddNewItemRiveState createState() => _GenericAddNewItemRiveState();
}

class _GenericAddNewItemRiveState extends State<GenericAddNewItemRive> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(children: [
          GestureDetector(
            onTap: widget.onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                //height: 200,
                height: screenWidth(context) * 0.45,
                child: RiveResting(),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          GestureDetector(
            onTap: widget.onTap,
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
                      widget.title!,
                      style: AppFont.font(TextStyle(
                          color: Theme.of(context).textTheme.headline5!.color,
                          fontSize: 20,
                          fontWeight: FontWeight.w300)),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    IconButton(
                        onPressed: widget.onTap,
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
