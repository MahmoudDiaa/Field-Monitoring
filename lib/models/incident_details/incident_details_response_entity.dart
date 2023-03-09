import 'package:Field_Monitoring/generated/json/base/json_field.dart';
import 'package:Field_Monitoring/generated/json/incident_details_response_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class IncidentDetailsResponseEntity {

	IncidentDetailsResponseData? data;
  
  IncidentDetailsResponseEntity();

  factory IncidentDetailsResponseEntity.fromJson(Map<String, dynamic> json) => $IncidentDetailsResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $IncidentDetailsResponseEntityToJson(this);

  IncidentDetailsResponseEntity copyWith({IncidentDetailsResponseData? data}) {
      return IncidentDetailsResponseEntity()..data= data ?? this.data;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class IncidentDetailsResponseData {

	String? lat;
	String? long;
	String? notes;
	String? createDate;
	String? createHijriDate;
	String? createTime;
	String? incidentStatusColor;
	String? districtName;
	String? streetName;
	String? address;
	bool? isNew;
	String? userFullName;
	int? imagesCount;
	int? departmentID;
	int? neighborhoodID;
	int? roadID;
	String? updateDate;
	String? updatedByUserId;
	String? assigningDate;
	String? assigningNote;
	String? updateStatusDate;
	String? statusNote;
	int? unitValue;
	String? statusLong;
	String? statusLat;
	String? statusLocation;
	String? mobadra;
	IncidentDetailsResponseDataStatus? status;
	IncidentDetailsResponseDataPriorityLevel? priorityLevel;
	IncidentDetailsResponseDataCategory? category;
	IncidentDetailsResponseDataSubCategory? subCategory;
	IncidentDetailsResponseDataAmountUnit? amountUnit;
	List<IncidentDetailsResponseDataImages>? images;
	List<IncidentDetailsResponseDataIncidentHistory>? incidentHistory;
  
  IncidentDetailsResponseData();

  factory IncidentDetailsResponseData.fromJson(Map<String, dynamic> json) => $IncidentDetailsResponseDataFromJson(json);

  Map<String, dynamic> toJson() => $IncidentDetailsResponseDataToJson(this);

  IncidentDetailsResponseData copyWith({String? lat, String? long, String? notes, String? createDate, String? createHijriDate, String? createTime, String? incidentStatusColor, String? districtName, String? streetName, String? address, bool? isNew, String? userFullName, int? imagesCount, int? departmentID, int? neighborhoodID, int? roadID, String? updateDate, String? updatedByUserId, String? assigningDate, String? assigningNote, String? updateStatusDate, String? statusNote, int? unitValue, String? statusLong, String? statusLat, String? statusLocation, String? mobadra, IncidentDetailsResponseDataStatus? status, IncidentDetailsResponseDataPriorityLevel? priorityLevel, IncidentDetailsResponseDataCategory? category, IncidentDetailsResponseDataSubCategory? subCategory, IncidentDetailsResponseDataAmountUnit? amountUnit, List<IncidentDetailsResponseDataImages>? images, List<IncidentDetailsResponseDataIncidentHistory>? incidentHistory}) {
      return IncidentDetailsResponseData()..lat= lat ?? this.lat
			..long= long ?? this.long
			..notes= notes ?? this.notes
			..createDate= createDate ?? this.createDate
			..createHijriDate= createHijriDate ?? this.createHijriDate
			..createTime= createTime ?? this.createTime
			..incidentStatusColor= incidentStatusColor ?? this.incidentStatusColor
			..districtName= districtName ?? this.districtName
			..streetName= streetName ?? this.streetName
			..address= address ?? this.address
			..isNew= isNew ?? this.isNew
			..userFullName= userFullName ?? this.userFullName
			..imagesCount= imagesCount ?? this.imagesCount
			..departmentID= departmentID ?? this.departmentID
			..neighborhoodID= neighborhoodID ?? this.neighborhoodID
			..roadID= roadID ?? this.roadID
			..updateDate= updateDate ?? this.updateDate
			..updatedByUserId= updatedByUserId ?? this.updatedByUserId
			..assigningDate= assigningDate ?? this.assigningDate
			..assigningNote= assigningNote ?? this.assigningNote
			..updateStatusDate= updateStatusDate ?? this.updateStatusDate
			..statusNote= statusNote ?? this.statusNote
			..unitValue= unitValue ?? this.unitValue
			..statusLong= statusLong ?? this.statusLong
			..statusLat= statusLat ?? this.statusLat
			..statusLocation= statusLocation ?? this.statusLocation
			..mobadra= mobadra ?? this.mobadra
			..status= status ?? this.status
			..priorityLevel= priorityLevel ?? this.priorityLevel
			..category= category ?? this.category
			..subCategory= subCategory ?? this.subCategory
			..amountUnit= amountUnit ?? this.amountUnit
			..images= images ?? this.images
			..incidentHistory= incidentHistory ?? this.incidentHistory;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class IncidentDetailsResponseDataStatus {

	int? id;
	String? arabicName;
	String? englishName;
	int? incidentsCount;
  
  IncidentDetailsResponseDataStatus();

  factory IncidentDetailsResponseDataStatus.fromJson(Map<String, dynamic> json) => $IncidentDetailsResponseDataStatusFromJson(json);

  Map<String, dynamic> toJson() => $IncidentDetailsResponseDataStatusToJson(this);

  IncidentDetailsResponseDataStatus copyWith({int? id, String? arabicName, String? englishName, int? incidentsCount}) {
      return IncidentDetailsResponseDataStatus()..id= id ?? this.id
			..arabicName= arabicName ?? this.arabicName
			..englishName= englishName ?? this.englishName
			..incidentsCount= incidentsCount ?? this.incidentsCount;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class IncidentDetailsResponseDataPriorityLevel {

	int? id;
	String? arabicName;
	String? englishName;
	String? colorCode;
  
  IncidentDetailsResponseDataPriorityLevel();

  factory IncidentDetailsResponseDataPriorityLevel.fromJson(Map<String, dynamic> json) => $IncidentDetailsResponseDataPriorityLevelFromJson(json);

  Map<String, dynamic> toJson() => $IncidentDetailsResponseDataPriorityLevelToJson(this);

  IncidentDetailsResponseDataPriorityLevel copyWith({int? id, String? arabicName, String? englishName, String? colorCode}) {
      return IncidentDetailsResponseDataPriorityLevel()..id= id ?? this.id
			..arabicName= arabicName ?? this.arabicName
			..englishName= englishName ?? this.englishName
			..colorCode= colorCode ?? this.colorCode;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class IncidentDetailsResponseDataCategory {

	int? id;
	int? incidentsCount;
	int? subCategoryCount;
	List<dynamic>? subCategoryList;
	String? arabicName;
	String? englishName;
	String? icon;
	int? order;
	String? color;
  
  IncidentDetailsResponseDataCategory();

  factory IncidentDetailsResponseDataCategory.fromJson(Map<String, dynamic> json) => $IncidentDetailsResponseDataCategoryFromJson(json);

  Map<String, dynamic> toJson() => $IncidentDetailsResponseDataCategoryToJson(this);

  IncidentDetailsResponseDataCategory copyWith({int? id, int? incidentsCount, int? subCategoryCount, List<dynamic>? subCategoryList, String? arabicName, String? englishName, String? icon, int? order, String? color}) {
      return IncidentDetailsResponseDataCategory()..id= id ?? this.id
			..incidentsCount= incidentsCount ?? this.incidentsCount
			..subCategoryCount= subCategoryCount ?? this.subCategoryCount
			..subCategoryList= subCategoryList ?? this.subCategoryList
			..arabicName= arabicName ?? this.arabicName
			..englishName= englishName ?? this.englishName
			..icon= icon ?? this.icon
			..order= order ?? this.order
			..color= color ?? this.color;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class IncidentDetailsResponseDataSubCategory {

	int? id;
	int? incidentsCount;
	int? categoryId;
	String? icon;
	int? amountUnitId;
	String? amountUnitArabicName;
	String? amountUnitEnglishName;
	String? categoryArabicName;
	String? categoryEnglishName;
	String? arabicName;
	String? englishName;
	int? mainCategoryId;
	int? order;
	String? color;
	String? file;
  
  IncidentDetailsResponseDataSubCategory();

  factory IncidentDetailsResponseDataSubCategory.fromJson(Map<String, dynamic> json) => $IncidentDetailsResponseDataSubCategoryFromJson(json);

  Map<String, dynamic> toJson() => $IncidentDetailsResponseDataSubCategoryToJson(this);

  IncidentDetailsResponseDataSubCategory copyWith({int? id, int? incidentsCount, int? categoryId, String? icon, int? amountUnitId, String? amountUnitArabicName, String? amountUnitEnglishName, String? categoryArabicName, String? categoryEnglishName, String? arabicName, String? englishName, int? mainCategoryId, int? order, String? color, String? file}) {
      return IncidentDetailsResponseDataSubCategory()..id= id ?? this.id
			..incidentsCount= incidentsCount ?? this.incidentsCount
			..categoryId= categoryId ?? this.categoryId
			..icon= icon ?? this.icon
			..amountUnitId= amountUnitId ?? this.amountUnitId
			..amountUnitArabicName= amountUnitArabicName ?? this.amountUnitArabicName
			..amountUnitEnglishName= amountUnitEnglishName ?? this.amountUnitEnglishName
			..categoryArabicName= categoryArabicName ?? this.categoryArabicName
			..categoryEnglishName= categoryEnglishName ?? this.categoryEnglishName
			..arabicName= arabicName ?? this.arabicName
			..englishName= englishName ?? this.englishName
			..mainCategoryId= mainCategoryId ?? this.mainCategoryId
			..order= order ?? this.order
			..color= color ?? this.color
			..file= file ?? this.file;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class IncidentDetailsResponseDataAmountUnit {

	int? id;
	int? incidentsCount;
	int? subCategoryCount;
	String? arabicName;
	String? englishName;
  
  IncidentDetailsResponseDataAmountUnit();

  factory IncidentDetailsResponseDataAmountUnit.fromJson(Map<String, dynamic> json) => $IncidentDetailsResponseDataAmountUnitFromJson(json);

  Map<String, dynamic> toJson() => $IncidentDetailsResponseDataAmountUnitToJson(this);

  IncidentDetailsResponseDataAmountUnit copyWith({int? id, int? incidentsCount, int? subCategoryCount, String? arabicName, String? englishName}) {
      return IncidentDetailsResponseDataAmountUnit()..id= id ?? this.id
			..incidentsCount= incidentsCount ?? this.incidentsCount
			..subCategoryCount= subCategoryCount ?? this.subCategoryCount
			..arabicName= arabicName ?? this.arabicName
			..englishName= englishName ?? this.englishName;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class IncidentDetailsResponseDataImages {

	String? name;
	String? imageBase64;
	String? file;
	String? path;
	bool? isPrimary;
  
  IncidentDetailsResponseDataImages();

  factory IncidentDetailsResponseDataImages.fromJson(Map<String, dynamic> json) => $IncidentDetailsResponseDataImagesFromJson(json);

  Map<String, dynamic> toJson() => $IncidentDetailsResponseDataImagesToJson(this);

  IncidentDetailsResponseDataImages copyWith({String? name, String? imageBase64, String? file, String? path, bool? isPrimary}) {
      return IncidentDetailsResponseDataImages()..name= name ?? this.name
			..imageBase64= imageBase64 ?? this.imageBase64
			..file= file ?? this.file
			..path= path ?? this.path
			..isPrimary= isPrimary ?? this.isPrimary;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class IncidentDetailsResponseDataIncidentHistory {

	String? id;
	String? incidentId;
	IncidentDetailsResponseDataIncidentHistoryIncident? incident;
	String? historyCreationDate;
	List<IncidentDetailsResponseDataIncidentHistoryHistoricalImages>? historicalImages;
	String? notes;
	String? createDate;
	String? createHijriDate;
	String? createTime;
	String? districtName;
	String? streetName;
	String? address;
	String? lat;
	String? long;
	String? location;
	int? unitValue;
	int? amountUnitId;
	String? amountUnit;
	int? categoryId;
	String? category;
	int? subCategoryId;
	String? subCategory;
	int? incidentStatusId;
	String? status;
	String? updateStatusDate;
	String? statusNote;
	String? statusUpdateUserId;
	String? statusUpdateUser;
	String? statusLat;
	String? statusLong;
	String? statusLocation;
	String? assignedUserId;
	String? assigningDate;
	String? assigningNote;
	IncidentDetailsResponseDataIncidentHistoryAssignedUser? assignedUser;
	String? createdUserId;
	String? createdUser;
	String? updateDate;
	String? updatedByUserId;
	String? updatedByUser;
	String? baladiaID;
	String? baladia;
	int? departmentID;
	String? department;
	int? neighborhoodID;
	String? neighborhood;
	int? roadID;
	String? road;
	String? mobadraID;
	String? mobadra;
	int? priorityLevelID;
	String? priorityLevel;
  
  IncidentDetailsResponseDataIncidentHistory();

  factory IncidentDetailsResponseDataIncidentHistory.fromJson(Map<String, dynamic> json) => $IncidentDetailsResponseDataIncidentHistoryFromJson(json);

  Map<String, dynamic> toJson() => $IncidentDetailsResponseDataIncidentHistoryToJson(this);

  IncidentDetailsResponseDataIncidentHistory copyWith({String? id, String? incidentId, IncidentDetailsResponseDataIncidentHistoryIncident? incident, String? historyCreationDate, List<IncidentDetailsResponseDataIncidentHistoryHistoricalImages>? historicalImages, String? notes, String? createDate, String? createHijriDate, String? createTime, String? districtName, String? streetName, String? address, String? lat, String? long, String? location, int? unitValue, int? amountUnitId, String? amountUnit, int? categoryId, String? category, int? subCategoryId, String? subCategory, int? incidentStatusId, String? status, String? updateStatusDate, String? statusNote, String? statusUpdateUserId, String? statusUpdateUser, String? statusLat, String? statusLong, String? statusLocation, String? assignedUserId, String? assigningDate, String? assigningNote, IncidentDetailsResponseDataIncidentHistoryAssignedUser? assignedUser, String? createdUserId, String? createdUser, String? updateDate, String? updatedByUserId, String? updatedByUser, String? baladiaID, String? baladia, int? departmentID, String? department, int? neighborhoodID, String? neighborhood, int? roadID, String? road, String? mobadraID, String? mobadra, int? priorityLevelID, String? priorityLevel}) {
      return IncidentDetailsResponseDataIncidentHistory()..id= id ?? this.id
			..incidentId= incidentId ?? this.incidentId
			..incident= incident ?? this.incident
			..historyCreationDate= historyCreationDate ?? this.historyCreationDate
			..historicalImages= historicalImages ?? this.historicalImages
			..notes= notes ?? this.notes
			..createDate= createDate ?? this.createDate
			..createHijriDate= createHijriDate ?? this.createHijriDate
			..createTime= createTime ?? this.createTime
			..districtName= districtName ?? this.districtName
			..streetName= streetName ?? this.streetName
			..address= address ?? this.address
			..lat= lat ?? this.lat
			..long= long ?? this.long
			..location= location ?? this.location
			..unitValue= unitValue ?? this.unitValue
			..amountUnitId= amountUnitId ?? this.amountUnitId
			..amountUnit= amountUnit ?? this.amountUnit
			..categoryId= categoryId ?? this.categoryId
			..category= category ?? this.category
			..subCategoryId= subCategoryId ?? this.subCategoryId
			..subCategory= subCategory ?? this.subCategory
			..incidentStatusId= incidentStatusId ?? this.incidentStatusId
			..status= status ?? this.status
			..updateStatusDate= updateStatusDate ?? this.updateStatusDate
			..statusNote= statusNote ?? this.statusNote
			..statusUpdateUserId= statusUpdateUserId ?? this.statusUpdateUserId
			..statusUpdateUser= statusUpdateUser ?? this.statusUpdateUser
			..statusLat= statusLat ?? this.statusLat
			..statusLong= statusLong ?? this.statusLong
			..statusLocation= statusLocation ?? this.statusLocation
			..assignedUserId= assignedUserId ?? this.assignedUserId
			..assigningDate= assigningDate ?? this.assigningDate
			..assigningNote= assigningNote ?? this.assigningNote
			..assignedUser= assignedUser ?? this.assignedUser
			..createdUserId= createdUserId ?? this.createdUserId
			..createdUser= createdUser ?? this.createdUser
			..updateDate= updateDate ?? this.updateDate
			..updatedByUserId= updatedByUserId ?? this.updatedByUserId
			..updatedByUser= updatedByUser ?? this.updatedByUser
			..baladiaID= baladiaID ?? this.baladiaID
			..baladia= baladia ?? this.baladia
			..departmentID= departmentID ?? this.departmentID
			..department= department ?? this.department
			..neighborhoodID= neighborhoodID ?? this.neighborhoodID
			..neighborhood= neighborhood ?? this.neighborhood
			..roadID= roadID ?? this.roadID
			..road= road ?? this.road
			..mobadraID= mobadraID ?? this.mobadraID
			..mobadra= mobadra ?? this.mobadra
			..priorityLevelID= priorityLevelID ?? this.priorityLevelID
			..priorityLevel= priorityLevel ?? this.priorityLevel;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class IncidentDetailsResponseDataIncidentHistoryIncident {

	String? id;
	List<String>? incidentHistory;
	List<IncidentDetailsResponseDataIncidentHistoryIncidentImages>? images;
	String? transactions;
	String? notes;
	String? createDate;
	String? createTime;
	String? districtName;
	String? streetName;
	String? address;
	String? lat;
	String? long;
	IncidentDetailsResponseDataIncidentHistoryIncidentLocation? location;
	int? unitValue;
	int? amountUnitId;
	IncidentDetailsResponseDataIncidentHistoryIncidentAmountUnit? amountUnit;
	int? categoryId;
	IncidentDetailsResponseDataIncidentHistoryIncidentCategory? category;
	int? subCategoryId;
	IncidentDetailsResponseDataIncidentHistoryIncidentSubCategory? subCategory;
	int? incidentStatusId;
	IncidentDetailsResponseDataIncidentHistoryIncidentStatus? status;
	String? updateStatusDate;
	String? statusNote;
	String? statusUpdateUserId;
	IncidentDetailsResponseDataIncidentHistoryIncidentStatusUpdateUser? statusUpdateUser;
	String? statusLat;
	String? statusLong;
	String? statusLocation;
	String? assigningDate;
	String? assigningNote;
	IncidentDetailsResponseDataIncidentHistoryIncidentAssignedUser? assignedUser;
	String? createdUserId;
	IncidentDetailsResponseDataIncidentHistoryIncidentCreatedUser? createdUser;
	String? updateDate;
	int? priorityLevelID;
	IncidentDetailsResponseDataIncidentHistoryIncidentPriorityLevel? priorityLevel;
  
  IncidentDetailsResponseDataIncidentHistoryIncident();

  factory IncidentDetailsResponseDataIncidentHistoryIncident.fromJson(Map<String, dynamic> json) => $IncidentDetailsResponseDataIncidentHistoryIncidentFromJson(json);

  Map<String, dynamic> toJson() => $IncidentDetailsResponseDataIncidentHistoryIncidentToJson(this);

  IncidentDetailsResponseDataIncidentHistoryIncident copyWith({String? id, List<String>? incidentHistory, List<IncidentDetailsResponseDataIncidentHistoryIncidentImages>? images, String? transactions, String? notes, String? createDate, String? createTime, String? districtName, String? streetName, String? address, String? lat, String? long, IncidentDetailsResponseDataIncidentHistoryIncidentLocation? location, int? unitValue, int? amountUnitId, IncidentDetailsResponseDataIncidentHistoryIncidentAmountUnit? amountUnit, int? categoryId, IncidentDetailsResponseDataIncidentHistoryIncidentCategory? category, int? subCategoryId, IncidentDetailsResponseDataIncidentHistoryIncidentSubCategory? subCategory, int? incidentStatusId, IncidentDetailsResponseDataIncidentHistoryIncidentStatus? status, String? updateStatusDate, String? statusNote, String? statusUpdateUserId, IncidentDetailsResponseDataIncidentHistoryIncidentStatusUpdateUser? statusUpdateUser, String? statusLat, String? statusLong, String? statusLocation, String? assigningDate, String? assigningNote, IncidentDetailsResponseDataIncidentHistoryIncidentAssignedUser? assignedUser, String? createdUserId, IncidentDetailsResponseDataIncidentHistoryIncidentCreatedUser? createdUser, String? updateDate, int? priorityLevelID, IncidentDetailsResponseDataIncidentHistoryIncidentPriorityLevel? priorityLevel}) {
      return IncidentDetailsResponseDataIncidentHistoryIncident()..id= id ?? this.id
			..incidentHistory= incidentHistory ?? this.incidentHistory
			..images= images ?? this.images
			..transactions= transactions ?? this.transactions
			..notes= notes ?? this.notes
			..createDate= createDate ?? this.createDate
			..createTime= createTime ?? this.createTime
			..districtName= districtName ?? this.districtName
			..streetName= streetName ?? this.streetName
			..address= address ?? this.address
			..lat= lat ?? this.lat
			..long= long ?? this.long
			..location= location ?? this.location
			..unitValue= unitValue ?? this.unitValue
			..amountUnitId= amountUnitId ?? this.amountUnitId
			..amountUnit= amountUnit ?? this.amountUnit
			..categoryId= categoryId ?? this.categoryId
			..category= category ?? this.category
			..subCategoryId= subCategoryId ?? this.subCategoryId
			..subCategory= subCategory ?? this.subCategory
			..incidentStatusId= incidentStatusId ?? this.incidentStatusId
			..status= status ?? this.status
			..updateStatusDate= updateStatusDate ?? this.updateStatusDate
			..statusNote= statusNote ?? this.statusNote
			..statusUpdateUserId= statusUpdateUserId ?? this.statusUpdateUserId
			..statusUpdateUser= statusUpdateUser ?? this.statusUpdateUser
			..statusLat= statusLat ?? this.statusLat
			..statusLong= statusLong ?? this.statusLong
			..statusLocation= statusLocation ?? this.statusLocation
			..assigningDate= assigningDate ?? this.assigningDate
			..assigningNote= assigningNote ?? this.assigningNote
			..assignedUser= assignedUser ?? this.assignedUser
			..createdUserId= createdUserId ?? this.createdUserId
			..createdUser= createdUser ?? this.createdUser
			..updateDate= updateDate ?? this.updateDate
			..priorityLevelID= priorityLevelID ?? this.priorityLevelID
			..priorityLevel= priorityLevel ?? this.priorityLevel;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class IncidentDetailsResponseDataIncidentHistoryIncidentImages {

	String? incident;
	String? createdDate;
	String? name;
	String? path;
	bool? isPrimary;
  
  IncidentDetailsResponseDataIncidentHistoryIncidentImages();

  factory IncidentDetailsResponseDataIncidentHistoryIncidentImages.fromJson(Map<String, dynamic> json) => $IncidentDetailsResponseDataIncidentHistoryIncidentImagesFromJson(json);

  Map<String, dynamic> toJson() => $IncidentDetailsResponseDataIncidentHistoryIncidentImagesToJson(this);

  IncidentDetailsResponseDataIncidentHistoryIncidentImages copyWith({String? incident, String? createdDate, String? name, String? path, bool? isPrimary}) {
      return IncidentDetailsResponseDataIncidentHistoryIncidentImages()..incident= incident ?? this.incident
			..createdDate= createdDate ?? this.createdDate
			..name= name ?? this.name
			..path= path ?? this.path
			..isPrimary= isPrimary ?? this.isPrimary;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class IncidentDetailsResponseDataIncidentHistoryIncidentLocation {

	String? type;
	List<double>? coordinates;
  
  IncidentDetailsResponseDataIncidentHistoryIncidentLocation();

  factory IncidentDetailsResponseDataIncidentHistoryIncidentLocation.fromJson(Map<String, dynamic> json) => $IncidentDetailsResponseDataIncidentHistoryIncidentLocationFromJson(json);

  Map<String, dynamic> toJson() => $IncidentDetailsResponseDataIncidentHistoryIncidentLocationToJson(this);

  IncidentDetailsResponseDataIncidentHistoryIncidentLocation copyWith({String? type, List<double>? coordinates}) {
      return IncidentDetailsResponseDataIncidentHistoryIncidentLocation()..type= type ?? this.type
			..coordinates= coordinates ?? this.coordinates;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class IncidentDetailsResponseDataIncidentHistoryIncidentAmountUnit {

	int? id;
	String? arabicName;
	String? englishName;
	List<String>? incidents;
  
  IncidentDetailsResponseDataIncidentHistoryIncidentAmountUnit();

  factory IncidentDetailsResponseDataIncidentHistoryIncidentAmountUnit.fromJson(Map<String, dynamic> json) => $IncidentDetailsResponseDataIncidentHistoryIncidentAmountUnitFromJson(json);

  Map<String, dynamic> toJson() => $IncidentDetailsResponseDataIncidentHistoryIncidentAmountUnitToJson(this);

  IncidentDetailsResponseDataIncidentHistoryIncidentAmountUnit copyWith({int? id, String? arabicName, String? englishName, List<String>? incidents}) {
      return IncidentDetailsResponseDataIncidentHistoryIncidentAmountUnit()..id= id ?? this.id
			..arabicName= arabicName ?? this.arabicName
			..englishName= englishName ?? this.englishName
			..incidents= incidents ?? this.incidents;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class IncidentDetailsResponseDataIncidentHistoryIncidentCategory {

	int? id;
	String? arabicName;
	String? englishName;
	String? icon;
	int? order;
	String? color;
	List<String>? incidents;
  
  IncidentDetailsResponseDataIncidentHistoryIncidentCategory();

  factory IncidentDetailsResponseDataIncidentHistoryIncidentCategory.fromJson(Map<String, dynamic> json) => $IncidentDetailsResponseDataIncidentHistoryIncidentCategoryFromJson(json);

  Map<String, dynamic> toJson() => $IncidentDetailsResponseDataIncidentHistoryIncidentCategoryToJson(this);

  IncidentDetailsResponseDataIncidentHistoryIncidentCategory copyWith({int? id, String? arabicName, String? englishName, String? icon, int? order, String? color, List<String>? incidents}) {
      return IncidentDetailsResponseDataIncidentHistoryIncidentCategory()..id= id ?? this.id
			..arabicName= arabicName ?? this.arabicName
			..englishName= englishName ?? this.englishName
			..icon= icon ?? this.icon
			..order= order ?? this.order
			..color= color ?? this.color
			..incidents= incidents ?? this.incidents;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class IncidentDetailsResponseDataIncidentHistoryIncidentSubCategory {

	int? id;
	String? arabicName;
	String? englishName;
	String? icon;
	int? order;
	String? color;
	List<String>? incidents;
	int? mainCategoryId;
	int? amountUnitId;
	String? mainCategory;
	String? amountUnit;
  
  IncidentDetailsResponseDataIncidentHistoryIncidentSubCategory();

  factory IncidentDetailsResponseDataIncidentHistoryIncidentSubCategory.fromJson(Map<String, dynamic> json) => $IncidentDetailsResponseDataIncidentHistoryIncidentSubCategoryFromJson(json);

  Map<String, dynamic> toJson() => $IncidentDetailsResponseDataIncidentHistoryIncidentSubCategoryToJson(this);

  IncidentDetailsResponseDataIncidentHistoryIncidentSubCategory copyWith({int? id, String? arabicName, String? englishName, String? icon, int? order, String? color, List<String>? incidents, int? mainCategoryId, int? amountUnitId, String? mainCategory, String? amountUnit}) {
      return IncidentDetailsResponseDataIncidentHistoryIncidentSubCategory()..id= id ?? this.id
			..arabicName= arabicName ?? this.arabicName
			..englishName= englishName ?? this.englishName
			..icon= icon ?? this.icon
			..order= order ?? this.order
			..color= color ?? this.color
			..incidents= incidents ?? this.incidents
			..mainCategoryId= mainCategoryId ?? this.mainCategoryId
			..amountUnitId= amountUnitId ?? this.amountUnitId
			..mainCategory= mainCategory ?? this.mainCategory
			..amountUnit= amountUnit ?? this.amountUnit;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class IncidentDetailsResponseDataIncidentHistoryIncidentStatus {

	int? id;
	String? arabicName;
	String? englishName;
	String? color;
	List<String>? incidents;
  
  IncidentDetailsResponseDataIncidentHistoryIncidentStatus();

  factory IncidentDetailsResponseDataIncidentHistoryIncidentStatus.fromJson(Map<String, dynamic> json) => $IncidentDetailsResponseDataIncidentHistoryIncidentStatusFromJson(json);

  Map<String, dynamic> toJson() => $IncidentDetailsResponseDataIncidentHistoryIncidentStatusToJson(this);

  IncidentDetailsResponseDataIncidentHistoryIncidentStatus copyWith({int? id, String? arabicName, String? englishName, String? color, List<String>? incidents}) {
      return IncidentDetailsResponseDataIncidentHistoryIncidentStatus()..id= id ?? this.id
			..arabicName= arabicName ?? this.arabicName
			..englishName= englishName ?? this.englishName
			..color= color ?? this.color
			..incidents= incidents ?? this.incidents;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class IncidentDetailsResponseDataIncidentHistoryIncidentStatusUpdateUser {

	String? firstName;
	String? lastName;
	String? userName;
	String? phoneNumber;
  
  IncidentDetailsResponseDataIncidentHistoryIncidentStatusUpdateUser();

  factory IncidentDetailsResponseDataIncidentHistoryIncidentStatusUpdateUser.fromJson(Map<String, dynamic> json) => $IncidentDetailsResponseDataIncidentHistoryIncidentStatusUpdateUserFromJson(json);

  Map<String, dynamic> toJson() => $IncidentDetailsResponseDataIncidentHistoryIncidentStatusUpdateUserToJson(this);

  IncidentDetailsResponseDataIncidentHistoryIncidentStatusUpdateUser copyWith({String? firstName, String? lastName, String? userName, String? phoneNumber}) {
      return IncidentDetailsResponseDataIncidentHistoryIncidentStatusUpdateUser()..firstName= firstName ?? this.firstName
			..lastName= lastName ?? this.lastName
			..userName= userName ?? this.userName
			..phoneNumber= phoneNumber ?? this.phoneNumber;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class IncidentDetailsResponseDataIncidentHistoryIncidentAssignedUser {

	String? firstName;
	String? lastName;
	String? officeId;
	String? job;
	String? idNumber;
	String? birthDate;
	String? fullName;
	String? userName;
	String? phoneNumber;
  
  IncidentDetailsResponseDataIncidentHistoryIncidentAssignedUser();

  factory IncidentDetailsResponseDataIncidentHistoryIncidentAssignedUser.fromJson(Map<String, dynamic> json) => $IncidentDetailsResponseDataIncidentHistoryIncidentAssignedUserFromJson(json);

  Map<String, dynamic> toJson() => $IncidentDetailsResponseDataIncidentHistoryIncidentAssignedUserToJson(this);

  IncidentDetailsResponseDataIncidentHistoryIncidentAssignedUser copyWith({String? firstName, String? lastName, String? officeId, String? job, String? idNumber, String? birthDate, String? fullName, String? userName, String? phoneNumber}) {
      return IncidentDetailsResponseDataIncidentHistoryIncidentAssignedUser()..firstName= firstName ?? this.firstName
			..lastName= lastName ?? this.lastName
			..officeId= officeId ?? this.officeId
			..job= job ?? this.job
			..idNumber= idNumber ?? this.idNumber
			..birthDate= birthDate ?? this.birthDate
			..fullName= fullName ?? this.fullName
			..userName= userName ?? this.userName
			..phoneNumber= phoneNumber ?? this.phoneNumber;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class IncidentDetailsResponseDataIncidentHistoryIncidentCreatedUser {

	String? firstName;
	String? lastName;
	String? job;
	String? userName;
	String? phoneNumber;
  
  IncidentDetailsResponseDataIncidentHistoryIncidentCreatedUser();

  factory IncidentDetailsResponseDataIncidentHistoryIncidentCreatedUser.fromJson(Map<String, dynamic> json) => $IncidentDetailsResponseDataIncidentHistoryIncidentCreatedUserFromJson(json);

  Map<String, dynamic> toJson() => $IncidentDetailsResponseDataIncidentHistoryIncidentCreatedUserToJson(this);

  IncidentDetailsResponseDataIncidentHistoryIncidentCreatedUser copyWith({String? firstName, String? lastName, String? job, String? userName, String? phoneNumber}) {
      return IncidentDetailsResponseDataIncidentHistoryIncidentCreatedUser()..firstName= firstName ?? this.firstName
			..lastName= lastName ?? this.lastName
			..job= job ?? this.job
			..userName= userName ?? this.userName
			..phoneNumber= phoneNumber ?? this.phoneNumber;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class IncidentDetailsResponseDataIncidentHistoryIncidentPriorityLevel {

	int? id;
	String? arabicName;
	String? englishName;
	String? colorCode;
  
  IncidentDetailsResponseDataIncidentHistoryIncidentPriorityLevel();

  factory IncidentDetailsResponseDataIncidentHistoryIncidentPriorityLevel.fromJson(Map<String, dynamic> json) => $IncidentDetailsResponseDataIncidentHistoryIncidentPriorityLevelFromJson(json);

  Map<String, dynamic> toJson() => $IncidentDetailsResponseDataIncidentHistoryIncidentPriorityLevelToJson(this);

  IncidentDetailsResponseDataIncidentHistoryIncidentPriorityLevel copyWith({int? id, String? arabicName, String? englishName, String? colorCode}) {
      return IncidentDetailsResponseDataIncidentHistoryIncidentPriorityLevel()..id= id ?? this.id
			..arabicName= arabicName ?? this.arabicName
			..englishName= englishName ?? this.englishName
			..colorCode= colorCode ?? this.colorCode;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class IncidentDetailsResponseDataIncidentHistoryHistoricalImages {

	int? id;
	String? createdDate;
	String? name;
	String? path;
	bool? isPrimary;
  
  IncidentDetailsResponseDataIncidentHistoryHistoricalImages();

  factory IncidentDetailsResponseDataIncidentHistoryHistoricalImages.fromJson(Map<String, dynamic> json) => $IncidentDetailsResponseDataIncidentHistoryHistoricalImagesFromJson(json);

  Map<String, dynamic> toJson() => $IncidentDetailsResponseDataIncidentHistoryHistoricalImagesToJson(this);

  IncidentDetailsResponseDataIncidentHistoryHistoricalImages copyWith({int? id, String? createdDate, String? name, String? path, bool? isPrimary}) {
      return IncidentDetailsResponseDataIncidentHistoryHistoricalImages()..id= id ?? this.id
			..createdDate= createdDate ?? this.createdDate
			..name= name ?? this.name
			..path= path ?? this.path
			..isPrimary= isPrimary ?? this.isPrimary;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class IncidentDetailsResponseDataIncidentHistoryAssignedUser {

	String? firstName;
	String? lastName;
	String? officeId;
	String? job;
	String? idNumber;
	String? birthDate;
	String? fullName;
	String? office;
	List<dynamic>? projectUsers;
	List<dynamic>? roles;
	String? categories;
	String? userBaladiaDepartment;
	String? id;
	String? userName;
	String? normalizedUserName;
	String? email;
	String? normalizedEmail;
	bool? emailConfirmed;
	String? passwordHash;
	String? securityStamp;
	String? concurrencyStamp;
	String? phoneNumber;
	bool? phoneNumberConfirmed;
	bool? twoFactorEnabled;
	String? lockoutEnd;
	bool? lockoutEnabled;
	int? accessFailedCount;
  
  IncidentDetailsResponseDataIncidentHistoryAssignedUser();

  factory IncidentDetailsResponseDataIncidentHistoryAssignedUser.fromJson(Map<String, dynamic> json) => $IncidentDetailsResponseDataIncidentHistoryAssignedUserFromJson(json);

  Map<String, dynamic> toJson() => $IncidentDetailsResponseDataIncidentHistoryAssignedUserToJson(this);

  IncidentDetailsResponseDataIncidentHistoryAssignedUser copyWith({String? firstName, String? lastName, String? officeId, String? job, String? idNumber, String? birthDate, String? fullName, String? office, List<dynamic>? projectUsers, List<dynamic>? roles, String? categories, String? userBaladiaDepartment, String? id, String? userName, String? normalizedUserName, String? email, String? normalizedEmail, bool? emailConfirmed, String? passwordHash, String? securityStamp, String? concurrencyStamp, String? phoneNumber, bool? phoneNumberConfirmed, bool? twoFactorEnabled, String? lockoutEnd, bool? lockoutEnabled, int? accessFailedCount}) {
      return IncidentDetailsResponseDataIncidentHistoryAssignedUser()..firstName= firstName ?? this.firstName
			..lastName= lastName ?? this.lastName
			..officeId= officeId ?? this.officeId
			..job= job ?? this.job
			..idNumber= idNumber ?? this.idNumber
			..birthDate= birthDate ?? this.birthDate
			..fullName= fullName ?? this.fullName
			..office= office ?? this.office
			..projectUsers= projectUsers ?? this.projectUsers
			..roles= roles ?? this.roles
			..categories= categories ?? this.categories
			..userBaladiaDepartment= userBaladiaDepartment ?? this.userBaladiaDepartment
			..id= id ?? this.id
			..userName= userName ?? this.userName
			..normalizedUserName= normalizedUserName ?? this.normalizedUserName
			..email= email ?? this.email
			..normalizedEmail= normalizedEmail ?? this.normalizedEmail
			..emailConfirmed= emailConfirmed ?? this.emailConfirmed
			..passwordHash= passwordHash ?? this.passwordHash
			..securityStamp= securityStamp ?? this.securityStamp
			..concurrencyStamp= concurrencyStamp ?? this.concurrencyStamp
			..phoneNumber= phoneNumber ?? this.phoneNumber
			..phoneNumberConfirmed= phoneNumberConfirmed ?? this.phoneNumberConfirmed
			..twoFactorEnabled= twoFactorEnabled ?? this.twoFactorEnabled
			..lockoutEnd= lockoutEnd ?? this.lockoutEnd
			..lockoutEnabled= lockoutEnabled ?? this.lockoutEnabled
			..accessFailedCount= accessFailedCount ?? this.accessFailedCount;
  }
    
  @override
  String toString() {
    return jsonEncode(this);
  }
}