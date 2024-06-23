
class scan {
  int? lectureId;

  scan({this.lectureId});

  scan.fromJson(Map<String, dynamic> json) {
    lectureId = json['lectureId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lectureId'] = this.lectureId;
    return data;
  }
}