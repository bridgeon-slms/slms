
class ProfileModel {
  Guardian guardian;
  String name;
  SocialLinks socialLinks;
  String address;
  String phone;
  String email;
  Course course;
  Batch batch;
  String image;
  String imageLowRes;
  List<Document> documents;
  Mentor mentor;
  Advisor advisor;
  String? joiningDate;
  Qualification qualification;
  Branch branch;
  Space space;
  int week; 
  String? courseType;
  String? passOutYear;
  bool agreementSigned; // Ensuring it defaults to a boolean
  String district;
  String admissionDate; // Changed to String as 'No admissionDate' is passed
  Institution institution;

  ProfileModel({
    required this.guardian,
    required this.name,
    required this.socialLinks,
    required this.address,
    required this.phone,
    required this.email,
    required this.course,
    required this.batch,
    required this.image,
    required this.imageLowRes,
    required this.documents,
    required this.mentor,
    required this.advisor,
    required this.joiningDate,
    required this.qualification,
    required this.branch,
    required this.space,
    required this.week,
    required this.courseType,
    required this.passOutYear,
    required this.agreementSigned,
    required this.district,
    required this.admissionDate,
    required this.institution,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json['name'] ?? 'No Name',
      guardian: Guardian.fromJson(json['guardian'] ?? {}),
      socialLinks: SocialLinks.fromJson(json['socialLinks'] ?? {}),
      address: json['address'] ?? 'No Address',
      phone: json['phone'] ?? 'No Phone',
      email: json['email'] ?? 'No Email',
      course: Course.fromJson(json['course'] ?? {}),
      batch: Batch.fromJson(json['batch'] ?? {}),
      image: json['image'] ?? 'No Image',
      imageLowRes: json['imageLowRes'] ?? 'No ImageLowRes',
      documents: (json['document'] as List?)
              ?.map((doc) => Document.fromJson(doc))
              .toList() ??
          [],
      mentor: Mentor.fromJson(json['mentor'] ?? {}),
      advisor: Advisor.fromJson(json['advisor'] ?? {}),
      joiningDate: json['joiningDate'] ?? 'No joiningDate',
      qualification: Qualification.fromJson(json['qualification'] ?? {}),
      branch: Branch.fromJson(json['branch'] ?? {}),
      space: Space.fromJson(json['space'] ?? {}),
      week: json['week'] != null ? json['week'] as int : 0,
      courseType: json['courseType'] ?? 'No courseType',
      institution: Institution.fromJson(json['institution'] ?? {}),
      passOutYear: json['passOutYear'] ?? 'No passOutYear',
      agreementSigned: json['agreementSigned'] != null
          ? json['agreementSigned'] as bool
          : false,
      district: json['district'] ?? 'No district',
      admissionDate: json['admissionDate'] ?? 'No admissionDate',
    );
  }
}

class Guardian {
  String name;
  String relationship;
  String phone;

  Guardian({
    required this.name,
    required this.phone,
    required this.relationship,
  });

  factory Guardian.fromJson(Map<String, dynamic> json) {
    return Guardian(
      name: json['name'] ?? 'Unknown',
      phone: json['phone'] ?? 'No Phone',
      relationship: json['relationship'] ?? 'No Relationship',
    );
  }
}

class SocialLinks {
  String linkedIn;
  String github;
  String leetCode;

  SocialLinks({
    required this.linkedIn,
    required this.github,
    required this.leetCode,
  });

  factory SocialLinks.fromJson(Map<String, dynamic> json) {
    return SocialLinks(
      linkedIn: json['linkedIn'] ?? 'No LinkedIn',
      github: json['github'] ?? 'No GitHub',
      leetCode: json['leetCode'] ?? 'No LeetCode',
    );
  }
}

class Course {
  String name;

  Course({required this.name});

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(name: json['name'] ?? 'Unknown');
  }
}

class Batch {
  String name;

  Batch({required this.name});

  factory Batch.fromJson(Map<String, dynamic> json) {
    return Batch(name: json['name'] ?? 'Unknown');
  }
}

class Document {
  String url;
  String fileName;
  String originalName;

  Document({
    required this.url,
    required this.fileName,
    required this.originalName,
  });

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      url: json['url'] ?? 'No URL',
      fileName: json['fileName'] ?? 'No FileName',
      originalName: json['originalName'] ?? 'No OriginalName',
    );
  }
}

class Mentor {
  String? name;

  Mentor({required this.name});

  factory Mentor.fromJson(Map<String, dynamic> json) {
    return Mentor(name: json['name']);
  }
}

class Advisor {
  String? email;
  String? name;

  Advisor({
    required this.email,
    required this.name,
  });

  factory Advisor.fromJson(Map<String, dynamic> json) {
    return Advisor(email: json['email'], name: json['name']);
  }
}

class Qualification {
  String? name;

  Qualification({required this.name});

  factory Qualification.fromJson(Map<String, dynamic> json) {
    return Qualification(name: json['name']);
  }
}

class Branch {
  String? name;

  Branch({required this.name});

  factory Branch.fromJson(Map<String, dynamic> json) {
    return Branch(name: json['name']);
  }
}

class Space {
  String? name;

  Space({required this.name});

  factory Space.fromJson(Map<String, dynamic> json) {
    return Space(name: json['name']);
  }
}

class Institution {
  String? name;

  Institution({required this.name});

  factory Institution.fromJson(Map<String, dynamic> json) {
    return Institution(name: json['name']);
  }
}
