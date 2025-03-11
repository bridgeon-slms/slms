class ReviewModel {
  String? status;
  String? message;
  List<ReviewData>? data;
  num? dataLength;

  ReviewModel({this.status, this.message, this.data, this.dataLength});

  ReviewModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ReviewData>[];
      json['data'].forEach((v) {
        data!.add(ReviewData.fromJson(v));
      });
    }
    dataLength = json['dataLength'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['dataLength'] = dataLength;
    return data;
  }
}

class ReviewData {
  Academic? academic;
  Others? others;
  String? sId;
  StudentId? studentId;
  num? week;
  String? reviewDate;
  ReviewerName? reviewerName;
  bool? isScheduled;
  String? remark;
  bool? isDeleted;
  bool? isWeekBack;
  Null taskRecordId;
  String? createdBy;
  String? createdDate;
  String? updatedDate;
  num? iV;
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
        ? Academic.fromJson(json['academic'])
        : null;
    others =
        json['others'] != null ? Others.fromJson(json['others']) : null;
    sId = json['_id'];
    studentId = json['studentId'] != null
        ? StudentId.fromJson(json['studentId'])
        : null;
    week = json['week'];
    reviewDate = json['reviewDate'];
    reviewerName = json['reviewerName'] != null
        ? ReviewerName.fromJson(json['reviewerName'])
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
    final Map<String, dynamic> data = <String, dynamic>{};
    if (academic != null) {
      data['academic'] = academic!.toJson();
    }
    if (others != null) {
      data['others'] = others!.toJson();
    }
    data['_id'] = sId;
    if (studentId != null) {
      data['studentId'] = studentId!.toJson();
    }
    data['week'] = week;
    data['reviewDate'] = reviewDate;
    if (reviewerName != null) {
      data['reviewerName'] = reviewerName!.toJson();
    }
    data['isScheduled'] = isScheduled;
    data['remark'] = remark;
    data['isDeleted'] = isDeleted;
    data['isWeekBack'] = isWeekBack;
    data['taskRecordId'] = taskRecordId;
    data['createdBy'] = createdBy;
    data['createdDate'] = createdDate;
    data['updatedDate'] = updatedDate;
    data['__v'] = iV;
    data['updatedBy'] = updatedBy;
    data['feeRecordId'] = feeRecordId;
    return data;
  }
}

class Academic {
  num? review;
  num? task;

  Academic({this.review, this.task});

  Academic.fromJson(Map<String, dynamic> json) {
    review = json['review'];
    task = json['task'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['review'] = review;
    data['task'] = task;
    return data;
  }
}

class Others {
  num? attendance;
  num? discipline;

  Others({this.attendance, this.discipline});

  Others.fromJson(Map<String, dynamic> json) {
    attendance = json['attendance'];
    discipline = json['discipline'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['attendance'] = attendance;
    data['discipline'] = discipline;
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
  Null company;
  num? week;
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
  num? iV;
  String? imageLowRes;
  String? updatedBy;
  String? institution;
  bool? isPlacementUnlocked;
  String? passOutYear;
  String? targetedSalary;
  String? password;
  bool? agreementSigned;
  Null exitDate;
  bool? isScheduledAttendance;
  String? workShift;
  num? externalId;
  String? district;
  String? admissionDate;
  Null refStaff;
  Null refStudent;

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
        ? Guardian.fromJson(json['guardian'])
        : null;
    socialLinks = json['socialLinks'] != null
        ? SocialLinks.fromJson(json['socialLinks'])
        : null;
    sId = json['_id'];
    name = json['name'];
    address = json['address'];
    phone = json['phone'];
    email = json['email'];
    course = json['course'];
    batch = json['batch'] != null ? Batch.fromJson(json['batch']) : null;
    image = json['image'];
    mentor = json['mentor'];
    advisor =
        json['advisor'] != null ? Batch.fromJson(json['advisor']) : null;
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
        document!.add(Document.fromJson(v));
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
    final Map<String, dynamic> data = <String, dynamic>{};
    if (guardian != null) {
      data['guardian'] = guardian!.toJson();
    }
    if (socialLinks != null) {
      data['socialLinks'] = socialLinks!.toJson();
    }
    data['_id'] = sId;
    data['name'] = name;
    data['address'] = address;
    data['phone'] = phone;
    data['email'] = email;
    data['course'] = course;
    if (batch != null) {
      data['batch'] = batch!.toJson();
    }
    data['image'] = image;
    data['mentor'] = mentor;
    if (advisor != null) {
      data['advisor'] = advisor!.toJson();
    }
    data['joiningDate'] = joiningDate;
    data['qualification'] = qualification;
    data['branch'] = branch;
    data['space'] = space;
    data['company'] = company;
    data['week'] = week;
    data['courseType'] = courseType;
    data['courseCompleted'] = courseCompleted;
    data['remark'] = remark;
    data['feeStructures'] = feeStructures;
    data['skillSets'] = skillSets;
    data['status'] = status;
    data['isRegistered'] = isRegistered;
    data['isDeleted'] = isDeleted;
    data['createdBy'] = createdBy;
    if (document != null) {
      data['document'] = document!.map((v) => v.toJson()).toList();
    }
    data['createdDate'] = createdDate;
    data['updatedDate'] = updatedDate;
    data['__v'] = iV;
    data['imageLowRes'] = imageLowRes;
    data['updatedBy'] = updatedBy;
    data['institution'] = institution;
    data['isPlacementUnlocked'] = isPlacementUnlocked;
    data['passOutYear'] = passOutYear;
    data['targetedSalary'] = targetedSalary;
    data['password'] = password;
    data['agreementSigned'] = agreementSigned;
    data['exitDate'] = exitDate;
    data['isScheduledAttendance'] = isScheduledAttendance;
    data['workShift'] = workShift;
    data['externalId'] = externalId;
    data['district'] = district;
    data['admissionDate'] = admissionDate;
    data['refStaff'] = refStaff;
    data['refStudent'] = refStudent;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['relationship'] = relationship;
    data['phone'] = phone;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['linkedIn'] = linkedIn;
    data['github'] = github;
    data['leetCode'] = leetCode;
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

class Document {
  String? url;
  String? fileName;
  String? originalName;
  num? size;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['fileName'] = fileName;
    data['originalName'] = originalName;
    data['size'] = size;
    data['mimeType'] = mimeType;
    data['isDeleted'] = isDeleted;
    data['_id'] = sId;
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
        ? Batch.fromJson(json['designation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    if (designation != null) {
      data['designation'] = designation!.toJson();
    }
    return data;
  }
}
