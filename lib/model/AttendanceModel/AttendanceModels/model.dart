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
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
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
        json['userId'] != null ? UserId.fromJson(json['userId']) : null;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    if (userId != null) {
      data['userId'] = userId!.toJson();
    }
    data['date'] = date;
    data['status'] = status;
    data['checkIn'] = checkIn;
    data['checkOut'] = checkOut;
    data['totalTime'] = totalTime;
    data['workTime'] = workTime;
    data['isRequested'] = isRequested;
    data['createdDate'] = createdDate;
    data['updatedDate'] = updatedDate;
    data['__v'] = iV;
    data['updatedBy'] = updatedBy;
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
    batch = json['batch'] != null ? Batch.fromJson(json['batch']) : null;
    advisor =
        json['advisor'] != null ? Batch.fromJson(json['advisor']) : null;
    externalId = json['externalId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    if (batch != null) {
      data['batch'] = batch!.toJson();
    }
    if (advisor != null) {
      data['advisor'] = advisor!.toJson();
    }
    data['externalId'] = externalId;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    return data;
  }
}
