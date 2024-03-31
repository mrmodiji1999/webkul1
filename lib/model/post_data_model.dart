class Welcome {
  List<Data>? data;

  Welcome({this.data});

  Welcome.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? path;
  String? domain;
  Data? data;
  String? postAt;
  String? status;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.path,
      this.domain,
      this.data,
      this.postAt,
      this.status,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    path = json['path'];
    domain = json['domain'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    postAt = json['postAt'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['path'] = this.path;
    data['domain'] = this.domain;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['postAt'] = this.postAt;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class data {
  int? eventID;

  data({this.eventID});

  data.fromJson(Map<String, dynamic> json) {
    eventID = json['eventID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eventID'] = this.eventID;
    return data;
  }
}
