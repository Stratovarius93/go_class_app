import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_class_app/bloc/CRUDsignature/CRUDsignature_bloc.dart';
import 'package:go_class_app/widgets/constants/colors.dart';
import 'package:go_class_app/widgets/generics/category.dart';
import 'package:go_class_app/widgets/generics/listTileCategory.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ionicons/ionicons.dart';

class AddColorSignature extends StatefulWidget {
  const AddColorSignature({Key? key}) : super(key: key);
  @override
  _AddColorSignatureState createState() => _AddColorSignatureState();
}

class _AddColorSignatureState extends State<AddColorSignature> {
  @override
  Widget build(BuildContext context) {
    const EdgeInsets _padding =
        EdgeInsets.symmetric(vertical: 16, horizontal: 16);
    return BlocBuilder<CRUDsignatureBloc, CRUDsignatureState>(
        builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: _padding,
            child: GenericCategory(
              title: '${AppLocalizations.of(context)!.addSchedule_color}',
            ),
          ),
          Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).appBarTheme.backgroundColor),
              child: Column(children: [
                GenericListTileCategory(
                  title:
                      '${AppLocalizations.of(context)!.addSchedule_color_part1}',
                  iconData: Ionicons.color_palette,
                  onTap: () {},
                  //subtitle: 'Verde (Por defecto)',
                  //subtitle: '${state.color.value}',
                ),
                Padding(
                  padding: _padding,
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 40,
                        mainAxisSpacing: 20,
                        crossAxisCount: 4),
                    itemCount: AppColorLight.listSchedule.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        BlocProvider.of<CRUDsignatureBloc>(context)
                            .add(CRUDAddColor(index));
                      },
                      child: CircleAvatar(
                        backgroundColor: (state.color == index)
                            ? Theme.of(context).primaryColor.withOpacity(0.6)
                            : Colors.transparent,
                        child: CircleAvatar(
                          maxRadius: 26,
                          backgroundColor: AppColorLight.listSchedule[index],
                        ),
                      ),
                    ),
                  ),
                ),
              ])),
        ],
      );
    });
  }
}
