import 'package:go_class_app/models/teacher/teacher_model.dart';
import 'package:url_launcher/url_launcher.dart';

TeacherModel teacherByID({String? id, List<TeacherModel>? teacherList}) {
  TeacherModel _teacher = TeacherModel(name: '');
  for (var i = 0, len = teacherList!.length; i < len; ++i) {
    if (teacherList[i].id == id) {
      _teacher = teacherList[i];
    }
  }
  return _teacher;
}

bool findTeacher({String? id, List<TeacherModel>? teacherList}) {
  bool _find = false;
  if (id != null) {
    for (var i = 0, len = teacherList!.length; i < len; ++i) {
      if (teacherList[i].id == id) {
        _find = true;
      }
    }
  } else {
    _find = false;
  }
  return _find;
}

Future<void> teacherDial(String number) async {
  //await FlutterPhoneDirectCaller.callNumber(number);
  await _launchCaller(number);
}

_launchCaller(String number) async {
  String url = "tel:$number";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
