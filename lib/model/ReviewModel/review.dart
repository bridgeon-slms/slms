class ReviewModel {
  String? status;
  String? message;
  List<ReviewData>? data;
  int? dataLength;

  ReviewModel({this.status, this.message, this.data, this.dataLength});

  ReviewModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ReviewData>[];
      json['data'].forEach((v) {
        data!.add(new ReviewData.fromJson(v));
      });
    }
    dataLength = json['dataLength'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['dataLength'] = this.dataLength;
    return data;
  }
}

class ReviewData {
  Academic? academic;
  Others? others;
  String? sId;
  StudentId? studentId;
  int? week;
  String? reviewDate;
  ReviewerName? reviewerName;
  bool? isScheduled;
  String? remark;
  bool? isDeleted;
  bool? isWeekBack;
  Null? taskRecordId;
  String? createdBy;
  String? createdDate;
  String? updatedDate;
  int? iV;
  String? updatedBy;
  String? feeRecordId;

  ReviewData(
      {this.academic,
      this.others,
      this.sId,
      this.studentId,
      this.week,
      this.reviewDate,
      this.reviewerName,
      this.isScheduled,
      this.remark,
      this.isDeleted,
      this.isWeekBack,
      this.taskRecordId,
      this.createdBy,
      this.createdDate,
      this.updatedDate,
      this.iV,
      this.updatedBy,
      this.feeRecordId});

  ReviewData.fromJson(Map<String, dynamic> json) {
    academic = json['academic'] != null
        ? new Academic.fromJson(json['academic'])
        : null;
    others =
        json['others'] != null ? new Others.fromJson(json['others']) : null;
    sId = json['_id'];
    studentId = json['studentId'] != null
        ? new StudentId.fromJson(json['studentId'])
        : null;
    week = json['week'];
    reviewDate = json['reviewDate'];
    reviewerName = json['reviewerName'] != null
        ? new ReviewerName.fromJson(json['reviewerName'])
        : null;
    isScheduled = json['isScheduled'];
    remark = json['remark'];
    isDeleted = json['isDeleted'];
    isWeekBack = json['isWeekBack'];
    taskRecordId = json['taskRecordId'];
    createdBy = json['createdBy'];
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
    iV = json['__v'];
    updatedBy = json['updatedBy'];
    feeRecordId = json['feeRecordId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.academic != null) {
      data['academic'] = this.academic!.toJson();
    }
    if (this.others != null) {
      data['others'] = this.others!.toJson();
    }
    data['_id'] = this.sId;
    if (this.studentId != null) {
      data['studentId'] = this.studentId!.toJson();
    }
    data['week'] = this.week;
    data['reviewDate'] = this.reviewDate;
    if (this.reviewerName != null) {
      data['reviewerName'] = this.reviewerName!.toJson();
    }
    data['isScheduled'] = this.isScheduled;
    data['remark'] = this.remark;
    data['isDeleted'] = this.isDeleted;
    data['isWeekBack'] = this.isWeekBack;
    data['taskRecordId'] = this.taskRecordId;
    data['createdBy'] = this.createdBy;
    data['createdDate'] = this.createdDate;
    data['updatedDate'] = this.updatedDate;
    data['__v'] = this.iV;
    data['updatedBy'] = this.updatedBy;
    data['feeRecordId'] = this.feeRecordId;
    return data;
  }
}

class Academic {
  double? review;
  double? task;

  Academic({this.review, this.task});

  Academic.fromJson(Map<String, dynamic> json) {
    review = json['review'];
    task = json['task'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['review'] = this.review;
    data['task'] = this.task;
    return data;
  }
}

class Others {
  double? attendance;
  double? discipline;

  Others({this.attendance, this.discipline});

  Others.fromJson(Map<String, dynamic> json) {
    attendance = json['attendance'];
    discipline = json['discipline'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['attendance'] = this.attendance;
    data['discipline'] = this.discipline;
    return data;
  }
}

class StudentId {
  Guardian? guardian;
  SocialLinks? socialLinks;
  String? sId;
  String? name;
  String? address;
  String? phone;
  String? email;
  String? course;
  Batch? batch;
  String? image;
  String? mentor;
  Batch? advisor;
  String? joiningDate;
  String? qualification;
  String? branch;
  String? space;
  Null? company;
  int? week;
  String? courseType;
  bool? courseCompleted;
  String? remark;
  List<String>? feeStructures;
  List<String>? skillSets;
  String? status;
  bool? isRegistered;
  bool? isDeleted;
  String? createdBy;
  List<Document>? document;
  String? createdDate;
  String? updatedDate;
  int? iV;
  String? imageLowRes;
  String? updatedBy;
  String? institution;
  bool? isPlacementUnlocked;
  String? passOutYear;
  String? targetedSalary;
  String? password;
  bool? agreementSigned;
  Null? exitDate;
  bool? isScheduledAttendance;
  String? workShift;
  int? externalId;
  String? district;
  String? admissionDate;
  Null? refStaff;
  Null? refStudent;

  StudentId(
      {this.guardian,
      this.socialLinks,
      this.sId,
      this.name,
      this.address,
      this.phone,
      this.email,
      this.course,
      this.batch,
      this.image,
      this.mentor,
      this.advisor,
      this.joiningDate,
      this.qualification,
      this.branch,
      this.space,
      this.company,
      this.week,
      this.courseType,
      this.courseCompleted,
      this.remark,
      this.feeStructures,
      this.skillSets,
      this.status,
      this.isRegistered,
      this.isDeleted,
      this.createdBy,
      this.document,
      this.createdDate,
      this.updatedDate,
      this.iV,
      this.imageLowRes,
      this.updatedBy,
      this.institution,
      this.isPlacementUnlocked,
      this.passOutYear,
      this.targetedSalary,
      this.password,
      this.agreementSigned,
      this.exitDate,
      this.isScheduledAttendance,
      this.workShift,
      this.externalId,
      this.district,
      this.admissionDate,
      this.refStaff,
      this.refStudent});

  StudentId.fromJson(Map<String, dynamic> json) {
    guardian = json['guardian'] != null
        ? new Guardian.fromJson(json['guardian'])
        : null;
    socialLinks = json['socialLinks'] != null
        ? new SocialLinks.fromJson(json['socialLinks'])
        : null;
    sId = json['_id'];
    name = json['name'];
    address = json['address'];
    phone = json['phone'];
    email = json['email'];
    course = json['course'];
    batch = json['batch'] != null ? new Batch.fromJson(json['batch']) : null;
    image = json['image'];
    mentor = json['mentor'];
    advisor =
        json['advisor'] != null ? new Batch.fromJson(json['advisor']) : null;
    joiningDate = json['joiningDate'];
    qualification = json['qualification'];
    branch = json['branch'];
    space = json['space'];
    company = json['company'];
    week = json['week'];
    courseType = json['courseType'];
    courseCompleted = json['courseCompleted'];
    remark = json['remark'];
    feeStructures = json['feeStructures'].cast<String>();
    skillSets = json['skillSets'].cast<String>();
    status = json['status'];
    isRegistered = json['isRegistered'];
    isDeleted = json['isDeleted'];
    createdBy = json['createdBy'];
    if (json['document'] != null) {
      document = <Document>[];
      json['document'].forEach((v) {
        document!.add(new Document.fromJson(v));
      });
    }
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
    iV = json['__v'];
    imageLowRes = json['imageLowRes'];
    updatedBy = json['updatedBy'];
    institution = json['institution'];
    isPlacementUnlocked = json['isPlacementUnlocked'];
    passOutYear = json['passOutYear'];
    targetedSalary = json['targetedSalary'];
    password = json['password'];
    agreementSigned = json['agreementSigned'];
    exitDate = json['exitDate'];
    isScheduledAttendance = json['isScheduledAttendance'];
    workShift = json['workShift'];
    externalId = json['externalId'];
    district = json['district'];
    admissionDate = json['admissionDate'];
    refStaff = json['refStaff'];
    refStudent = json['refStudent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.guardian != null) {
      data['guardian'] = this.guardian!.toJson();
    }
    if (this.socialLinks != null) {
      data['socialLinks'] = this.socialLinks!.toJson();
    }
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['course'] = this.course;
    if (this.batch != null) {
      data['batch'] = this.batch!.toJson();
    }
    data['image'] = this.image;
    data['mentor'] = this.mentor;
    if (this.advisor != null) {
      data['advisor'] = this.advisor!.toJson();
    }
    data['joiningDate'] = this.joiningDate;
    data['qualification'] = this.qualification;
    data['branch'] = this.branch;
    data['space'] = this.space;
    data['company'] = this.company;
    data['week'] = this.week;
    data['courseType'] = this.courseType;
    data['courseCompleted'] = this.courseCompleted;
    data['remark'] = this.remark;
    data['feeStructures'] = this.feeStructures;
    data['skillSets'] = this.skillSets;
    data['status'] = this.status;
    data['isRegistered'] = this.isRegistered;
    data['isDeleted'] = this.isDeleted;
    data['createdBy'] = this.createdBy;
    if (this.document != null) {
      data['document'] = this.document!.map((v) => v.toJson()).toList();
    }
    data['createdDate'] = this.createdDate;
    data['updatedDate'] = this.updatedDate;
    data['__v'] = this.iV;
    data['imageLowRes'] = this.imageLowRes;
    data['updatedBy'] = this.updatedBy;
    data['institution'] = this.institution;
    data['isPlacementUnlocked'] = this.isPlacementUnlocked;
    data['passOutYear'] = this.passOutYear;
    data['targetedSalary'] = this.targetedSalary;
    data['password'] = this.password;
    data['agreementSigned'] = this.agreementSigned;
    data['exitDate'] = this.exitDate;
    data['isScheduledAttendance'] = this.isScheduledAttendance;
    data['workShift'] = this.workShift;
    data['externalId'] = this.externalId;
    data['district'] = this.district;
    data['admissionDate'] = this.admissionDate;
    data['refStaff'] = this.refStaff;
    data['refStudent'] = this.refStudent;
    return data;
  }
}

class Guardian {
  String? name;
  String? relationship;
  String? phone;

  Guardian({this.name, this.relationship, this.phone});

  Guardian.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    relationship = json['relationship'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['relationship'] = this.relationship;
    data['phone'] = this.phone;
    return data;
  }
}

class SocialLinks {
  String? linkedIn;
  String? github;
  String? leetCode;

  SocialLinks({this.linkedIn, this.github, this.leetCode});

  SocialLinks.fromJson(Map<String, dynamic> json) {
    linkedIn = json['linkedIn'];
    github = json['github'];
    leetCode = json['leetCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['linkedIn'] = this.linkedIn;
    data['github'] = this.github;
    data['leetCode'] = this.leetCode;
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

class Document {
  String? url;
  String? fileName;
  String? originalName;
  int? size;
  String? mimeType;
  bool? isDeleted;
  String? sId;

  Document(
      {this.url,
      this.fileName,
      this.originalName,
      this.size,
      this.mimeType,
      this.isDeleted,
      this.sId});

  Document.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    fileName = json['fileName'];
    originalName = json['originalName'];
    size = json['size'];
    mimeType = json['mimeType'];
    isDeleted = json['isDeleted'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['fileName'] = this.fileName;
    data['originalName'] = this.originalName;
    data['size'] = this.size;
    data['mimeType'] = this.mimeType;
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    return data;
  }
}

class ReviewerName {
  String? sId;
  String? name;
  Batch? designation;

  ReviewerName({this.sId, this.name, this.designation});

  ReviewerName.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    designation = json['designation'] != null
        ? new Batch.fromJson(json['designation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    if (this.designation != null) {
      data['designation'] = this.designation!.toJson();
    }
    return data;
  }
}
