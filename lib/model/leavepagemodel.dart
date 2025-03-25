class LeavePageModel {
  Data? data;

  LeavePageModel({this.data});

  factory LeavePageModel.fromJson(Map<String, dynamic> json) {
    return LeavePageModel(
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.toJson(),
    };
  }
}

class Data {
  List<LeaveRequest>? leaveRequests;
  int? count;

  Data({this.leaveRequests, this.count});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      leaveRequests: json['leaveRequests'] != null
          ? List<LeaveRequest>.from(
              json['leaveRequests'].map((v) => LeaveRequest.fromJson(v)))
          : [],
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'leaveRequests': leaveRequests?.map((v) => v.toJson()).toList(),
      'count': count,
    };
  }
}

class LeaveRequest {
  User? user;
  String? type;
  List<LeaveDate>? dates;
  String? leaveType;
  String? description;
  String? status;

  LeaveRequest({
    this.user,
    this.type,
    this.dates,
    this.leaveType,
    this.description,
    this.status,
  });

  factory LeaveRequest.fromJson(Map<String, dynamic> json) {
    return LeaveRequest(
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      type: json['type'],
      dates: json['dates'] != null
          ? List<LeaveDate>.from(
              json['dates'].map((v) => LeaveDate.fromJson(v)))
          : [],
      leaveType: json['leaveType'],
      description: json['description'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user?.toJson(),
      'type': type,
      'dates': dates?.map((v) => v.toJson()).toList(),
      'leaveType': leaveType,
      'description': description,
      'status': status,
    };
  }
}

class User {
  String? name;
  String? email;

  User({this.name, this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
    };
  }
}

class LeaveDate {
  String? date;
  int? value;

  LeaveDate({this.date, this.value});

  factory LeaveDate.fromJson(Map<String, dynamic> json) {
    return LeaveDate(
      date: json['date'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'value': value,
    };
  }
}
