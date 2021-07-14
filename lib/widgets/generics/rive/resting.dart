import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class RiveResting extends StatefulWidget {
  @override
  _RiveRestingState createState() => _RiveRestingState();
}

class _RiveRestingState extends State<RiveResting> {
  final riveFileName = 'images/resting.riv';
  Artboard? _artboard;

  @override
  void initState() {
    super.initState();
    rootBundle.load('images/resting.riv').then(
      (data) async {
        final file = RiveFile.import(data);
        final artboard = file.mainArtboard;
        setState(() =>
            _artboard = artboard..addController(SimpleAnimation('Untitled 1')));
      },
    );
  }

  /// Show the rive file, when loaded
  @override
  Widget build(BuildContext context) {
    return _artboard != null
        ? Rive(
            artboard: _artboard!,
            //fit: BoxFit.fitWidth,
          )
        : Container();
  }
}
