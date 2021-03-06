import 'package:flutter/material.dart';

class GenericCard extends StatelessWidget {
  final Widget? child;

  const GenericCard({Key? key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardTheme.color,
      child: child,
      elevation: 25,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16))),
      shadowColor: Theme.of(context).cardTheme.shadowColor,
    );
  }
}

class GenericCard2 extends StatelessWidget {
  final Widget? child;

  const GenericCard2({Key? key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).cardTheme.color,
      child: child,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16))),
    );
  }
}
