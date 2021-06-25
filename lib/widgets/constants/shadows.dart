import 'package:flutter/material.dart';

BoxShadow shadowCard(Color color) => BoxShadow(
    color: color.withOpacity(0.3), blurRadius: 18, offset: Offset(0.0, 0.0));

BoxShadow shadowDayButton(Color color) => BoxShadow(
    color: color.withOpacity(0.5), blurRadius: 8, offset: Offset(0.0, 0.0));

BoxShadow noneShadow = BoxShadow(
    color: Colors.transparent, blurRadius: 0, offset: Offset(0.0, 0.0));
