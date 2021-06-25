class ClassroomModel {
  String name;
  String? description;
  TypeDescription type;

  ClassroomModel(
      {required this.name, required this.description, required this.type});
}

enum TypeDescription { text, url }
