class LogModel {
  String? status;
  String? message;
  DataLog? data;

  LogModel({this.status, this.message, this.data});

  LogModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? DataLog.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
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
        attendanceLogs!.add(AttendanceLogs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (attendanceLogs != null) {
      data['attendanceLogs'] =
          attendanceLogs!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['DeviceId'] = deviceId;
    data['UserId'] = userId;
    data['LogDate'] = logDate;
    data['Direction'] = direction;
    data['isSynced'] = isSynced;
    data['CreatedDate'] = createdDate;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
