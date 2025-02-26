// Model for the complete API response
class FeesApiResponse {
  final String status;
  final String message;
  final FeesData data;

  FeesApiResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory FeesApiResponse.fromJson(Map<String, dynamic> json) {
    return FeesApiResponse(
      status: json['status'],
      message: json['message'],
      data: FeesData.fromJson(json['data']),
    );
  }
}
class FeesData {
  final List<DueList> dueLists;

  FeesData({required this.dueLists});

  factory FeesData.fromJson(Map<String, dynamic> json) {
    return FeesData(
      dueLists: (json['dueLists'] as List)
          .map((dueList) => DueList.fromJson(dueList))
          .toList(),
    );
  }
}
class DueList {
  final String id;
  final Student studentId;
  final FeesRecord feesRecordId;
  final DateTime dueDate;
  final List<String> receiptId;
  final double dueAmount;
  final double balance;
  final double discountAmount;
  final bool isPaid;
  final bool isDeleted;
  final CreatedBy createdBy;
  final DateTime createdDate;
  final DateTime updatedDate;

  DueList({
    required this.id,
    required this.studentId,
    required this.feesRecordId,
    required this.dueDate,
    required this.receiptId,
    required this.dueAmount,
    required this.balance,
    required this.discountAmount,
    required this.isPaid,
    required this.isDeleted,
    required this.createdBy,
    required this.createdDate,
    required this.updatedDate,
  });

  factory DueList.fromJson(Map<String, dynamic> json) {
    return DueList(
      id: json['_id'],
      studentId: Student.fromJson(json['studentId']),
      feesRecordId: FeesRecord.fromJson(json['feesRecordId']),
      dueDate: DateTime.parse(json['dueDate']),
      receiptId: List<String>.from(json['receiptId']),
      dueAmount: json['dueAmount'].toDouble(),
      balance: json['balance'].toDouble(),
      discountAmount: json['discountAmount'].toDouble(),
      isPaid: json['isPaid'],
      isDeleted: json['isDeleted'],
      createdBy: CreatedBy.fromJson(json['createdBy']),
      createdDate: DateTime.parse(json['createdDate']),
      updatedDate: DateTime.parse(json['updatedDate']),
    );
  }
}

class Student {
  final String id;
  final String name;
  final Batch batch;
  final Advisor advisor;

  Student({
    required this.id,
    required this.name,
    required this.batch,
    required this.advisor,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['_id'],
      name: json['name'],
      batch: Batch.fromJson(json['batch']),
      advisor: Advisor.fromJson(json['advisor']),
    );
  }
}

class Batch {
  final String id;
  final String name;

  Batch({required this.id, required this.name});

  factory Batch.fromJson(Map<String, dynamic> json) {
    return Batch(
      id: json['_id'],
      name: json['name'],
    );
  }
}

class Advisor {
  final String id;
  final String name;

  Advisor({required this.id, required this.name});

  factory Advisor.fromJson(Map<String, dynamic> json) {
    return Advisor(
      id: json['_id'],
      name: json['name'],
    );
  }
}

class FeesRecord {
  final String id;
  final FeeStructure feeStructureId;
  final double totalAmountRecieved;
  final double totalAmount;

  FeesRecord({
    required this.id,
    required this.feeStructureId,
    required this.totalAmountRecieved,
    required this.totalAmount,
  });

  factory FeesRecord.fromJson(Map<String, dynamic> json) {
    return FeesRecord(
      id: json['_id'],
      feeStructureId: FeeStructure.fromJson(json['feeStructureId']),
      totalAmountRecieved: json['totalAmountRecieved'].toDouble(),
      totalAmount: json['totalAmount'].toDouble(),
    );
  }
}

class FeeStructure {
  final String id;
  final String title;
  final String accountSubHeadId;
  final String tag;

  FeeStructure({
    required this.id,
    required this.title,
    required this.accountSubHeadId,
    required this.tag,
  });

  factory FeeStructure.fromJson(Map<String, dynamic> json) {
    return FeeStructure(
      id: json['_id'],
      title: json['title'],
      accountSubHeadId: json['accountSubHeadId'],
      tag: json['tag'],
    );
  }
}

class CreatedBy {
  final String id;
  final String name;

  CreatedBy({required this.id, required this.name});

  factory CreatedBy.fromJson(Map<String, dynamic> json) {
    return CreatedBy(
      id: json['_id'],
      name: json['name'],
    );
  }
}