class DayModel {
  String name;
  bool enable;
  bool visible;

  DayModel({required this.name, required this.enable, required this.visible});
  @override
  String toString() {
    return '[$visible]\r\n';
  }
}
