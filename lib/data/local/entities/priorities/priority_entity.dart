import 'package:boilerplate/models/PriorityLevels/priorrity_level.dart';
import 'package:floor/floor.dart';


@entity
class PriorityEntity {
  @primaryKey
  int? id;
  String? arabicName;
  String? englishName;
  String? colorCode;

  PriorityEntity({this.id, this.arabicName, this.englishName, this.colorCode});

  factory PriorityEntity.fromRemote(PriorityLevel priority) => PriorityEntity(
      id: priority.id,
      arabicName: priority.arabicName,
      englishName: priority.englishName,
      colorCode: priority.colorCode);

  factory PriorityEntity.fromMap(Map<String, dynamic> json) => PriorityEntity(
        id: json['id'],
        arabicName: json['arabicName'],
        englishName: json['englishName'],
        colorCode: json['colorCode'],
      );

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;

    data['arabicName'] = this.arabicName;
    data['englishName'] = this.englishName;
    data['colorCode'] = colorCode;

    return data;
  }

  PriorityLevel toRemote() => PriorityLevel(
      id: id,
      englishName: englishName,
      arabicName: arabicName,
      colorCode: colorCode);
}
