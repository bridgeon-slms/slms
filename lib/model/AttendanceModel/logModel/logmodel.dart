class LogModel {
  String? status;
  String? message;
  DataLog? data;

  LogModel({this.status, this.message, this.data});

  LogModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new DataLog.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DataLog {
  List<AttendanceLogs>? attendanceLogs;

  DataLog({this.attendanceLogs});

  DataLog.fromJson(Map<String, dynamic> json) {
    if (json['attendanceLogs'] != null) {
      attendanceLogs = <AttendanceLogs>[];
      json['attendanceLogs'].forEach((v) {
        attendanceLogs!.add(new AttendanceLogs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.attendanceLogs != null) {
      data['attendanceLogs'] =
          this.attendanceLogs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AttendanceLogs {
  String? sId;
  int? deviceId;
  int? userId;
  String? logDate;
  String? direction;
  bool? isSynced;
  String? createdDate;
  String? createdAt;
  String? updatedAt;
  int? iV;

  AttendanceLogs(
      {this.sId,
      this.deviceId,
      this.userId,
      this.logDate,
      this.direction,
      this.isSynced,
      this.createdDate,
      this.createdAt,
      this.updatedAt,
      this.iV});

  AttendanceLogs.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    deviceId = json['DeviceId'];
    userId = json['UserId'];
    logDate = json['LogDate'];
    direction = json['Direction'];
    isSynced = json['isSynced'];
    createdDate = json['CreatedDate'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['DeviceId'] = this.deviceId;
    data['UserId'] = this.userId;
    data['LogDate'] = this.logDate;
    data['Direction'] = this.direction;
    data['isSynced'] = this.isSynced;
    data['CreatedDate'] = this.createdDate;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
