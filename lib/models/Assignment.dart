class Assignment {
  String subjectName;
  String title;
  String issueDate;
  String dueDate;
  String description;
  String attachment;
  String id;

  Assignment({
    required this.description,
    required this.title,
    required this.attachment,
    required this.dueDate,
    required this.issueDate,
    required this.id,
    required this.subjectName,
  });

  factory Assignment.fromJson(Map<String, dynamic> json) {
    return Assignment(
      title: json['title'] ?? '',
      attachment: json['attachment'] ?? '',
      description: json['description'] ?? '',
      dueDate: json['dueDate'] ?? '',
      issueDate: json['dateAssigned'] ?? '',
      subjectName: json['subjectName'] ?? '',
      id: json['ID'] ?? '',
    );
  }
}
