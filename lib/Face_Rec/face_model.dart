class ImageModel {
  List<Detail>? detail;

  ImageModel({this.detail});

  ImageModel.fromJson(Map<String, dynamic> json) {
    if (json['detail'] != null) {
      detail = <Detail>[];
      json['detail'].forEach((v) {
        detail!.add(Detail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (detail != null) {
      data['detail'] = detail!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Detail {
  List<String>? loc;
  String? msg;
  String? type;

  Detail({this.loc, this.msg, this.type});

  Detail.fromJson(Map<String, dynamic> json) {
    loc = json['loc'].cast<String>();
    msg = json['msg'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['loc'] = loc;
    data['msg'] = msg;
    data['type'] = type;
    return data;
  }
}
