import 'package:Field_Monitoring/generated/json/base/json_convert_content.dart';
import 'package:Field_Monitoring/models/incident_details/incident_details_response_entity.dart';

IncidentDetailsResponseEntity $IncidentDetailsResponseEntityFromJson(Map<String, dynamic> json) {
	final IncidentDetailsResponseEntity incidentDetailsResponseEntity = IncidentDetailsResponseEntity();
	final IncidentDetailsResponseData? data = jsonConvert.convert<IncidentDetailsResponseData>(json['data']);
	if (data != null) {
		incidentDetailsResponseEntity.data = data;
	}
	return incidentDetailsResponseEntity;
}

Map<String, dynamic> $IncidentDetailsResponseEntityToJson(IncidentDetailsResponseEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['data'] = entity.data?.toJson();
	return data;
}

IncidentDetailsResponseData $IncidentDetailsResponseDataFromJson(Map<String, dynamic> json) {
	final IncidentDetailsResponseData incidentDetailsResponseData = IncidentDetailsResponseData();
	final String? lat = jsonConvert.convert<String>(json['lat']);
	if (lat != null) {
		incidentDetailsResponseData.lat = lat;
	}
	final String? long = jsonConvert.convert<String>(json['long']);
	if (long != null) {
		incidentDetailsResponseData.long = long;
	}
	final String? notes = jsonConvert.convert<String>(json['notes']);
	if (notes != null) {
		incidentDetailsResponseData.notes = notes;
	}
	final String? createDate = jsonConvert.convert<String>(json['createDate']);
	if (createDate != null) {
		incidentDetailsResponseData.createDate = createDate;
	}
	final String? createHijriDate = jsonConvert.convert<String>(json['createHijriDate']);
	if (createHijriDate != null) {
		incidentDetailsResponseData.createHijriDate = createHijriDate;
	}
	final String? createTime = jsonConvert.convert<String>(json['createTime']);
	if (createTime != null) {
		incidentDetailsResponseData.createTime = createTime;
	}
	final String? incidentStatusColor = jsonConvert.convert<String>(json['incidentStatusColor']);
	if (incidentStatusColor != null) {
		incidentDetailsResponseData.incidentStatusColor = incidentStatusColor;
	}
	final String? districtName = jsonConvert.convert<String>(json['districtName']);
	if (districtName != null) {
		incidentDetailsResponseData.districtName = districtName;
	}
	final String? streetName = jsonConvert.convert<String>(json['streetName']);
	if (streetName != null) {
		incidentDetailsResponseData.streetName = streetName;
	}
	final String? address = jsonConvert.convert<String>(json['address']);
	if (address != null) {
		incidentDetailsResponseData.address = address;
	}
	final bool? isNew = jsonConvert.convert<bool>(json['isNew']);
	if (isNew != null) {
		incidentDetailsResponseData.isNew = isNew;
	}
	final String? userFullName = jsonConvert.convert<String>(json['userFullName']);
	if (userFullName != null) {
		incidentDetailsResponseData.userFullName = userFullName;
	}
	final int? imagesCount = jsonConvert.convert<int>(json['imagesCount']);
	if (imagesCount != null) {
		incidentDetailsResponseData.imagesCount = imagesCount;
	}
	final int? departmentID = jsonConvert.convert<int>(json['departmentID']);
	if (departmentID != null) {
		incidentDetailsResponseData.departmentID = departmentID;
	}
	final int? neighborhoodID = jsonConvert.convert<int>(json['neighborhoodID']);
	if (neighborhoodID != null) {
		incidentDetailsResponseData.neighborhoodID = neighborhoodID;
	}
	final int? roadID = jsonConvert.convert<int>(json['roadID']);
	if (roadID != null) {
		incidentDetailsResponseData.roadID = roadID;
	}
	final String? updateDate = jsonConvert.convert<String>(json['updateDate']);
	if (updateDate != null) {
		incidentDetailsResponseData.updateDate = updateDate;
	}
	final String? updatedByUserId = jsonConvert.convert<String>(json['updatedByUserId']);
	if (updatedByUserId != null) {
		incidentDetailsResponseData.updatedByUserId = updatedByUserId;
	}
	final String? assigningDate = jsonConvert.convert<String>(json['assigningDate']);
	if (assigningDate != null) {
		incidentDetailsResponseData.assigningDate = assigningDate;
	}
	final String? assigningNote = jsonConvert.convert<String>(json['assigningNote']);
	if (assigningNote != null) {
		incidentDetailsResponseData.assigningNote = assigningNote;
	}
	final String? updateStatusDate = jsonConvert.convert<String>(json['updateStatusDate']);
	if (updateStatusDate != null) {
		incidentDetailsResponseData.updateStatusDate = updateStatusDate;
	}
	final String? statusNote = jsonConvert.convert<String>(json['statusNote']);
	if (statusNote != null) {
		incidentDetailsResponseData.statusNote = statusNote;
	}
	final int? unitValue = jsonConvert.convert<int>(json['unitValue']);
	if (unitValue != null) {
		incidentDetailsResponseData.unitValue = unitValue;
	}
	final String? statusLong = jsonConvert.convert<String>(json['statusLong']);
	if (statusLong != null) {
		incidentDetailsResponseData.statusLong = statusLong;
	}
	final String? statusLat = jsonConvert.convert<String>(json['statusLat']);
	if (statusLat != null) {
		incidentDetailsResponseData.statusLat = statusLat;
	}
	final String? statusLocation = jsonConvert.convert<String>(json['statusLocation']);
	if (statusLocation != null) {
		incidentDetailsResponseData.statusLocation = statusLocation;
	}
	final String? mobadra = jsonConvert.convert<String>(json['mobadra']);
	if (mobadra != null) {
		incidentDetailsResponseData.mobadra = mobadra;
	}
	final IncidentDetailsResponseDataStatus? status = jsonConvert.convert<IncidentDetailsResponseDataStatus>(json['status']);
	if (status != null) {
		incidentDetailsResponseData.status = status;
	}
	final IncidentDetailsResponseDataPriorityLevel? priorityLevel = jsonConvert.convert<IncidentDetailsResponseDataPriorityLevel>(json['priorityLevel']);
	if (priorityLevel != null) {
		incidentDetailsResponseData.priorityLevel = priorityLevel;
	}
	final IncidentDetailsResponseDataCategory? category = jsonConvert.convert<IncidentDetailsResponseDataCategory>(json['category']);
	if (category != null) {
		incidentDetailsResponseData.category = category;
	}
	final IncidentDetailsResponseDataSubCategory? subCategory = jsonConvert.convert<IncidentDetailsResponseDataSubCategory>(json['subCategory']);
	if (subCategory != null) {
		incidentDetailsResponseData.subCategory = subCategory;
	}
	final IncidentDetailsResponseDataAmountUnit? amountUnit = jsonConvert.convert<IncidentDetailsResponseDataAmountUnit>(json['amountUnit']);
	if (amountUnit != null) {
		incidentDetailsResponseData.amountUnit = amountUnit;
	}
	final List<IncidentDetailsResponseDataImages>? images = jsonConvert.convertListNotNull<IncidentDetailsResponseDataImages>(json['images']);
	if (images != null) {
		incidentDetailsResponseData.images = images;
	}
	final List<IncidentDetailsResponseDataIncidentHistory>? incidentHistory = jsonConvert.convertListNotNull<IncidentDetailsResponseDataIncidentHistory>(json['incidentHistory']);
	if (incidentHistory != null) {
		incidentDetailsResponseData.incidentHistory = incidentHistory;
	}
	return incidentDetailsResponseData;
}

Map<String, dynamic> $IncidentDetailsResponseDataToJson(IncidentDetailsResponseData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['lat'] = entity.lat;
	data['long'] = entity.long;
	data['notes'] = entity.notes;
	data['createDate'] = entity.createDate;
	data['createHijriDate'] = entity.createHijriDate;
	data['createTime'] = entity.createTime;
	data['incidentStatusColor'] = entity.incidentStatusColor;
	data['districtName'] = entity.districtName;
	data['streetName'] = entity.streetName;
	data['address'] = entity.address;
	data['isNew'] = entity.isNew;
	data['userFullName'] = entity.userFullName;
	data['imagesCount'] = entity.imagesCount;
	data['departmentID'] = entity.departmentID;
	data['neighborhoodID'] = entity.neighborhoodID;
	data['roadID'] = entity.roadID;
	data['updateDate'] = entity.updateDate;
	data['updatedByUserId'] = entity.updatedByUserId;
	data['assigningDate'] = entity.assigningDate;
	data['assigningNote'] = entity.assigningNote;
	data['updateStatusDate'] = entity.updateStatusDate;
	data['statusNote'] = entity.statusNote;
	data['unitValue'] = entity.unitValue;
	data['statusLong'] = entity.statusLong;
	data['statusLat'] = entity.statusLat;
	data['statusLocation'] = entity.statusLocation;
	data['mobadra'] = entity.mobadra;
	data['status'] = entity.status?.toJson();
	data['priorityLevel'] = entity.priorityLevel?.toJson();
	data['category'] = entity.category?.toJson();
	data['subCategory'] = entity.subCategory?.toJson();
	data['amountUnit'] = entity.amountUnit?.toJson();
	data['images'] =  entity.images?.map((v) => v.toJson()).toList();
	data['incidentHistory'] =  entity.incidentHistory?.map((v) => v.toJson()).toList();
	return data;
}

IncidentDetailsResponseDataStatus $IncidentDetailsResponseDataStatusFromJson(Map<String, dynamic> json) {
	final IncidentDetailsResponseDataStatus incidentDetailsResponseDataStatus = IncidentDetailsResponseDataStatus();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		incidentDetailsResponseDataStatus.id = id;
	}
	final String? arabicName = jsonConvert.convert<String>(json['arabicName']);
	if (arabicName != null) {
		incidentDetailsResponseDataStatus.arabicName = arabicName;
	}
	final String? englishName = jsonConvert.convert<String>(json['englishName']);
	if (englishName != null) {
		incidentDetailsResponseDataStatus.englishName = englishName;
	}
	final int? incidentsCount = jsonConvert.convert<int>(json['incidentsCount']);
	if (incidentsCount != null) {
		incidentDetailsResponseDataStatus.incidentsCount = incidentsCount;
	}
	return incidentDetailsResponseDataStatus;
}

Map<String, dynamic> $IncidentDetailsResponseDataStatusToJson(IncidentDetailsResponseDataStatus entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['arabicName'] = entity.arabicName;
	data['englishName'] = entity.englishName;
	data['incidentsCount'] = entity.incidentsCount;
	return data;
}

IncidentDetailsResponseDataPriorityLevel $IncidentDetailsResponseDataPriorityLevelFromJson(Map<String, dynamic> json) {
	final IncidentDetailsResponseDataPriorityLevel incidentDetailsResponseDataPriorityLevel = IncidentDetailsResponseDataPriorityLevel();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		incidentDetailsResponseDataPriorityLevel.id = id;
	}
	final String? arabicName = jsonConvert.convert<String>(json['arabicName']);
	if (arabicName != null) {
		incidentDetailsResponseDataPriorityLevel.arabicName = arabicName;
	}
	final String? englishName = jsonConvert.convert<String>(json['englishName']);
	if (englishName != null) {
		incidentDetailsResponseDataPriorityLevel.englishName = englishName;
	}
	final String? colorCode = jsonConvert.convert<String>(json['colorCode']);
	if (colorCode != null) {
		incidentDetailsResponseDataPriorityLevel.colorCode = colorCode;
	}
	return incidentDetailsResponseDataPriorityLevel;
}

Map<String, dynamic> $IncidentDetailsResponseDataPriorityLevelToJson(IncidentDetailsResponseDataPriorityLevel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['arabicName'] = entity.arabicName;
	data['englishName'] = entity.englishName;
	data['colorCode'] = entity.colorCode;
	return data;
}

IncidentDetailsResponseDataCategory $IncidentDetailsResponseDataCategoryFromJson(Map<String, dynamic> json) {
	final IncidentDetailsResponseDataCategory incidentDetailsResponseDataCategory = IncidentDetailsResponseDataCategory();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		incidentDetailsResponseDataCategory.id = id;
	}
	final int? incidentsCount = jsonConvert.convert<int>(json['incidentsCount']);
	if (incidentsCount != null) {
		incidentDetailsResponseDataCategory.incidentsCount = incidentsCount;
	}
	final int? subCategoryCount = jsonConvert.convert<int>(json['subCategoryCount']);
	if (subCategoryCount != null) {
		incidentDetailsResponseDataCategory.subCategoryCount = subCategoryCount;
	}
	final List<dynamic>? subCategoryList = jsonConvert.convertListNotNull<dynamic>(json['subCategoryList']);
	if (subCategoryList != null) {
		incidentDetailsResponseDataCategory.subCategoryList = subCategoryList;
	}
	final String? arabicName = jsonConvert.convert<String>(json['arabicName']);
	if (arabicName != null) {
		incidentDetailsResponseDataCategory.arabicName = arabicName;
	}
	final String? englishName = jsonConvert.convert<String>(json['englishName']);
	if (englishName != null) {
		incidentDetailsResponseDataCategory.englishName = englishName;
	}
	final String? icon = jsonConvert.convert<String>(json['icon']);
	if (icon != null) {
		incidentDetailsResponseDataCategory.icon = icon;
	}
	final int? order = jsonConvert.convert<int>(json['order']);
	if (order != null) {
		incidentDetailsResponseDataCategory.order = order;
	}
	final String? color = jsonConvert.convert<String>(json['color']);
	if (color != null) {
		incidentDetailsResponseDataCategory.color = color;
	}
	return incidentDetailsResponseDataCategory;
}

Map<String, dynamic> $IncidentDetailsResponseDataCategoryToJson(IncidentDetailsResponseDataCategory entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['incidentsCount'] = entity.incidentsCount;
	data['subCategoryCount'] = entity.subCategoryCount;
	data['subCategoryList'] =  entity.subCategoryList;
	data['arabicName'] = entity.arabicName;
	data['englishName'] = entity.englishName;
	data['icon'] = entity.icon;
	data['order'] = entity.order;
	data['color'] = entity.color;
	return data;
}

IncidentDetailsResponseDataSubCategory $IncidentDetailsResponseDataSubCategoryFromJson(Map<String, dynamic> json) {
	final IncidentDetailsResponseDataSubCategory incidentDetailsResponseDataSubCategory = IncidentDetailsResponseDataSubCategory();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		incidentDetailsResponseDataSubCategory.id = id;
	}
	final int? incidentsCount = jsonConvert.convert<int>(json['incidentsCount']);
	if (incidentsCount != null) {
		incidentDetailsResponseDataSubCategory.incidentsCount = incidentsCount;
	}
	final int? categoryId = jsonConvert.convert<int>(json['categoryId']);
	if (categoryId != null) {
		incidentDetailsResponseDataSubCategory.categoryId = categoryId;
	}
	final String? icon = jsonConvert.convert<String>(json['icon']);
	if (icon != null) {
		incidentDetailsResponseDataSubCategory.icon = icon;
	}
	final int? amountUnitId = jsonConvert.convert<int>(json['amountUnitId']);
	if (amountUnitId != null) {
		incidentDetailsResponseDataSubCategory.amountUnitId = amountUnitId;
	}
	final String? amountUnitArabicName = jsonConvert.convert<String>(json['amountUnitArabicName']);
	if (amountUnitArabicName != null) {
		incidentDetailsResponseDataSubCategory.amountUnitArabicName = amountUnitArabicName;
	}
	final String? amountUnitEnglishName = jsonConvert.convert<String>(json['amountUnitEnglishName']);
	if (amountUnitEnglishName != null) {
		incidentDetailsResponseDataSubCategory.amountUnitEnglishName = amountUnitEnglishName;
	}
	final String? categoryArabicName = jsonConvert.convert<String>(json['categoryArabicName']);
	if (categoryArabicName != null) {
		incidentDetailsResponseDataSubCategory.categoryArabicName = categoryArabicName;
	}
	final String? categoryEnglishName = jsonConvert.convert<String>(json['categoryEnglishName']);
	if (categoryEnglishName != null) {
		incidentDetailsResponseDataSubCategory.categoryEnglishName = categoryEnglishName;
	}
	final String? arabicName = jsonConvert.convert<String>(json['arabicName']);
	if (arabicName != null) {
		incidentDetailsResponseDataSubCategory.arabicName = arabicName;
	}
	final String? englishName = jsonConvert.convert<String>(json['englishName']);
	if (englishName != null) {
		incidentDetailsResponseDataSubCategory.englishName = englishName;
	}
	final int? mainCategoryId = jsonConvert.convert<int>(json['mainCategoryId']);
	if (mainCategoryId != null) {
		incidentDetailsResponseDataSubCategory.mainCategoryId = mainCategoryId;
	}
	final int? order = jsonConvert.convert<int>(json['order']);
	if (order != null) {
		incidentDetailsResponseDataSubCategory.order = order;
	}
	final String? color = jsonConvert.convert<String>(json['color']);
	if (color != null) {
		incidentDetailsResponseDataSubCategory.color = color;
	}
	final String? file = jsonConvert.convert<String>(json['file']);
	if (file != null) {
		incidentDetailsResponseDataSubCategory.file = file;
	}
	return incidentDetailsResponseDataSubCategory;
}

Map<String, dynamic> $IncidentDetailsResponseDataSubCategoryToJson(IncidentDetailsResponseDataSubCategory entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['incidentsCount'] = entity.incidentsCount;
	data['categoryId'] = entity.categoryId;
	data['icon'] = entity.icon;
	data['amountUnitId'] = entity.amountUnitId;
	data['amountUnitArabicName'] = entity.amountUnitArabicName;
	data['amountUnitEnglishName'] = entity.amountUnitEnglishName;
	data['categoryArabicName'] = entity.categoryArabicName;
	data['categoryEnglishName'] = entity.categoryEnglishName;
	data['arabicName'] = entity.arabicName;
	data['englishName'] = entity.englishName;
	data['mainCategoryId'] = entity.mainCategoryId;
	data['order'] = entity.order;
	data['color'] = entity.color;
	data['file'] = entity.file;
	return data;
}

IncidentDetailsResponseDataAmountUnit $IncidentDetailsResponseDataAmountUnitFromJson(Map<String, dynamic> json) {
	final IncidentDetailsResponseDataAmountUnit incidentDetailsResponseDataAmountUnit = IncidentDetailsResponseDataAmountUnit();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		incidentDetailsResponseDataAmountUnit.id = id;
	}
	final int? incidentsCount = jsonConvert.convert<int>(json['incidentsCount']);
	if (incidentsCount != null) {
		incidentDetailsResponseDataAmountUnit.incidentsCount = incidentsCount;
	}
	final int? subCategoryCount = jsonConvert.convert<int>(json['subCategoryCount']);
	if (subCategoryCount != null) {
		incidentDetailsResponseDataAmountUnit.subCategoryCount = subCategoryCount;
	}
	final String? arabicName = jsonConvert.convert<String>(json['arabicName']);
	if (arabicName != null) {
		incidentDetailsResponseDataAmountUnit.arabicName = arabicName;
	}
	final String? englishName = jsonConvert.convert<String>(json['englishName']);
	if (englishName != null) {
		incidentDetailsResponseDataAmountUnit.englishName = englishName;
	}
	return incidentDetailsResponseDataAmountUnit;
}

Map<String, dynamic> $IncidentDetailsResponseDataAmountUnitToJson(IncidentDetailsResponseDataAmountUnit entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['incidentsCount'] = entity.incidentsCount;
	data['subCategoryCount'] = entity.subCategoryCount;
	data['arabicName'] = entity.arabicName;
	data['englishName'] = entity.englishName;
	return data;
}

IncidentDetailsResponseDataImages $IncidentDetailsResponseDataImagesFromJson(Map<String, dynamic> json) {
	final IncidentDetailsResponseDataImages incidentDetailsResponseDataImages = IncidentDetailsResponseDataImages();
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		incidentDetailsResponseDataImages.name = name;
	}
	final String? imageBase64 = jsonConvert.convert<String>(json['imageBase64']);
	if (imageBase64 != null) {
		incidentDetailsResponseDataImages.imageBase64 = imageBase64;
	}
	final String? file = jsonConvert.convert<String>(json['file']);
	if (file != null) {
		incidentDetailsResponseDataImages.file = file;
	}
	final String? path = jsonConvert.convert<String>(json['path']);
	if (path != null) {
		incidentDetailsResponseDataImages.path = path;
	}
	final bool? isPrimary = jsonConvert.convert<bool>(json['isPrimary']);
	if (isPrimary != null) {
		incidentDetailsResponseDataImages.isPrimary = isPrimary;
	}
	return incidentDetailsResponseDataImages;
}

Map<String, dynamic> $IncidentDetailsResponseDataImagesToJson(IncidentDetailsResponseDataImages entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['name'] = entity.name;
	data['imageBase64'] = entity.imageBase64;
	data['file'] = entity.file;
	data['path'] = entity.path;
	data['isPrimary'] = entity.isPrimary;
	return data;
}

IncidentDetailsResponseDataIncidentHistory $IncidentDetailsResponseDataIncidentHistoryFromJson(Map<String, dynamic> json) {
	final IncidentDetailsResponseDataIncidentHistory incidentDetailsResponseDataIncidentHistory = IncidentDetailsResponseDataIncidentHistory();
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		incidentDetailsResponseDataIncidentHistory.id = id;
	}
	final String? incidentId = jsonConvert.convert<String>(json['incidentId']);
	if (incidentId != null) {
		incidentDetailsResponseDataIncidentHistory.incidentId = incidentId;
	}
	final IncidentDetailsResponseDataIncidentHistoryIncident? incident = jsonConvert.convert<IncidentDetailsResponseDataIncidentHistoryIncident>(json['incident']);
	if (incident != null) {
		incidentDetailsResponseDataIncidentHistory.incident = incident;
	}
	final String? historyCreationDate = jsonConvert.convert<String>(json['historyCreationDate']);
	if (historyCreationDate != null) {
		incidentDetailsResponseDataIncidentHistory.historyCreationDate = historyCreationDate;
	}
	final List<IncidentDetailsResponseDataIncidentHistoryHistoricalImages>? historicalImages = jsonConvert.convertListNotNull<IncidentDetailsResponseDataIncidentHistoryHistoricalImages>(json['historicalImages']);
	if (historicalImages != null) {
		incidentDetailsResponseDataIncidentHistory.historicalImages = historicalImages;
	}
	final String? notes = jsonConvert.convert<String>(json['notes']);
	if (notes != null) {
		incidentDetailsResponseDataIncidentHistory.notes = notes;
	}
	final String? createDate = jsonConvert.convert<String>(json['createDate']);
	if (createDate != null) {
		incidentDetailsResponseDataIncidentHistory.createDate = createDate;
	}
	final String? createHijriDate = jsonConvert.convert<String>(json['createHijriDate']);
	if (createHijriDate != null) {
		incidentDetailsResponseDataIncidentHistory.createHijriDate = createHijriDate;
	}
	final String? createTime = jsonConvert.convert<String>(json['createTime']);
	if (createTime != null) {
		incidentDetailsResponseDataIncidentHistory.createTime = createTime;
	}
	final String? districtName = jsonConvert.convert<String>(json['districtName']);
	if (districtName != null) {
		incidentDetailsResponseDataIncidentHistory.districtName = districtName;
	}
	final String? streetName = jsonConvert.convert<String>(json['streetName']);
	if (streetName != null) {
		incidentDetailsResponseDataIncidentHistory.streetName = streetName;
	}
	final String? address = jsonConvert.convert<String>(json['address']);
	if (address != null) {
		incidentDetailsResponseDataIncidentHistory.address = address;
	}
	final String? lat = jsonConvert.convert<String>(json['lat']);
	if (lat != null) {
		incidentDetailsResponseDataIncidentHistory.lat = lat;
	}
	final String? long = jsonConvert.convert<String>(json['long']);
	if (long != null) {
		incidentDetailsResponseDataIncidentHistory.long = long;
	}
	final String? location = jsonConvert.convert<String>(json['location']);
	if (location != null) {
		incidentDetailsResponseDataIncidentHistory.location = location;
	}
	final int? unitValue = jsonConvert.convert<int>(json['unitValue']);
	if (unitValue != null) {
		incidentDetailsResponseDataIncidentHistory.unitValue = unitValue;
	}
	final int? amountUnitId = jsonConvert.convert<int>(json['amountUnitId']);
	if (amountUnitId != null) {
		incidentDetailsResponseDataIncidentHistory.amountUnitId = amountUnitId;
	}
	final String? amountUnit = jsonConvert.convert<String>(json['amountUnit']);
	if (amountUnit != null) {
		incidentDetailsResponseDataIncidentHistory.amountUnit = amountUnit;
	}
	final int? categoryId = jsonConvert.convert<int>(json['categoryId']);
	if (categoryId != null) {
		incidentDetailsResponseDataIncidentHistory.categoryId = categoryId;
	}
	final String? category = jsonConvert.convert<String>(json['category']);
	if (category != null) {
		incidentDetailsResponseDataIncidentHistory.category = category;
	}
	final int? subCategoryId = jsonConvert.convert<int>(json['subCategoryId']);
	if (subCategoryId != null) {
		incidentDetailsResponseDataIncidentHistory.subCategoryId = subCategoryId;
	}
	final String? subCategory = jsonConvert.convert<String>(json['subCategory']);
	if (subCategory != null) {
		incidentDetailsResponseDataIncidentHistory.subCategory = subCategory;
	}
	final int? incidentStatusId = jsonConvert.convert<int>(json['incidentStatusId']);
	if (incidentStatusId != null) {
		incidentDetailsResponseDataIncidentHistory.incidentStatusId = incidentStatusId;
	}
	final String? status = jsonConvert.convert<String>(json['status']);
	if (status != null) {
		incidentDetailsResponseDataIncidentHistory.status = status;
	}
	final String? updateStatusDate = jsonConvert.convert<String>(json['updateStatusDate']);
	if (updateStatusDate != null) {
		incidentDetailsResponseDataIncidentHistory.updateStatusDate = updateStatusDate;
	}
	final String? statusNote = jsonConvert.convert<String>(json['statusNote']);
	if (statusNote != null) {
		incidentDetailsResponseDataIncidentHistory.statusNote = statusNote;
	}
	final String? statusUpdateUserId = jsonConvert.convert<String>(json['statusUpdateUserId']);
	if (statusUpdateUserId != null) {
		incidentDetailsResponseDataIncidentHistory.statusUpdateUserId = statusUpdateUserId;
	}
	final String? statusUpdateUser = jsonConvert.convert<String>(json['statusUpdateUser']);
	if (statusUpdateUser != null) {
		incidentDetailsResponseDataIncidentHistory.statusUpdateUser = statusUpdateUser;
	}
	final String? statusLat = jsonConvert.convert<String>(json['statusLat']);
	if (statusLat != null) {
		incidentDetailsResponseDataIncidentHistory.statusLat = statusLat;
	}
	final String? statusLong = jsonConvert.convert<String>(json['statusLong']);
	if (statusLong != null) {
		incidentDetailsResponseDataIncidentHistory.statusLong = statusLong;
	}
	final String? statusLocation = jsonConvert.convert<String>(json['statusLocation']);
	if (statusLocation != null) {
		incidentDetailsResponseDataIncidentHistory.statusLocation = statusLocation;
	}
	final String? assignedUserId = jsonConvert.convert<String>(json['assignedUserId']);
	if (assignedUserId != null) {
		incidentDetailsResponseDataIncidentHistory.assignedUserId = assignedUserId;
	}
	final String? assigningDate = jsonConvert.convert<String>(json['assigningDate']);
	if (assigningDate != null) {
		incidentDetailsResponseDataIncidentHistory.assigningDate = assigningDate;
	}
	final String? assigningNote = jsonConvert.convert<String>(json['assigningNote']);
	if (assigningNote != null) {
		incidentDetailsResponseDataIncidentHistory.assigningNote = assigningNote;
	}
	final IncidentDetailsResponseDataIncidentHistoryAssignedUser? assignedUser = jsonConvert.convert<IncidentDetailsResponseDataIncidentHistoryAssignedUser>(json['assignedUser']);
	if (assignedUser != null) {
		incidentDetailsResponseDataIncidentHistory.assignedUser = assignedUser;
	}
	final String? createdUserId = jsonConvert.convert<String>(json['createdUserId']);
	if (createdUserId != null) {
		incidentDetailsResponseDataIncidentHistory.createdUserId = createdUserId;
	}
	final String? createdUser = jsonConvert.convert<String>(json['createdUser']);
	if (createdUser != null) {
		incidentDetailsResponseDataIncidentHistory.createdUser = createdUser;
	}
	final String? updateDate = jsonConvert.convert<String>(json['updateDate']);
	if (updateDate != null) {
		incidentDetailsResponseDataIncidentHistory.updateDate = updateDate;
	}
	final String? updatedByUserId = jsonConvert.convert<String>(json['updatedByUserId']);
	if (updatedByUserId != null) {
		incidentDetailsResponseDataIncidentHistory.updatedByUserId = updatedByUserId;
	}
	final String? updatedByUser = jsonConvert.convert<String>(json['updatedByUser']);
	if (updatedByUser != null) {
		incidentDetailsResponseDataIncidentHistory.updatedByUser = updatedByUser;
	}
	final String? baladiaID = jsonConvert.convert<String>(json['baladiaID']);
	if (baladiaID != null) {
		incidentDetailsResponseDataIncidentHistory.baladiaID = baladiaID;
	}
	final String? baladia = jsonConvert.convert<String>(json['baladia']);
	if (baladia != null) {
		incidentDetailsResponseDataIncidentHistory.baladia = baladia;
	}
	final int? departmentID = jsonConvert.convert<int>(json['departmentID']);
	if (departmentID != null) {
		incidentDetailsResponseDataIncidentHistory.departmentID = departmentID;
	}
	final String? department = jsonConvert.convert<String>(json['department']);
	if (department != null) {
		incidentDetailsResponseDataIncidentHistory.department = department;
	}
	final int? neighborhoodID = jsonConvert.convert<int>(json['neighborhoodID']);
	if (neighborhoodID != null) {
		incidentDetailsResponseDataIncidentHistory.neighborhoodID = neighborhoodID;
	}
	final String? neighborhood = jsonConvert.convert<String>(json['neighborhood']);
	if (neighborhood != null) {
		incidentDetailsResponseDataIncidentHistory.neighborhood = neighborhood;
	}
	final int? roadID = jsonConvert.convert<int>(json['roadID']);
	if (roadID != null) {
		incidentDetailsResponseDataIncidentHistory.roadID = roadID;
	}
	final String? road = jsonConvert.convert<String>(json['road']);
	if (road != null) {
		incidentDetailsResponseDataIncidentHistory.road = road;
	}
	final String? mobadraID = jsonConvert.convert<String>(json['mobadraID']);
	if (mobadraID != null) {
		incidentDetailsResponseDataIncidentHistory.mobadraID = mobadraID;
	}
	final String? mobadra = jsonConvert.convert<String>(json['mobadra']);
	if (mobadra != null) {
		incidentDetailsResponseDataIncidentHistory.mobadra = mobadra;
	}
	final int? priorityLevelID = jsonConvert.convert<int>(json['priorityLevelID']);
	if (priorityLevelID != null) {
		incidentDetailsResponseDataIncidentHistory.priorityLevelID = priorityLevelID;
	}
	final String? priorityLevel = jsonConvert.convert<String>(json['priorityLevel']);
	if (priorityLevel != null) {
		incidentDetailsResponseDataIncidentHistory.priorityLevel = priorityLevel;
	}
	return incidentDetailsResponseDataIncidentHistory;
}

Map<String, dynamic> $IncidentDetailsResponseDataIncidentHistoryToJson(IncidentDetailsResponseDataIncidentHistory entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['incidentId'] = entity.incidentId;
	data['incident'] = entity.incident?.toJson();
	data['historyCreationDate'] = entity.historyCreationDate;
	data['historicalImages'] =  entity.historicalImages?.map((v) => v.toJson()).toList();
	data['notes'] = entity.notes;
	data['createDate'] = entity.createDate;
	data['createHijriDate'] = entity.createHijriDate;
	data['createTime'] = entity.createTime;
	data['districtName'] = entity.districtName;
	data['streetName'] = entity.streetName;
	data['address'] = entity.address;
	data['lat'] = entity.lat;
	data['long'] = entity.long;
	data['location'] = entity.location;
	data['unitValue'] = entity.unitValue;
	data['amountUnitId'] = entity.amountUnitId;
	data['amountUnit'] = entity.amountUnit;
	data['categoryId'] = entity.categoryId;
	data['category'] = entity.category;
	data['subCategoryId'] = entity.subCategoryId;
	data['subCategory'] = entity.subCategory;
	data['incidentStatusId'] = entity.incidentStatusId;
	data['status'] = entity.status;
	data['updateStatusDate'] = entity.updateStatusDate;
	data['statusNote'] = entity.statusNote;
	data['statusUpdateUserId'] = entity.statusUpdateUserId;
	data['statusUpdateUser'] = entity.statusUpdateUser;
	data['statusLat'] = entity.statusLat;
	data['statusLong'] = entity.statusLong;
	data['statusLocation'] = entity.statusLocation;
	data['assignedUserId'] = entity.assignedUserId;
	data['assigningDate'] = entity.assigningDate;
	data['assigningNote'] = entity.assigningNote;
	data['assignedUser'] = entity.assignedUser?.toJson();
	data['createdUserId'] = entity.createdUserId;
	data['createdUser'] = entity.createdUser;
	data['updateDate'] = entity.updateDate;
	data['updatedByUserId'] = entity.updatedByUserId;
	data['updatedByUser'] = entity.updatedByUser;
	data['baladiaID'] = entity.baladiaID;
	data['baladia'] = entity.baladia;
	data['departmentID'] = entity.departmentID;
	data['department'] = entity.department;
	data['neighborhoodID'] = entity.neighborhoodID;
	data['neighborhood'] = entity.neighborhood;
	data['roadID'] = entity.roadID;
	data['road'] = entity.road;
	data['mobadraID'] = entity.mobadraID;
	data['mobadra'] = entity.mobadra;
	data['priorityLevelID'] = entity.priorityLevelID;
	data['priorityLevel'] = entity.priorityLevel;
	return data;
}

IncidentDetailsResponseDataIncidentHistoryIncident $IncidentDetailsResponseDataIncidentHistoryIncidentFromJson(Map<String, dynamic> json) {
	final IncidentDetailsResponseDataIncidentHistoryIncident incidentDetailsResponseDataIncidentHistoryIncident = IncidentDetailsResponseDataIncidentHistoryIncident();
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		incidentDetailsResponseDataIncidentHistoryIncident.id = id;
	}
	final List<String>? incidentHistory = jsonConvert.convertListNotNull<String>(json['incidentHistory']);
	if (incidentHistory != null) {
		incidentDetailsResponseDataIncidentHistoryIncident.incidentHistory = incidentHistory;
	}
	final List<IncidentDetailsResponseDataIncidentHistoryIncidentImages>? images = jsonConvert.convertListNotNull<IncidentDetailsResponseDataIncidentHistoryIncidentImages>(json['images']);
	if (images != null) {
		incidentDetailsResponseDataIncidentHistoryIncident.images = images;
	}
	final String? transactions = jsonConvert.convert<String>(json['transactions']);
	if (transactions != null) {
		incidentDetailsResponseDataIncidentHistoryIncident.transactions = transactions;
	}
	final String? notes = jsonConvert.convert<String>(json['notes']);
	if (notes != null) {
		incidentDetailsResponseDataIncidentHistoryIncident.notes = notes;
	}
	final String? createDate = jsonConvert.convert<String>(json['createDate']);
	if (createDate != null) {
		incidentDetailsResponseDataIncidentHistoryIncident.createDate = createDate;
	}
	final String? createTime = jsonConvert.convert<String>(json['createTime']);
	if (createTime != null) {
		incidentDetailsResponseDataIncidentHistoryIncident.createTime = createTime;
	}
	final String? districtName = jsonConvert.convert<String>(json['districtName']);
	if (districtName != null) {
		incidentDetailsResponseDataIncidentHistoryIncident.districtName = districtName;
	}
	final String? streetName = jsonConvert.convert<String>(json['streetName']);
	if (streetName != null) {
		incidentDetailsResponseDataIncidentHistoryIncident.streetName = streetName;
	}
	final String? address = jsonConvert.convert<String>(json['address']);
	if (address != null) {
		incidentDetailsResponseDataIncidentHistoryIncident.address = address;
	}
	final String? lat = jsonConvert.convert<String>(json['lat']);
	if (lat != null) {
		incidentDetailsResponseDataIncidentHistoryIncident.lat = lat;
	}
	final String? long = jsonConvert.convert<String>(json['long']);
	if (long != null) {
		incidentDetailsResponseDataIncidentHistoryIncident.long = long;
	}
	final IncidentDetailsResponseDataIncidentHistoryIncidentLocation? location = jsonConvert.convert<IncidentDetailsResponseDataIncidentHistoryIncidentLocation>(json['location']);
	if (location != null) {
		incidentDetailsResponseDataIncidentHistoryIncident.location = location;
	}
	final int? unitValue = jsonConvert.convert<int>(json['unitValue']);
	if (unitValue != null) {
		incidentDetailsResponseDataIncidentHistoryIncident.unitValue = unitValue;
	}
	final int? amountUnitId = jsonConvert.convert<int>(json['amountUnitId']);
	if (amountUnitId != null) {
		incidentDetailsResponseDataIncidentHistoryIncident.amountUnitId = amountUnitId;
	}
	final IncidentDetailsResponseDataIncidentHistoryIncidentAmountUnit? amountUnit = jsonConvert.convert<IncidentDetailsResponseDataIncidentHistoryIncidentAmountUnit>(json['amountUnit']);
	if (amountUnit != null) {
		incidentDetailsResponseDataIncidentHistoryIncident.amountUnit = amountUnit;
	}
	final int? categoryId = jsonConvert.convert<int>(json['categoryId']);
	if (categoryId != null) {
		incidentDetailsResponseDataIncidentHistoryIncident.categoryId = categoryId;
	}
	final IncidentDetailsResponseDataIncidentHistoryIncidentCategory? category = jsonConvert.convert<IncidentDetailsResponseDataIncidentHistoryIncidentCategory>(json['category']);
	if (category != null) {
		incidentDetailsResponseDataIncidentHistoryIncident.category = category;
	}
	final int? subCategoryId = jsonConvert.convert<int>(json['subCategoryId']);
	if (subCategoryId != null) {
		incidentDetailsResponseDataIncidentHistoryIncident.subCategoryId = subCategoryId;
	}
	final IncidentDetailsResponseDataIncidentHistoryIncidentSubCategory? subCategory = jsonConvert.convert<IncidentDetailsResponseDataIncidentHistoryIncidentSubCategory>(json['subCategory']);
	if (subCategory != null) {
		incidentDetailsResponseDataIncidentHistoryIncident.subCategory = subCategory;
	}
	final int? incidentStatusId = jsonConvert.convert<int>(json['incidentStatusId']);
	if (incidentStatusId != null) {
		incidentDetailsResponseDataIncidentHistoryIncident.incidentStatusId = incidentStatusId;
	}
	final IncidentDetailsResponseDataIncidentHistoryIncidentStatus? status = jsonConvert.convert<IncidentDetailsResponseDataIncidentHistoryIncidentStatus>(json['status']);
	if (status != null) {
		incidentDetailsResponseDataIncidentHistoryIncident.status = status;
	}
	final String? updateStatusDate = jsonConvert.convert<String>(json['updateStatusDate']);
	if (updateStatusDate != null) {
		incidentDetailsResponseDataIncidentHistoryIncident.updateStatusDate = updateStatusDate;
	}
	final String? statusNote = jsonConvert.convert<String>(json['statusNote']);
	if (statusNote != null) {
		incidentDetailsResponseDataIncidentHistoryIncident.statusNote = statusNote;
	}
	final String? statusUpdateUserId = jsonConvert.convert<String>(json['statusUpdateUserId']);
	if (statusUpdateUserId != null) {
		incidentDetailsResponseDataIncidentHistoryIncident.statusUpdateUserId = statusUpdateUserId;
	}
	final IncidentDetailsResponseDataIncidentHistoryIncidentStatusUpdateUser? statusUpdateUser = jsonConvert.convert<IncidentDetailsResponseDataIncidentHistoryIncidentStatusUpdateUser>(json['statusUpdateUser']);
	if (statusUpdateUser != null) {
		incidentDetailsResponseDataIncidentHistoryIncident.statusUpdateUser = statusUpdateUser;
	}
	final String? statusLat = jsonConvert.convert<String>(json['statusLat']);
	if (statusLat != null) {
		incidentDetailsResponseDataIncidentHistoryIncident.statusLat = statusLat;
	}
	final String? statusLong = jsonConvert.convert<String>(json['statusLong']);
	if (statusLong != null) {
		incidentDetailsResponseDataIncidentHistoryIncident.statusLong = statusLong;
	}
	final String? statusLocation = jsonConvert.convert<String>(json['statusLocation']);
	if (statusLocation != null) {
		incidentDetailsResponseDataIncidentHistoryIncident.statusLocation = statusLocation;
	}
	final String? assigningDate = jsonConvert.convert<String>(json['assigningDate']);
	if (assigningDate != null) {
		incidentDetailsResponseDataIncidentHistoryIncident.assigningDate = assigningDate;
	}
	final String? assigningNote = jsonConvert.convert<String>(json['assigningNote']);
	if (assigningNote != null) {
		incidentDetailsResponseDataIncidentHistoryIncident.assigningNote = assigningNote;
	}
	final IncidentDetailsResponseDataIncidentHistoryIncidentAssignedUser? assignedUser = jsonConvert.convert<IncidentDetailsResponseDataIncidentHistoryIncidentAssignedUser>(json['assignedUser']);
	if (assignedUser != null) {
		incidentDetailsResponseDataIncidentHistoryIncident.assignedUser = assignedUser;
	}
	final String? createdUserId = jsonConvert.convert<String>(json['createdUserId']);
	if (createdUserId != null) {
		incidentDetailsResponseDataIncidentHistoryIncident.createdUserId = createdUserId;
	}
	final IncidentDetailsResponseDataIncidentHistoryIncidentCreatedUser? createdUser = jsonConvert.convert<IncidentDetailsResponseDataIncidentHistoryIncidentCreatedUser>(json['createdUser']);
	if (createdUser != null) {
		incidentDetailsResponseDataIncidentHistoryIncident.createdUser = createdUser;
	}
	final String? updateDate = jsonConvert.convert<String>(json['updateDate']);
	if (updateDate != null) {
		incidentDetailsResponseDataIncidentHistoryIncident.updateDate = updateDate;
	}
	final int? priorityLevelID = jsonConvert.convert<int>(json['priorityLevelID']);
	if (priorityLevelID != null) {
		incidentDetailsResponseDataIncidentHistoryIncident.priorityLevelID = priorityLevelID;
	}
	final IncidentDetailsResponseDataIncidentHistoryIncidentPriorityLevel? priorityLevel = jsonConvert.convert<IncidentDetailsResponseDataIncidentHistoryIncidentPriorityLevel>(json['priorityLevel']);
	if (priorityLevel != null) {
		incidentDetailsResponseDataIncidentHistoryIncident.priorityLevel = priorityLevel;
	}
	return incidentDetailsResponseDataIncidentHistoryIncident;
}

Map<String, dynamic> $IncidentDetailsResponseDataIncidentHistoryIncidentToJson(IncidentDetailsResponseDataIncidentHistoryIncident entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['incidentHistory'] =  entity.incidentHistory;
	data['images'] =  entity.images?.map((v) => v.toJson()).toList();
	data['transactions'] = entity.transactions;
	data['notes'] = entity.notes;
	data['createDate'] = entity.createDate;
	data['createTime'] = entity.createTime;
	data['districtName'] = entity.districtName;
	data['streetName'] = entity.streetName;
	data['address'] = entity.address;
	data['lat'] = entity.lat;
	data['long'] = entity.long;
	data['location'] = entity.location?.toJson();
	data['unitValue'] = entity.unitValue;
	data['amountUnitId'] = entity.amountUnitId;
	data['amountUnit'] = entity.amountUnit?.toJson();
	data['categoryId'] = entity.categoryId;
	data['category'] = entity.category?.toJson();
	data['subCategoryId'] = entity.subCategoryId;
	data['subCategory'] = entity.subCategory?.toJson();
	data['incidentStatusId'] = entity.incidentStatusId;
	data['status'] = entity.status?.toJson();
	data['updateStatusDate'] = entity.updateStatusDate;
	data['statusNote'] = entity.statusNote;
	data['statusUpdateUserId'] = entity.statusUpdateUserId;
	data['statusUpdateUser'] = entity.statusUpdateUser?.toJson();
	data['statusLat'] = entity.statusLat;
	data['statusLong'] = entity.statusLong;
	data['statusLocation'] = entity.statusLocation;
	data['assigningDate'] = entity.assigningDate;
	data['assigningNote'] = entity.assigningNote;
	data['assignedUser'] = entity.assignedUser?.toJson();
	data['createdUserId'] = entity.createdUserId;
	data['createdUser'] = entity.createdUser?.toJson();
	data['updateDate'] = entity.updateDate;
	data['priorityLevelID'] = entity.priorityLevelID;
	data['priorityLevel'] = entity.priorityLevel?.toJson();
	return data;
}

IncidentDetailsResponseDataIncidentHistoryIncidentImages $IncidentDetailsResponseDataIncidentHistoryIncidentImagesFromJson(Map<String, dynamic> json) {
	final IncidentDetailsResponseDataIncidentHistoryIncidentImages incidentDetailsResponseDataIncidentHistoryIncidentImages = IncidentDetailsResponseDataIncidentHistoryIncidentImages();
	final String? incident = jsonConvert.convert<String>(json['incident']);
	if (incident != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentImages.incident = incident;
	}
	final String? createdDate = jsonConvert.convert<String>(json['createdDate']);
	if (createdDate != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentImages.createdDate = createdDate;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentImages.name = name;
	}
	final String? path = jsonConvert.convert<String>(json['path']);
	if (path != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentImages.path = path;
	}
	final bool? isPrimary = jsonConvert.convert<bool>(json['isPrimary']);
	if (isPrimary != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentImages.isPrimary = isPrimary;
	}
	return incidentDetailsResponseDataIncidentHistoryIncidentImages;
}

Map<String, dynamic> $IncidentDetailsResponseDataIncidentHistoryIncidentImagesToJson(IncidentDetailsResponseDataIncidentHistoryIncidentImages entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['incident'] = entity.incident;
	data['createdDate'] = entity.createdDate;
	data['name'] = entity.name;
	data['path'] = entity.path;
	data['isPrimary'] = entity.isPrimary;
	return data;
}

IncidentDetailsResponseDataIncidentHistoryIncidentLocation $IncidentDetailsResponseDataIncidentHistoryIncidentLocationFromJson(Map<String, dynamic> json) {
	final IncidentDetailsResponseDataIncidentHistoryIncidentLocation incidentDetailsResponseDataIncidentHistoryIncidentLocation = IncidentDetailsResponseDataIncidentHistoryIncidentLocation();
	final String? type = jsonConvert.convert<String>(json['type']);
	if (type != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentLocation.type = type;
	}
	final List<double>? coordinates = jsonConvert.convertListNotNull<double>(json['coordinates']);
	if (coordinates != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentLocation.coordinates = coordinates;
	}
	return incidentDetailsResponseDataIncidentHistoryIncidentLocation;
}

Map<String, dynamic> $IncidentDetailsResponseDataIncidentHistoryIncidentLocationToJson(IncidentDetailsResponseDataIncidentHistoryIncidentLocation entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['type'] = entity.type;
	data['coordinates'] =  entity.coordinates;
	return data;
}

IncidentDetailsResponseDataIncidentHistoryIncidentAmountUnit $IncidentDetailsResponseDataIncidentHistoryIncidentAmountUnitFromJson(Map<String, dynamic> json) {
	final IncidentDetailsResponseDataIncidentHistoryIncidentAmountUnit incidentDetailsResponseDataIncidentHistoryIncidentAmountUnit = IncidentDetailsResponseDataIncidentHistoryIncidentAmountUnit();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentAmountUnit.id = id;
	}
	final String? arabicName = jsonConvert.convert<String>(json['arabicName']);
	if (arabicName != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentAmountUnit.arabicName = arabicName;
	}
	final String? englishName = jsonConvert.convert<String>(json['englishName']);
	if (englishName != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentAmountUnit.englishName = englishName;
	}
	final List<String>? incidents = jsonConvert.convertListNotNull<String>(json['incidents']);
	if (incidents != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentAmountUnit.incidents = incidents;
	}
	return incidentDetailsResponseDataIncidentHistoryIncidentAmountUnit;
}

Map<String, dynamic> $IncidentDetailsResponseDataIncidentHistoryIncidentAmountUnitToJson(IncidentDetailsResponseDataIncidentHistoryIncidentAmountUnit entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['arabicName'] = entity.arabicName;
	data['englishName'] = entity.englishName;
	data['incidents'] =  entity.incidents;
	return data;
}

IncidentDetailsResponseDataIncidentHistoryIncidentCategory $IncidentDetailsResponseDataIncidentHistoryIncidentCategoryFromJson(Map<String, dynamic> json) {
	final IncidentDetailsResponseDataIncidentHistoryIncidentCategory incidentDetailsResponseDataIncidentHistoryIncidentCategory = IncidentDetailsResponseDataIncidentHistoryIncidentCategory();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentCategory.id = id;
	}
	final String? arabicName = jsonConvert.convert<String>(json['arabicName']);
	if (arabicName != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentCategory.arabicName = arabicName;
	}
	final String? englishName = jsonConvert.convert<String>(json['englishName']);
	if (englishName != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentCategory.englishName = englishName;
	}
	final String? icon = jsonConvert.convert<String>(json['icon']);
	if (icon != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentCategory.icon = icon;
	}
	final int? order = jsonConvert.convert<int>(json['order']);
	if (order != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentCategory.order = order;
	}
	final String? color = jsonConvert.convert<String>(json['color']);
	if (color != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentCategory.color = color;
	}
	final List<String>? incidents = jsonConvert.convertListNotNull<String>(json['incidents']);
	if (incidents != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentCategory.incidents = incidents;
	}
	return incidentDetailsResponseDataIncidentHistoryIncidentCategory;
}

Map<String, dynamic> $IncidentDetailsResponseDataIncidentHistoryIncidentCategoryToJson(IncidentDetailsResponseDataIncidentHistoryIncidentCategory entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['arabicName'] = entity.arabicName;
	data['englishName'] = entity.englishName;
	data['icon'] = entity.icon;
	data['order'] = entity.order;
	data['color'] = entity.color;
	data['incidents'] =  entity.incidents;
	return data;
}

IncidentDetailsResponseDataIncidentHistoryIncidentSubCategory $IncidentDetailsResponseDataIncidentHistoryIncidentSubCategoryFromJson(Map<String, dynamic> json) {
	final IncidentDetailsResponseDataIncidentHistoryIncidentSubCategory incidentDetailsResponseDataIncidentHistoryIncidentSubCategory = IncidentDetailsResponseDataIncidentHistoryIncidentSubCategory();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentSubCategory.id = id;
	}
	final String? arabicName = jsonConvert.convert<String>(json['arabicName']);
	if (arabicName != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentSubCategory.arabicName = arabicName;
	}
	final String? englishName = jsonConvert.convert<String>(json['englishName']);
	if (englishName != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentSubCategory.englishName = englishName;
	}
	final String? icon = jsonConvert.convert<String>(json['icon']);
	if (icon != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentSubCategory.icon = icon;
	}
	final int? order = jsonConvert.convert<int>(json['order']);
	if (order != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentSubCategory.order = order;
	}
	final String? color = jsonConvert.convert<String>(json['color']);
	if (color != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentSubCategory.color = color;
	}
	final List<String>? incidents = jsonConvert.convertListNotNull<String>(json['incidents']);
	if (incidents != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentSubCategory.incidents = incidents;
	}
	final int? mainCategoryId = jsonConvert.convert<int>(json['mainCategoryId']);
	if (mainCategoryId != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentSubCategory.mainCategoryId = mainCategoryId;
	}
	final int? amountUnitId = jsonConvert.convert<int>(json['amountUnitId']);
	if (amountUnitId != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentSubCategory.amountUnitId = amountUnitId;
	}
	final String? mainCategory = jsonConvert.convert<String>(json['mainCategory']);
	if (mainCategory != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentSubCategory.mainCategory = mainCategory;
	}
	final String? amountUnit = jsonConvert.convert<String>(json['amountUnit']);
	if (amountUnit != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentSubCategory.amountUnit = amountUnit;
	}
	return incidentDetailsResponseDataIncidentHistoryIncidentSubCategory;
}

Map<String, dynamic> $IncidentDetailsResponseDataIncidentHistoryIncidentSubCategoryToJson(IncidentDetailsResponseDataIncidentHistoryIncidentSubCategory entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['arabicName'] = entity.arabicName;
	data['englishName'] = entity.englishName;
	data['icon'] = entity.icon;
	data['order'] = entity.order;
	data['color'] = entity.color;
	data['incidents'] =  entity.incidents;
	data['mainCategoryId'] = entity.mainCategoryId;
	data['amountUnitId'] = entity.amountUnitId;
	data['mainCategory'] = entity.mainCategory;
	data['amountUnit'] = entity.amountUnit;
	return data;
}

IncidentDetailsResponseDataIncidentHistoryIncidentStatus $IncidentDetailsResponseDataIncidentHistoryIncidentStatusFromJson(Map<String, dynamic> json) {
	final IncidentDetailsResponseDataIncidentHistoryIncidentStatus incidentDetailsResponseDataIncidentHistoryIncidentStatus = IncidentDetailsResponseDataIncidentHistoryIncidentStatus();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentStatus.id = id;
	}
	final String? arabicName = jsonConvert.convert<String>(json['arabicName']);
	if (arabicName != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentStatus.arabicName = arabicName;
	}
	final String? englishName = jsonConvert.convert<String>(json['englishName']);
	if (englishName != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentStatus.englishName = englishName;
	}
	final String? color = jsonConvert.convert<String>(json['color']);
	if (color != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentStatus.color = color;
	}
	final List<String>? incidents = jsonConvert.convertListNotNull<String>(json['incidents']);
	if (incidents != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentStatus.incidents = incidents;
	}
	return incidentDetailsResponseDataIncidentHistoryIncidentStatus;
}

Map<String, dynamic> $IncidentDetailsResponseDataIncidentHistoryIncidentStatusToJson(IncidentDetailsResponseDataIncidentHistoryIncidentStatus entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['arabicName'] = entity.arabicName;
	data['englishName'] = entity.englishName;
	data['color'] = entity.color;
	data['incidents'] =  entity.incidents;
	return data;
}

IncidentDetailsResponseDataIncidentHistoryIncidentStatusUpdateUser $IncidentDetailsResponseDataIncidentHistoryIncidentStatusUpdateUserFromJson(Map<String, dynamic> json) {
	final IncidentDetailsResponseDataIncidentHistoryIncidentStatusUpdateUser incidentDetailsResponseDataIncidentHistoryIncidentStatusUpdateUser = IncidentDetailsResponseDataIncidentHistoryIncidentStatusUpdateUser();
	final String? firstName = jsonConvert.convert<String>(json['firstName']);
	if (firstName != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentStatusUpdateUser.firstName = firstName;
	}
	final String? lastName = jsonConvert.convert<String>(json['lastName']);
	if (lastName != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentStatusUpdateUser.lastName = lastName;
	}
	final String? userName = jsonConvert.convert<String>(json['userName']);
	if (userName != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentStatusUpdateUser.userName = userName;
	}
	final String? phoneNumber = jsonConvert.convert<String>(json['phoneNumber']);
	if (phoneNumber != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentStatusUpdateUser.phoneNumber = phoneNumber;
	}
	return incidentDetailsResponseDataIncidentHistoryIncidentStatusUpdateUser;
}

Map<String, dynamic> $IncidentDetailsResponseDataIncidentHistoryIncidentStatusUpdateUserToJson(IncidentDetailsResponseDataIncidentHistoryIncidentStatusUpdateUser entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['firstName'] = entity.firstName;
	data['lastName'] = entity.lastName;
	data['userName'] = entity.userName;
	data['phoneNumber'] = entity.phoneNumber;
	return data;
}

IncidentDetailsResponseDataIncidentHistoryIncidentAssignedUser $IncidentDetailsResponseDataIncidentHistoryIncidentAssignedUserFromJson(Map<String, dynamic> json) {
	final IncidentDetailsResponseDataIncidentHistoryIncidentAssignedUser incidentDetailsResponseDataIncidentHistoryIncidentAssignedUser = IncidentDetailsResponseDataIncidentHistoryIncidentAssignedUser();
	final String? firstName = jsonConvert.convert<String>(json['firstName']);
	if (firstName != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentAssignedUser.firstName = firstName;
	}
	final String? lastName = jsonConvert.convert<String>(json['lastName']);
	if (lastName != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentAssignedUser.lastName = lastName;
	}
	final String? officeId = jsonConvert.convert<String>(json['officeId']);
	if (officeId != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentAssignedUser.officeId = officeId;
	}
	final String? job = jsonConvert.convert<String>(json['job']);
	if (job != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentAssignedUser.job = job;
	}
	final String? idNumber = jsonConvert.convert<String>(json['idNumber']);
	if (idNumber != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentAssignedUser.idNumber = idNumber;
	}
	final String? birthDate = jsonConvert.convert<String>(json['birthDate']);
	if (birthDate != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentAssignedUser.birthDate = birthDate;
	}
	final String? fullName = jsonConvert.convert<String>(json['fullName']);
	if (fullName != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentAssignedUser.fullName = fullName;
	}
	final String? userName = jsonConvert.convert<String>(json['userName']);
	if (userName != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentAssignedUser.userName = userName;
	}
	final String? phoneNumber = jsonConvert.convert<String>(json['phoneNumber']);
	if (phoneNumber != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentAssignedUser.phoneNumber = phoneNumber;
	}
	return incidentDetailsResponseDataIncidentHistoryIncidentAssignedUser;
}

Map<String, dynamic> $IncidentDetailsResponseDataIncidentHistoryIncidentAssignedUserToJson(IncidentDetailsResponseDataIncidentHistoryIncidentAssignedUser entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['firstName'] = entity.firstName;
	data['lastName'] = entity.lastName;
	data['officeId'] = entity.officeId;
	data['job'] = entity.job;
	data['idNumber'] = entity.idNumber;
	data['birthDate'] = entity.birthDate;
	data['fullName'] = entity.fullName;
	data['userName'] = entity.userName;
	data['phoneNumber'] = entity.phoneNumber;
	return data;
}

IncidentDetailsResponseDataIncidentHistoryIncidentCreatedUser $IncidentDetailsResponseDataIncidentHistoryIncidentCreatedUserFromJson(Map<String, dynamic> json) {
	final IncidentDetailsResponseDataIncidentHistoryIncidentCreatedUser incidentDetailsResponseDataIncidentHistoryIncidentCreatedUser = IncidentDetailsResponseDataIncidentHistoryIncidentCreatedUser();
	final String? firstName = jsonConvert.convert<String>(json['firstName']);
	if (firstName != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentCreatedUser.firstName = firstName;
	}
	final String? lastName = jsonConvert.convert<String>(json['lastName']);
	if (lastName != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentCreatedUser.lastName = lastName;
	}
	final String? job = jsonConvert.convert<String>(json['job']);
	if (job != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentCreatedUser.job = job;
	}
	final String? userName = jsonConvert.convert<String>(json['userName']);
	if (userName != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentCreatedUser.userName = userName;
	}
	final String? phoneNumber = jsonConvert.convert<String>(json['phoneNumber']);
	if (phoneNumber != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentCreatedUser.phoneNumber = phoneNumber;
	}
	return incidentDetailsResponseDataIncidentHistoryIncidentCreatedUser;
}

Map<String, dynamic> $IncidentDetailsResponseDataIncidentHistoryIncidentCreatedUserToJson(IncidentDetailsResponseDataIncidentHistoryIncidentCreatedUser entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['firstName'] = entity.firstName;
	data['lastName'] = entity.lastName;
	data['job'] = entity.job;
	data['userName'] = entity.userName;
	data['phoneNumber'] = entity.phoneNumber;
	return data;
}

IncidentDetailsResponseDataIncidentHistoryIncidentPriorityLevel $IncidentDetailsResponseDataIncidentHistoryIncidentPriorityLevelFromJson(Map<String, dynamic> json) {
	final IncidentDetailsResponseDataIncidentHistoryIncidentPriorityLevel incidentDetailsResponseDataIncidentHistoryIncidentPriorityLevel = IncidentDetailsResponseDataIncidentHistoryIncidentPriorityLevel();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentPriorityLevel.id = id;
	}
	final String? arabicName = jsonConvert.convert<String>(json['arabicName']);
	if (arabicName != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentPriorityLevel.arabicName = arabicName;
	}
	final String? englishName = jsonConvert.convert<String>(json['englishName']);
	if (englishName != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentPriorityLevel.englishName = englishName;
	}
	final String? colorCode = jsonConvert.convert<String>(json['colorCode']);
	if (colorCode != null) {
		incidentDetailsResponseDataIncidentHistoryIncidentPriorityLevel.colorCode = colorCode;
	}
	return incidentDetailsResponseDataIncidentHistoryIncidentPriorityLevel;
}

Map<String, dynamic> $IncidentDetailsResponseDataIncidentHistoryIncidentPriorityLevelToJson(IncidentDetailsResponseDataIncidentHistoryIncidentPriorityLevel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['arabicName'] = entity.arabicName;
	data['englishName'] = entity.englishName;
	data['colorCode'] = entity.colorCode;
	return data;
}

IncidentDetailsResponseDataIncidentHistoryHistoricalImages $IncidentDetailsResponseDataIncidentHistoryHistoricalImagesFromJson(Map<String, dynamic> json) {
	final IncidentDetailsResponseDataIncidentHistoryHistoricalImages incidentDetailsResponseDataIncidentHistoryHistoricalImages = IncidentDetailsResponseDataIncidentHistoryHistoricalImages();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		incidentDetailsResponseDataIncidentHistoryHistoricalImages.id = id;
	}
	final String? createdDate = jsonConvert.convert<String>(json['createdDate']);
	if (createdDate != null) {
		incidentDetailsResponseDataIncidentHistoryHistoricalImages.createdDate = createdDate;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		incidentDetailsResponseDataIncidentHistoryHistoricalImages.name = name;
	}
	final String? path = jsonConvert.convert<String>(json['path']);
	if (path != null) {
		incidentDetailsResponseDataIncidentHistoryHistoricalImages.path = path;
	}
	final bool? isPrimary = jsonConvert.convert<bool>(json['isPrimary']);
	if (isPrimary != null) {
		incidentDetailsResponseDataIncidentHistoryHistoricalImages.isPrimary = isPrimary;
	}
	return incidentDetailsResponseDataIncidentHistoryHistoricalImages;
}

Map<String, dynamic> $IncidentDetailsResponseDataIncidentHistoryHistoricalImagesToJson(IncidentDetailsResponseDataIncidentHistoryHistoricalImages entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['createdDate'] = entity.createdDate;
	data['name'] = entity.name;
	data['path'] = entity.path;
	data['isPrimary'] = entity.isPrimary;
	return data;
}

IncidentDetailsResponseDataIncidentHistoryAssignedUser $IncidentDetailsResponseDataIncidentHistoryAssignedUserFromJson(Map<String, dynamic> json) {
	final IncidentDetailsResponseDataIncidentHistoryAssignedUser incidentDetailsResponseDataIncidentHistoryAssignedUser = IncidentDetailsResponseDataIncidentHistoryAssignedUser();
	final String? firstName = jsonConvert.convert<String>(json['firstName']);
	if (firstName != null) {
		incidentDetailsResponseDataIncidentHistoryAssignedUser.firstName = firstName;
	}
	final String? lastName = jsonConvert.convert<String>(json['lastName']);
	if (lastName != null) {
		incidentDetailsResponseDataIncidentHistoryAssignedUser.lastName = lastName;
	}
	final String? officeId = jsonConvert.convert<String>(json['officeId']);
	if (officeId != null) {
		incidentDetailsResponseDataIncidentHistoryAssignedUser.officeId = officeId;
	}
	final String? job = jsonConvert.convert<String>(json['job']);
	if (job != null) {
		incidentDetailsResponseDataIncidentHistoryAssignedUser.job = job;
	}
	final String? idNumber = jsonConvert.convert<String>(json['idNumber']);
	if (idNumber != null) {
		incidentDetailsResponseDataIncidentHistoryAssignedUser.idNumber = idNumber;
	}
	final String? birthDate = jsonConvert.convert<String>(json['birthDate']);
	if (birthDate != null) {
		incidentDetailsResponseDataIncidentHistoryAssignedUser.birthDate = birthDate;
	}
	final String? fullName = jsonConvert.convert<String>(json['fullName']);
	if (fullName != null) {
		incidentDetailsResponseDataIncidentHistoryAssignedUser.fullName = fullName;
	}
	final String? office = jsonConvert.convert<String>(json['office']);
	if (office != null) {
		incidentDetailsResponseDataIncidentHistoryAssignedUser.office = office;
	}
	final List<dynamic>? projectUsers = jsonConvert.convertListNotNull<dynamic>(json['projectUsers']);
	if (projectUsers != null) {
		incidentDetailsResponseDataIncidentHistoryAssignedUser.projectUsers = projectUsers;
	}
	final List<dynamic>? roles = jsonConvert.convertListNotNull<dynamic>(json['roles']);
	if (roles != null) {
		incidentDetailsResponseDataIncidentHistoryAssignedUser.roles = roles;
	}
	final String? categories = jsonConvert.convert<String>(json['categories']);
	if (categories != null) {
		incidentDetailsResponseDataIncidentHistoryAssignedUser.categories = categories;
	}
	final String? userBaladiaDepartment = jsonConvert.convert<String>(json['userBaladiaDepartment']);
	if (userBaladiaDepartment != null) {
		incidentDetailsResponseDataIncidentHistoryAssignedUser.userBaladiaDepartment = userBaladiaDepartment;
	}
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		incidentDetailsResponseDataIncidentHistoryAssignedUser.id = id;
	}
	final String? userName = jsonConvert.convert<String>(json['userName']);
	if (userName != null) {
		incidentDetailsResponseDataIncidentHistoryAssignedUser.userName = userName;
	}
	final String? normalizedUserName = jsonConvert.convert<String>(json['normalizedUserName']);
	if (normalizedUserName != null) {
		incidentDetailsResponseDataIncidentHistoryAssignedUser.normalizedUserName = normalizedUserName;
	}
	final String? email = jsonConvert.convert<String>(json['email']);
	if (email != null) {
		incidentDetailsResponseDataIncidentHistoryAssignedUser.email = email;
	}
	final String? normalizedEmail = jsonConvert.convert<String>(json['normalizedEmail']);
	if (normalizedEmail != null) {
		incidentDetailsResponseDataIncidentHistoryAssignedUser.normalizedEmail = normalizedEmail;
	}
	final bool? emailConfirmed = jsonConvert.convert<bool>(json['emailConfirmed']);
	if (emailConfirmed != null) {
		incidentDetailsResponseDataIncidentHistoryAssignedUser.emailConfirmed = emailConfirmed;
	}
	final String? passwordHash = jsonConvert.convert<String>(json['passwordHash']);
	if (passwordHash != null) {
		incidentDetailsResponseDataIncidentHistoryAssignedUser.passwordHash = passwordHash;
	}
	final String? securityStamp = jsonConvert.convert<String>(json['securityStamp']);
	if (securityStamp != null) {
		incidentDetailsResponseDataIncidentHistoryAssignedUser.securityStamp = securityStamp;
	}
	final String? concurrencyStamp = jsonConvert.convert<String>(json['concurrencyStamp']);
	if (concurrencyStamp != null) {
		incidentDetailsResponseDataIncidentHistoryAssignedUser.concurrencyStamp = concurrencyStamp;
	}
	final String? phoneNumber = jsonConvert.convert<String>(json['phoneNumber']);
	if (phoneNumber != null) {
		incidentDetailsResponseDataIncidentHistoryAssignedUser.phoneNumber = phoneNumber;
	}
	final bool? phoneNumberConfirmed = jsonConvert.convert<bool>(json['phoneNumberConfirmed']);
	if (phoneNumberConfirmed != null) {
		incidentDetailsResponseDataIncidentHistoryAssignedUser.phoneNumberConfirmed = phoneNumberConfirmed;
	}
	final bool? twoFactorEnabled = jsonConvert.convert<bool>(json['twoFactorEnabled']);
	if (twoFactorEnabled != null) {
		incidentDetailsResponseDataIncidentHistoryAssignedUser.twoFactorEnabled = twoFactorEnabled;
	}
	final String? lockoutEnd = jsonConvert.convert<String>(json['lockoutEnd']);
	if (lockoutEnd != null) {
		incidentDetailsResponseDataIncidentHistoryAssignedUser.lockoutEnd = lockoutEnd;
	}
	final bool? lockoutEnabled = jsonConvert.convert<bool>(json['lockoutEnabled']);
	if (lockoutEnabled != null) {
		incidentDetailsResponseDataIncidentHistoryAssignedUser.lockoutEnabled = lockoutEnabled;
	}
	final int? accessFailedCount = jsonConvert.convert<int>(json['accessFailedCount']);
	if (accessFailedCount != null) {
		incidentDetailsResponseDataIncidentHistoryAssignedUser.accessFailedCount = accessFailedCount;
	}
	return incidentDetailsResponseDataIncidentHistoryAssignedUser;
}

Map<String, dynamic> $IncidentDetailsResponseDataIncidentHistoryAssignedUserToJson(IncidentDetailsResponseDataIncidentHistoryAssignedUser entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['firstName'] = entity.firstName;
	data['lastName'] = entity.lastName;
	data['officeId'] = entity.officeId;
	data['job'] = entity.job;
	data['idNumber'] = entity.idNumber;
	data['birthDate'] = entity.birthDate;
	data['fullName'] = entity.fullName;
	data['office'] = entity.office;
	data['projectUsers'] =  entity.projectUsers;
	data['roles'] =  entity.roles;
	data['categories'] = entity.categories;
	data['userBaladiaDepartment'] = entity.userBaladiaDepartment;
	data['id'] = entity.id;
	data['userName'] = entity.userName;
	data['normalizedUserName'] = entity.normalizedUserName;
	data['email'] = entity.email;
	data['normalizedEmail'] = entity.normalizedEmail;
	data['emailConfirmed'] = entity.emailConfirmed;
	data['passwordHash'] = entity.passwordHash;
	data['securityStamp'] = entity.securityStamp;
	data['concurrencyStamp'] = entity.concurrencyStamp;
	data['phoneNumber'] = entity.phoneNumber;
	data['phoneNumberConfirmed'] = entity.phoneNumberConfirmed;
	data['twoFactorEnabled'] = entity.twoFactorEnabled;
	data['lockoutEnd'] = entity.lockoutEnd;
	data['lockoutEnabled'] = entity.lockoutEnabled;
	data['accessFailedCount'] = entity.accessFailedCount;
	return data;
}