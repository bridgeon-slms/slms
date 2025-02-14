class Student {
  String id;
  String name;
  String phone;
  String email;
  String address;
  String image;
  String imageLowRes;
  String institution;
  String passOutYear;
  String district;
  String joiningDate;
  String qualification;
  String courseType;
  bool courseCompleted;
  String remark;
  String status;
  bool isRegistered;
  bool isDeleted;
  String createdDate;
  String updatedDate;
  Guardian guardian;
  SocialLinks socialLinks;
  Course course;
  Batch batch;
  Mentor mentor;
  Advisor advisor;
  List<FeeStructure> feeStructures;
  List<Document> documents;
  WorkShift workShift;
  bool isPlacementUnlocked;
  bool isScheduledAttendance;
  String password;
  bool agreementSigned;
  String externalId;
  String exitDate;

  Student({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
    required this.image,
    required this.imageLowRes,
    required this.institution,
    required this.passOutYear,
    required this.district,
    required this.joiningDate,
    required this.qualification,
    required this.courseType,
    required this.courseCompleted,
    required this.remark,
    required this.status,
    required this.isRegistered,
    required this.isDeleted,
    required this.createdDate,
    required this.updatedDate,
    required this.guardian,
    required this.socialLinks,
    required this.course,
    required this.batch,
    required this.mentor,
    required this.advisor,
    required this.feeStructures,
    required this.documents,
    required this.workShift,
    required this.isPlacementUnlocked,
    required this.isScheduledAttendance,
    required this.password,
    required this.agreementSigned,
    required this.externalId,
    this.exitDate = '',
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['_id'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      address: json['address'],
      image: json['image'],
      imageLowRes: json['imageLowRes'],
      institution: json['institution']['name'],
      passOutYear: json['passOutYear'],
      district: json['district'],
      joiningDate: json['joiningDate'],
      qualification: json['qualification']['name'],
      courseType: json['courseType'],
      courseCompleted: json['courseCompleted'],
      remark: json['remark'],
      status: json['status'],
      isRegistered: json['isRegistered'],
      isDeleted: json['isDeleted'],
      createdDate: json['createdDate'],
      updatedDate: json['updatedDate'],
      guardian: Guardian.fromJson(json['guardian']),
      socialLinks: SocialLinks.fromJson(json['socialLinks']),
      course: Course.fromJson(json['course']),
      batch: Batch.fromJson(json['batch']),
      mentor: Mentor.fromJson(json['mentor']),
      advisor: Advisor.fromJson(json['advisor']),
      feeStructures: (json['feeStructures'] as List)
          .map((e) => FeeStructure.fromJson(e))
          .toList(),
      documents:
          (json['document'] as List).map((e) => Document.fromJson(e)).toList(),
      workShift: WorkShift.fromJson(json['workShift']),
      isPlacementUnlocked: json['isPlacementUnlocked'],
      isScheduledAttendance: json['isScheduledAttendance'],
      password: json['password'],
      agreementSigned: json['agreementSigned'],
      externalId: json['externalId'],
      exitDate: json['exitDate'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'address': address,
      'image': image,
      'imageLowRes': imageLowRes,
      'institution': {'name': institution},
      'passOutYear': passOutYear,
      'district': district,
      'joiningDate': joiningDate,
      'qualification': {'name': qualification},
      'courseType': courseType,
      'courseCompleted': courseCompleted,
      'remark': remark,
      'status': status,
      'isRegistered': isRegistered,
      'isDeleted': isDeleted,
      'createdDate': createdDate,
      'updatedDate': updatedDate,
      'guardian': guardian.toJson(),
      'socialLinks': socialLinks.toJson(),
      'course': course.toJson(),
      'batch': batch.toJson(),
      'mentor': mentor.toJson(),
      'advisor': advisor.toJson(),
      'feeStructures': feeStructures.map((e) => e.toJson()).toList(),
      'document': documents.map((e) => e.toJson()).toList(),
      'workShift': workShift.toJson(),
      'isPlacementUnlocked': isPlacementUnlocked,
      'isScheduledAttendance': isScheduledAttendance,
      'password': password,
      'agreementSigned': agreementSigned,
      'externalId': externalId,
      'exitDate': exitDate,
    };
  }
}

class Guardian {
  String name;
  String relationship;
  String phone;

  Guardian(
      {required this.name, required this.relationship, required this.phone});

  factory Guardian.fromJson(Map<String, dynamic> json) {
    return Guardian(
      name: json['name'],
      relationship: json['relationship'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'relationship': relationship,
      'phone': phone,
    };
  }
}

class SocialLinks {
  String linkedIn;
  String github;
  String leetCode;

  SocialLinks(
      {required this.linkedIn, required this.github, required this.leetCode});

  factory SocialLinks.fromJson(Map<String, dynamic> json) {
    return SocialLinks(
      linkedIn: json['linkedIn'],
      github: json['github'],
      leetCode: json['leetCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'linkedIn': linkedIn,
      'github': github,
      'leetCode': leetCode,
    };
  }
}

class Course {
  String id;
  String name;

  Course({required this.id, required this.name});

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['_id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
    };
  }
}

class Batch {
  String id;
  String name;

  Batch({required this.id, required this.name});

  factory Batch.fromJson(Map<String, dynamic> json) {
    return Batch(
      id: json['_id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
    };
  }
}

class Mentor {
  String id;
  String name;

  Mentor({required this.id, required this.name});

  factory Mentor.fromJson(Map<String, dynamic> json) {
    return Mentor(
      id: json['_id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
    };
  }
}

class Advisor {
  String id;
  String name;
  String email;

  Advisor({required this.id, required this.name, required this.email});

  factory Advisor.fromJson(Map<String, dynamic> json) {
    return Advisor(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'email': email,
    };
  }
}

class FeeStructure {
  String title;
  double netAmount;
  double recurringAmount;
  String tag;
  int dueDate;

  FeeStructure({
    required this.title,
    required this.netAmount,
    required this.recurringAmount,
    required this.tag,
    required this.dueDate,
  });

  factory FeeStructure.fromJson(Map<String, dynamic> json) {
    return FeeStructure(
      title: json['title'],
      netAmount: json['netAmount'],
      recurringAmount: json['recurringAmount'],
      tag: json['tag'],
      dueDate: json['dueDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'netAmount': netAmount,
      'recurringAmount': recurringAmount,
      'tag': tag,
      'dueDate': dueDate,
    };
  }
}

class Document {
  String url;
  String fileName;
  String originalName;
  int size;
  String mimeType;

  Document({
    required this.url,
    required this.fileName,
    required this.originalName,
    required this.size,
    required this.mimeType,
  });

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      url: json['url'],
      fileName: json['fileName'],
      originalName: json['originalName'],
      size: json['size'],
      mimeType: json['mimeType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'fileName': fileName,
      'originalName': originalName,
      'size': size,
      'mimeType': mimeType,
    };
  }
}

class WorkShift {
  String id;
  String name;
  String start;
  String end;

  WorkShift({
    required this.id,
    required this.name,
    required this.start,
    required this.end,
  });

  factory WorkShift.fromJson(Map<String, dynamic> json) {
    return WorkShift(
      id: json['_id'],
      name: json['name'],
      start: json['start'],
      end: json['end'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'start': start,
      'end': end,
    };
  }
}
