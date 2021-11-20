class Period {
  int? number;
  String subjectName;
  String teacherName;
  String timing;
  bool isLunch;
  String classname;

  Period({
    this.classname='',
    this.number = 0,
    this.subjectName='',
    this.teacherName='',
    required this.timing,
    this.isLunch = false,
  });
}
