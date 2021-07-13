import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_class_app/bloc/CRUDsignature/CRUDsignature_bloc.dart';
import 'package:go_class_app/widgets/generics/category.dart';
import 'package:go_class_app/widgets/generics/listTileCategory.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ionicons/ionicons.dart';

//TimeOfDay selectedTimeIn = TimeOfDay(hour: 00, minute: 00);
//TimeOfDay selectedTimeOut = TimeOfDay(hour: 00, minute: 00);
//TextEditingController _timeController = TextEditingController();
//String _hour, _minute, _time;

class AddTimeSignature extends StatefulWidget {
  final TimeOfDay? timeIn;
  final TimeOfDay? timeOut;
  const AddTimeSignature({Key? key, this.timeIn, this.timeOut})
      : super(key: key);
  @override
  _AddTimeSignatureState createState() => _AddTimeSignatureState();
}

class _AddTimeSignatureState extends State<AddTimeSignature> {
  Future<Null> _selectTimeIn(BuildContext context, TimeOfDay timeIn) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: timeIn,
    );
    if (picked != null)
      setState(() {
        timeIn = picked;

        //_hour = selectedTimeIn.hour.toString();
        //_minute = selectedTimeIn.minute.toString();
        //_time = _hour + ' : ' + _minute;
        //_timeController.text = _time;
        //_timeController.text = formatDate(
        //DateTime(2019, 08, 1, selectedTimeIn.hour, selectedTimeIn.minute),
        //[hh, ':', nn, " ", am]).toString();

        BlocProvider.of<CRUDsignatureBloc>(context)
            .add(CRUDAddTimeOfDayIn(picked));
      });
  }

  Future<Null> _selectTimeOut(BuildContext context, TimeOfDay timeOut) async {
    final TimeOfDay? _picked = await showTimePicker(
      context: context,
      initialTime: timeOut,
    );
    if (_picked != null)
      setState(() {
        timeOut = _picked;
        BlocProvider.of<CRUDsignatureBloc>(context)
            .add(CRUDAddTimeOfDayOut(_picked));
      });
  }

  @override
  Widget build(BuildContext context) {
    const EdgeInsets _padding =
        EdgeInsets.symmetric(vertical: 16, horizontal: 16);
    return BlocBuilder<CRUDsignatureBloc, CRUDsignatureState>(
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: _padding,
            child: GenericCategory(
              title: '${AppLocalizations.of(context)!.addSchedule_time}',
            ),
          ),
          GenericListTileCategory(
            title: '${AppLocalizations.of(context)!.addSchedule_time_part1}',
            iconData: Ionicons.time,
            onTap: () async {
              await _selectTimeIn(context, state.timeIn);
            },
            subtitle: '${state.timeIn.format(context)}'.padLeft(5, '0'),
          ),
          GenericListTileCategory(
            title: '${AppLocalizations.of(context)!.addSchedule_time_part2}',
            iconData: Ionicons.time,
            onTap: () async {
              await _selectTimeOut(context, state.timeOut);
            },
            subtitle: '${state.timeOut.format(context)}'.padLeft(5, '0'),
          ),
        ],
      ),
    );
  }
}
