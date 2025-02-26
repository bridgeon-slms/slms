class AttendattendanceModel {
  String? status;
  String? message;
  List<Data>? data;

  AttendattendanceModel({this.status, this.message, this.data});

  AttendattendanceModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  UserId? userId;
  String? date;
  int? status;
  String? checkIn;
  String? checkOut;
  int? totalTime;
  int? workTime;
  bool? isRequested;
  String? createdDate;
  String? updatedDate;
  int? iV;
  String? updatedBy;

  Data(
      {this.sId,
      this.userId,
      this.date,
      this.status,
      this.checkIn,
      this.checkOut,
      this.totalTime,
      this.workTime,
      this.isRequested,
      this.createdDate,
      this.updatedDate,
      this.iV,
      this.updatedBy});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId =
        json['userId'] != null ? new UserId.fromJson(json['userId']) : null;
    date = json['date'];
    status = json['status'];
    checkIn = json['checkIn'];
    checkOut = json['checkOut'];
    totalTime = json['totalTime'];
    workTime = json['workTime'];
    isRequested = json['isRequested'];
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
    iV = json['__v'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.userId != null) {
      data['userId'] = this.userId!.toJson();
    }
    data['date'] = this.date;
    data['status'] = this.status;
    data['checkIn'] = this.checkIn;
    data['checkOut'] = this.checkOut;
    data['totalTime'] = this.totalTime;
    data['workTime'] = this.workTime;
    data['isRequested'] = this.isRequested;
    data['createdDate'] = this.createdDate;
    data['updatedDate'] = this.updatedDate;
    data['__v'] = this.iV;
    data['updatedBy'] = this.updatedBy;
    return data;
  }
}

class UserId {
  String? sId;
  String? name;
  Batch? batch;
  Batch? advisor;
  int? externalId;

  UserId({this.sId, this.name, this.batch, this.advisor, this.externalId});

  UserId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    batch = json['batch'] != null ? new Batch.fromJson(json['batch']) : null;
    advisor =
        json['advisor'] != null ? new Batch.fromJson(json['advisor']) : null;
    externalId = json['externalId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    if (this.batch != null) {
      data['batch'] = this.batch!.toJson();
    }
    if (this.advisor != null) {
      data['advisor'] = this.advisor!.toJson();
    }
    data['externalId'] = this.externalId;
    return data;
  }
}

class Batch {
  String? sId;
  String? name;

  Batch({this.sId, this.name});

  Batch.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    return data;
  }
}
