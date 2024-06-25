//
//
// class ViewAttendence {
//   final String courseName;
//   final String date;
//   final String lectureName;
//   final String attend;
//
//   ViewAttendence({
//     required this.courseName,
//     required this.date,
//     required this.lectureName,
//     required this.attend,
//   });
//
//   factory ViewAttendence.fromJson(Map<String, dynamic> json) {
//     return ViewAttendence(
//       courseName: json['courseName'],
//       date: json['date'],
//       lectureName: json['lectureName'],
//       attend: json['attend'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'courseName': courseName,
//       'date': date,
//       'lectureName': lectureName,
//       'attend': attend,
//     };
//   }
// }

class ViewAttendence {
  final String courseName;
  final String date;
  final String lectureName;
  final String attend;

  ViewAttendence({
    required this.courseName,
    required this.date,
    required this.lectureName,
    required this.attend,
  });
  factory ViewAttendence.fromJson(Map<String, dynamic> json) {
    return ViewAttendence(
      courseName: json['courseName'] is String ? json['courseName'] : '',
      date: json['date'] is String ? json['date'] : '',
      lectureName: json['lectureName'] is String ? json['lectureName'] : '',
      attend: json['attend'] is String ? json['attend'] : '',
    );
  }
}