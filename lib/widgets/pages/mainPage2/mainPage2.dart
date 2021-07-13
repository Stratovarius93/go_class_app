import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_class_app/bloc/roomClass/classroom_bloc.dart';
import 'package:go_class_app/bloc/schedule/schedule_bloc.dart';
import 'package:go_class_app/bloc/signatures/signatures_bloc.dart';
import 'package:go_class_app/models/classroom/room_model.dart';
import 'package:go_class_app/models/signature/signature_model.dart';
import 'package:go_class_app/widgets/generics/CRUDviews/classroom/editClassroom.dart';
import 'package:go_class_app/widgets/generics/CRUDviews/classroom/removeClassroom.dart';
import 'package:go_class_app/widgets/generics/CRUDviews/signature/alertDialogSignatures.dart';
import 'package:go_class_app/widgets/generics/actionTextRight.dart';
import 'package:go_class_app/widgets/generics/addNewItem.dart';
import 'package:go_class_app/widgets/generics/card.dart';
import 'package:go_class_app/widgets/generics/popMenuItem/popMenuItem.dart';
import 'package:go_class_app/widgets/generics/popMenuItem/popMenuItemModel.dart';
import 'package:go_class_app/widgets/generics/snackBar.dart';
import 'package:go_class_app/widgets/generics/subtitle.dart';
import 'package:go_class_app/widgets/generics/title.dart';
import 'package:go_class_app/widgets/utils/fontTextStyle.dart';
import 'package:ionicons/ionicons.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'signatures.dart';
part 'roomClass.dart';

class MainPage2 extends StatefulWidget {
  final BuildContext? contextRoute;

  const MainPage2({Key? key, this.contextRoute}) : super(key: key);
  @override
  _MainPage2State createState() => _MainPage2State();
}

class _MainPage2State extends State<MainPage2> {
  GlobalKey<FormState> _formKeyAdd = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Theme.of(context).brightness,
          statusBarIconBrightness: Theme.of(context).brightness),
      child: AnimatedTheme(
        duration: Duration(milliseconds: 500),
        data: Theme.of(context),
        curve: Curves.easeInOutExpo,
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: SafeArea(
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: GenericTitle(
                    title: '${AppLocalizations.of(context)!.mainPage2_title}',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 0, bottom: 16),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GenericSubtitle(
                          title:
                              '${AppLocalizations.of(context)!.mainPage2_listSignature}',
                        ),
                        BlocBuilder<SignaturesBloc, SignaturesState>(
                          builder: (context, state) => Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: GestureDetector(
                              onTap: () async {
                                await showAlertSignatureAdd(
                                    context, _formKeyAdd);
                              },
                              child: GenericActionTextRight(
                                title:
                                    '${AppLocalizations.of(context)!.button_add}',
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const _Signatures(),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 0, bottom: 16),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GenericSubtitle(
                            title:
                                '${AppLocalizations.of(context)!.mainPage2_listRoom}'),
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  widget.contextRoute!,
                                  'mainPage2CreateRoom',
                                );
                              },
                              child: GenericActionTextRight(
                                title:
                                    '${AppLocalizations.of(context)!.button_add}',
                              )),
                        ),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: _Classroom(widget.contextRoute),
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
