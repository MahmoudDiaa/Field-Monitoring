import 'package:floor/floor.dart';

import '../../../../../models/incident/transaction/incident_transaction.dart';

@entity
class IncidentTransactionEntity {
  @primaryKey
  String? id;
  String? userFullName;
  String? createdDate;
  String? statusArabicName;
  String? statusEnglishName;
  String? incidentStatusArabicName;
  String? incidentStatusEnglishName;
  String? statusColor;
  String? notes;
  String? lat;
  String? long;
  int? attachmentsCount;


  IncidentTransactionEntity(
      {this.id,
      this.userFullName,
      this.createdDate,
      this.statusArabicName,
      this.statusEnglishName,
      this.incidentStatusArabicName,
      this.incidentStatusEnglishName,
      this.statusColor,
      this.notes,
      this.lat,
      this.long,
      this.attachmentsCount});

  IncidentTransactionEntity.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    userFullName = json['userFullName'];
    createdDate = json['createdDate'];
    statusArabicName = json['statusArabicName'];
    statusEnglishName = json['statusEnglishName'];
    incidentStatusArabicName = json['incidentStatusArabicName'];
    incidentStatusEnglishName = json['incidentStatusEnglishName'];
    statusColor = json['statusColor'];
    notes = json['notes'];
    lat = json['lat'];
    long = json['long'];
    attachmentsCount = json['attachmentsCount'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userFullName'] = this.userFullName;
    data['createdDate'] = this.createdDate;
    data['statusArabicName'] = this.statusArabicName;
    data['statusEnglishName'] = this.statusEnglishName;
    data['incidentStatusArabicName'] = this.incidentStatusArabicName;
    data['incidentStatusEnglishName'] = this.incidentStatusEnglishName;
    data['statusColor'] = this.statusColor;
    data['notes'] = this.notes;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['attachmentsCount'] = this.attachmentsCount;
    return data;
  }

  IncidentTransaction mapToRemoteOne() => IncidentTransaction(
      id: id,
      userFullName: userFullName,
      createdDate: createdDate,
      statusArabicName: statusArabicName,
      incidentStatusArabicName: incidentStatusArabicName,
      incidentStatusEnglishName: incidentStatusEnglishName,
      statusColor: statusColor,
      notes: notes,
      lat: lat,
      long: long,
      attachmentsCount: attachmentsCount);
}
