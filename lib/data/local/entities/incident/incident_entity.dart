import 'dart:io';

import 'package:boilerplate/data/local/entities/incident/transaction/incident_transaction_entity.dart';
import 'package:boilerplate/data/local/type_converter/converter.dart';
import 'package:boilerplate/models/incident/incident.dart';
import 'package:floor/floor.dart';

import 'incident_image_entity.dart';
import 'dart:convert';

@entity
class IncidentEntity {
  int? categoryId;
  String? images;

  String? xFiles;

  String? transactions;

  double? amountValue;
  int? subCategoryId;
  int? amountUnitId;
  String? amountUnitName;

  @primaryKey
  String? id;
  String? lat;
  String? long;
  String? notes;
  String? createDate;
  String? createHijriDate;
  String? createTime;
  String? incidentStatusArabicName;
  String? incidentStatusEnglishName;
  String? incidentStatusColor;
  String? incidentUnitArabicName;
  String? incidentUnitEnglishName;
  double? unitValue;
  String? districtName;
  String? streetName;
  String? address;
  String? incidentCategoryArabicName;
  String? incidentCategoryEnglishName;
  String? incidentSubCategoryArabicName;
  String? incidentSubCategoryEnglishName;
  bool? isNew;
  String? userFullName;
  int? imagesCount;
  int? transactonCount;
  int? priority;
  String? priorityTextArabic;
  String? priorityTextEnglish;
  int? incidentStatusId;

  IncidentEntity({
    this.id,
    this.lat,
    this.long,
    this.notes,
    this.createDate,
    this.createHijriDate,
    this.createTime,
    this.incidentStatusArabicName,
    this.incidentStatusEnglishName,
    this.incidentStatusColor,
    this.incidentUnitArabicName,
    this.incidentUnitEnglishName,
    this.unitValue,
    this.districtName,
    this.streetName,
    this.address,
    this.incidentCategoryArabicName,
    this.incidentCategoryEnglishName,
    this.incidentSubCategoryArabicName,
    this.incidentSubCategoryEnglishName,
    this.isNew,
    this.userFullName,
    this.imagesCount,
    this.transactonCount,
    this.priority,
    this.incidentStatusId,
  });

  getPriorityText(priority, lan) {
    switch (priority) {
      case 1:
        return lan == 'ar' ? 'منخفضة' : 'Low';

      case 2:
        return lan == 'ar' ? 'متوسط' : 'Medium';

      case 3:
        return lan == 'ar' ? 'عالي' : 'High';

      default:
        return lan == 'ar' ? 'غير محدد' : 'Unknown';
    }
  }

  IncidentEntity.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    lat = json['lat'];
    long = json['long'];
    notes = json['notes'];
    createDate = json['createDate'];
    createHijriDate = json['createHijriDate'];
    createTime = json['createTime'];
    incidentStatusArabicName = json['incidentStatusArabicName'];
    incidentStatusEnglishName = json['incidentStatusEnglishName'];
    incidentStatusColor = json['incidentStatusColor'];
    incidentUnitArabicName = json['incidentUnitArabicName'];
    incidentUnitEnglishName = json['incidentUnitEnglishName'];
    unitValue = json['unitValue'] == null ? null : json['unitValue'];
    districtName = json['districtName'];
    streetName = json['streetName'];
    address = json['address'];
    incidentCategoryArabicName = json['incidentCategoryArabicName'];
    incidentCategoryEnglishName = json['incidentCategoryEnglishName'];
    incidentSubCategoryArabicName = json['incidentSubCategoryArabicName'];
    incidentSubCategoryEnglishName = json['incidentSubCategoryEnglishName'];
    isNew = json['isNew'];
    userFullName = json['userFullName'];
    imagesCount = json['imagesCount'];
    transactonCount = json['transactonCount'];
    priority = json['priority'];
    priorityTextArabic = getPriorityText(json['priority'], 'ar');
    priorityTextEnglish = getPriorityText(json['priority'], 'en');
    incidentStatusId = json['incidentStatusId'];

    if (json['images'] != null) {
      images = Converters().convertToString((json['images'] as List)
          .map((e) => IncidentImageEntity.fromJson(e))
          .toList());
    }
    transactions = Converters().convertToString(json['transactions'] == null
        ? []
        : (json['transactions'] as List<dynamic>)
            .map((e) => IncidentTransactionEntity.fromMap(e))
            .toList());
  }

  Map<String, dynamic> toMap() {
    var images = [];
    Converters().convertToList(xFiles!).forEach((element) {
      images.add({
        'ImageBase64': "data:image/png;base64," +
            base64Encode(File(element.path).readAsBytesSync()),
        'isPrimary': false
      });
    });
    if (images.length > 0) images[0]['isPrimary'] = true;

    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CategoryId'] = this.categoryId;
    data['SubCategoryId'] = this.subCategoryId;
    data['IsImagesBase64'] = true;
    data['lat'] = lat ?? "27.503035";
    data['long'] = long ?? "41.709509";
    data['districtName'] = districtName;
    data['streetName'] = streetName;
    data['address'] = address;
    data['AmountUnitId'] = this.amountUnitId;
    data['UnitValue'] = this.amountValue;
    data['notes'] = this.notes;
    data['Images'] = Converters().convertToString(images);
    data['priority'] = priority;
    data['incidentStatusId'] = incidentStatusId;

    return data;
  }

  Incident toRemote() => Incident(
        long: long,
        lat: lat,
        notes: notes,
        incidentStatusEnglishName: incidentStatusEnglishName,
        incidentStatusArabicName: incidentStatusArabicName,
        userFullName: userFullName,
        id: id,
        address: address,
        createDate: DateTime.parse(createDate!),
        createHijriDate: createHijriDate,
        createTime: createTime,
        districtName: districtName,
        imagesCount: imagesCount,
        incidentCategoryArabicName: incidentStatusArabicName,
        incidentCategoryEnglishName: incidentCategoryEnglishName,
        incidentStatusColor: incidentStatusColor,
        incidentStatusId: incidentStatusId,
        incidentSubCategoryArabicName: incidentSubCategoryArabicName,
        incidentSubCategoryEnglishName: incidentSubCategoryEnglishName,
        incidentUnitArabicName: incidentUnitArabicName,
        incidentUnitEnglishName: incidentUnitEnglishName,
        isNew: isNew,
        priority: priority,
        streetName: streetName,
        transactonCount: transactonCount,
        unitValue: unitValue,
      );

  factory IncidentEntity.fromRemote(Incident incident) => IncidentEntity(
        id: incident.id,
        lat: incident.lat,
        long: incident.long,
        notes: incident.notes,
        createDate: incident.createDate.toString(),
        createHijriDate: incident.createHijriDate,
        createTime: incident.createTime,
        incidentStatusArabicName: incident.incidentStatusArabicName,
        incidentStatusEnglishName: incident.incidentStatusEnglishName,
        incidentStatusColor: incident.incidentStatusColor,
        incidentUnitArabicName: incident.incidentUnitArabicName,
        incidentUnitEnglishName: incident.incidentUnitEnglishName,
        unitValue: incident.unitValue,
        districtName: incident.districtName,
        streetName: incident.streetName,
        address: incident.address,
        incidentCategoryArabicName: incident.incidentCategoryArabicName,
        incidentCategoryEnglishName: incident.incidentCategoryEnglishName,
        incidentSubCategoryArabicName: incident.incidentSubCategoryArabicName,
        incidentSubCategoryEnglishName: incident.incidentSubCategoryArabicName,
        isNew: incident.isNew,
        userFullName: incident.userFullName,
        imagesCount: incident.imagesCount,
        transactonCount: incident.transactonCount,
        priority: incident.priority,
        incidentStatusId: incident.incidentStatusId,
      );
}
