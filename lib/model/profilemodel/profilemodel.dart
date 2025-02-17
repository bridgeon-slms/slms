// import 'dart:convert';

// class StudentModel {
//   final String? id;
//   final String? name;
//   final String? email;
//   final String? phone;
//   final Guardian? guardian;
//   final List<SocialLink>? socialLinks;
//   final List<Course>? courses;
//   final Advisor? advisor;
//   final List<FeeStructure>? feeStructures;
//   final List<Document>? documents;
//   final List<WorkShift>? workShifts;

//   StudentModel({
//     this.id,
//     this.name,
//     this.email,
//     this.phone,
//     this.guardian,
//     this.socialLinks,
//     this.courses,
//     this.advisor,
//     this.feeStructures,
//     this.documents,
//     this.workShifts,
//   });

//   factory StudentModel.fromJson(Map<String, dynamic> json) {
//     return StudentModel(
//       id: json['id'] as String?,
//       name: json['name'] as String?,
//       email: json['email'] as String?,
//       phone: json['phone'] as String?,
//       guardian:
//           json['guardian'] != null ? Guardian.fromJson(json['guardian']) : null,
//       socialLinks: (json['socialLinks'] as List?)
//           ?.map((e) => SocialLink.fromJson(e as Map<String, dynamic>))
//           .toList(),
//       courses: (json['courses'] as List?)
//           ?.map((e) => Course.fromJson(e as Map<String, dynamic>))
//           .toList(),
//       advisor:
//           json['advisor'] != null ? Advisor.fromJson(json['advisor']) : null,
//       feeStructures: (json['feeStructures'] as List?)
//           ?.map((e) => FeeStructure.fromJson(e as Map<String, dynamic>))
//           .toList(),
//       documents: (json['documents'] as List?)
//           ?.map((e) => Document.fromJson(e as Map<String, dynamic>))
//           .toList(),
//       workShifts: (json['workShifts'] as List?)
//           ?.map((e) => WorkShift.fromJson(e as Map<String, dynamic>))
//           .toList(),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'email': email,
//       'phone': phone,
//       'guardian': guardian?.toJson(),
//       'socialLinks': socialLinks?.map((e) => e.toJson()).toList(),
//       'courses': courses?.map((e) => e.toJson()).toList(),
//       'advisor': advisor?.toJson(),
//       'feeStructures': feeStructures?.map((e) => e.toJson()).toList(),
//       'documents': documents?.map((e) => e.toJson()).toList(),
//       'workShifts': workShifts?.map((e) => e.toJson()).toList(),
//     };
//   }

//   StudentModel copyWith({
//     String? id,
//     String? name,
//     String? email,
//     String? phone,
//     Guardian? guardian,
//     List<SocialLink>? socialLinks,
//     List<Course>? courses,
//     Advisor? advisor,
//     List<FeeStructure>? feeStructures,
//     List<Document>? documents,
//     List<WorkShift>? workShifts,
//   }) {
//     return StudentModel(
//       id: id ?? this.id,
//       name: name ?? this.name,
//       email: email ?? this.email,
//       phone: phone ?? this.phone,
//       guardian: guardian ?? this.guardian,
//       socialLinks: socialLinks ?? this.socialLinks,
//       courses: courses ?? this.courses,
//       advisor: advisor ?? this.advisor,
//       feeStructures: feeStructures ?? this.feeStructures,
//       documents: documents ?? this.documents,
//       workShifts: workShifts ?? this.workShifts,
//     );
//   }

//   @override
//   String toString() {
//     return 'StudentModel(id: $id, name: $name, email: $email, phone: $phone, guardian: $guardian, socialLinks: $socialLinks, courses: $courses, advisor: $advisor, feeStructures: $feeStructures, documents: $documents, workShifts: $workShifts)';
//   }
// }

// class Guardian {
//   final String? name;
//   final String? contact;

//   Guardian({this.name, this.contact});

//   factory Guardian.fromJson(Map<String, dynamic> json) => Guardian(
//         name: json['name'] as String?,
//         contact: json['contact'] as String?,
//       );

//   Map<String, dynamic> toJson() => {
//         'name': name,
//         'contact': contact,
//       };
// }

// class SocialLink {
//   final String? platform;
//   final String? url;

//   SocialLink({this.platform, this.url});

//   factory SocialLink.fromJson(Map<String, dynamic> json) => SocialLink(
//         platform: json['platform'] as String?,
//         url: json['url'] as String?,
//       );

//   Map<String, dynamic> toJson() => {
//         'platform': platform,
//         'url': url,
//       };
// }

// class Course {
//   final String? title;
//   final String? code;

//   Course({this.title, this.code});

//   factory Course.fromJson(Map<String, dynamic> json) => Course(
//         title: json['title'] as String?,
//         code: json['code'] as String?,
//       );

//   Map<String, dynamic> toJson() => {
//         'title': title,
//         'code': code,
//       };
// }

// class Advisor {
//   final String? name;

//   Advisor({this.name});

//   factory Advisor.fromJson(Map<String, dynamic> json) => Advisor(
//         name: json['name'] as String?,
//       );

//   Map<String, dynamic> toJson() => {
//         'name': name,
//       };
// }

// class FeeStructure {
//   final double? amount;
//   final String? type;

//   FeeStructure({this.amount, this.type});

//   factory FeeStructure.fromJson(Map<String, dynamic> json) => FeeStructure(
//         amount: (json['amount'] as num?)?.toDouble(),
//         type: json['type'] as String?,
//       );

//   Map<String, dynamic> toJson() => {
//         'amount': amount,
//         'type': type,
//       };
// }

// class Document {
//   final String? title;
//   final String? url;

//   Document({this.title, this.url});

//   factory Document.fromJson(Map<String, dynamic> json) => Document(
//         title: json['title'] as String?,
//         url: json['url'] as String?,
//       );

//   Map<String, dynamic> toJson() => {
//         'title': title,
//         'url': url,
//       };
// }

// class WorkShift {
//   final String? shift;
//   final String? timing;

//   WorkShift({this.shift, this.timing});

//   factory WorkShift.fromJson(Map<String, dynamic> json) => WorkShift(
//         shift: json['shift'] as String?,
//         timing: json['timing'] as String?,
//       );

//   Map<String, dynamic> toJson() => {
//         'shift': shift,
//         'timing': timing,
//       };
// }

import 'dart:convert';

class StudentModel {
  final String? id;
  final String? name;
  final String? email;
  final String? phone;
  final Guardian? guardian;
  final List<SocialLink>? socialLinks;
  final List<Course>? courses;
  final Advisor? advisor;
  final List<FeeStructure>? feeStructures;
  final List<Document>? documents;
  final List<WorkShift>? workShifts;

  const StudentModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.guardian,
    this.socialLinks,
    this.courses,
    this.advisor,
    this.feeStructures,
    this.documents,
    this.workShifts,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
        id: json['id'] as String?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        phone: json['phone'] as String?,
        guardian: json['guardian'] != null
            ? Guardian.fromJson(json['guardian'])
            : null,
        socialLinks: (json['socialLinks'] as List?)
            ?.map((e) => SocialLink.fromJson(e as Map<String, dynamic>))
            .toList(),
        courses: (json['courses'] as List?)
            ?.map((e) => Course.fromJson(e as Map<String, dynamic>))
            .toList(),
        advisor:
            json['advisor'] != null ? Advisor.fromJson(json['advisor']) : null,
        feeStructures: (json['feeStructures'] as List?)
            ?.map((e) => FeeStructure.fromJson(e as Map<String, dynamic>))
            .toList(),
        documents: (json['documents'] as List?)
            ?.map((e) => Document.fromJson(e as Map<String, dynamic>))
            .toList(),
        workShifts: (json['workShifts'] as List?)
            ?.map((e) => WorkShift.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'guardian': guardian?.toJson(),
        'socialLinks': socialLinks?.map((e) => e.toJson()).toList(),
        'courses': courses?.map((e) => e.toJson()).toList(),
        'advisor': advisor?.toJson(),
        'feeStructures': feeStructures?.map((e) => e.toJson()).toList(),
        'documents': documents?.map((e) => e.toJson()).toList(),
        'workShifts': workShifts?.map((e) => e.toJson()).toList(),
      };

  StudentModel copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    Guardian? guardian,
    List<SocialLink>? socialLinks,
    List<Course>? courses,
    Advisor? advisor,
    List<FeeStructure>? feeStructures,
    List<Document>? documents,
    List<WorkShift>? workShifts,
  }) =>
      StudentModel(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        guardian: guardian ?? this.guardian,
        socialLinks: socialLinks ?? this.socialLinks,
        courses: courses ?? this.courses,
        advisor: advisor ?? this.advisor,
        feeStructures: feeStructures ?? this.feeStructures,
        documents: documents ?? this.documents,
        workShifts: workShifts ?? this.workShifts,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          email == other.email &&
          phone == other.phone;

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ email.hashCode ^ phone.hashCode;

  @override
  String toString() => jsonEncode(toJson());
}

class Guardian {
  final String? name;
  final String? contact;

  const Guardian({this.name, this.contact});

  factory Guardian.fromJson(Map<String, dynamic> json) => Guardian(
        name: json['name'] as String?,
        contact: json['contact'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'contact': contact,
      };
}

class SocialLink {
  final String? platform;
  final String? url;

  const SocialLink({this.platform, this.url});

  factory SocialLink.fromJson(Map<String, dynamic> json) => SocialLink(
        platform: json['platform'] as String?,
        url: json['url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'platform': platform,
        'url': url,
      };
}

class Course {
  final String? title;
  final String? code;

  const Course({this.title, this.code});

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        title: json['title'] as String?,
        code: json['code'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'code': code,
      };
}

class Advisor {
  final String? name;

  const Advisor({this.name});

  factory Advisor.fromJson(Map<String, dynamic> json) => Advisor(
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
      };
}

class FeeStructure {
  final double? amount;
  final String? type;

  const FeeStructure({this.amount, this.type});

  factory FeeStructure.fromJson(Map<String, dynamic> json) => FeeStructure(
        amount: (json['amount'] as num?)?.toDouble(),
        type: json['type'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'type': type,
      };
}

class Document {
  final String? title;
  final String? url;

  const Document({this.title, this.url});

  factory Document.fromJson(Map<String, dynamic> json) => Document(
        title: json['title'] as String?,
        url: json['url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'url': url,
      };
}

class WorkShift {
  final String? shift;
  final String? timing;

  const WorkShift({this.shift, this.timing});

  factory WorkShift.fromJson(Map<String, dynamic> json) => WorkShift(
        shift: json['shift'] as String?,
        timing: json['timing'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'shift': shift,
        'timing': timing,
      };
}
