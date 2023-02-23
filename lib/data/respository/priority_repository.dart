import 'package:Field_Monitoring/data/local/dao/priorities/priorities_dao.dart';
import 'package:Field_Monitoring/data/local/entities/priorities/priority_entity.dart';
import 'package:Field_Monitoring/data/local/mappers/mappers.dart';
import 'package:Field_Monitoring/data/network/apis/priorities/priorities_api.dart';
import 'package:Field_Monitoring/models/PriorityLevels/Priority_level_list.dart';
import 'package:Field_Monitoring/models/PriorityLevels/priorrity_level.dart';
import 'package:injectable/injectable.dart';
import 'package:sembast/sembast.dart';
import '../local/constants/db_constants.dart';
@Singleton()
class PriorityRepository {


  // Future<PriorityLevelList> getPriorities() async {
  //   return PriorityLevelList(priorities: <PriorityLevel>[
  //     PriorityLevel(id: 1, arabicName: 'منخفض', englishName: 'Low'),
  //     PriorityLevel(id: 2, arabicName: 'متوسط', englishName: 'Medium'),
  //     PriorityLevel(id: 3, arabicName: 'عالى', englishName: 'High'),
  //   ]);
  // }



  //data source priorities
  final PriorityDao _priorityDao;
  //api priorities
  final prioritiesApi _prioritiesApi;


  PriorityRepository(this._priorityDao, this._prioritiesApi);
//priorities

  // priorities: ---------------------------------------------------------------------
  Future<PriorityLevelList> getPriorities() async {
    // check to see if posts are present in database, then fetch from database
    // else make a network call to get all posts, store them into database for
    // later use
    return await _prioritiesApi.getPriorities().then((prioritiesList) {
      prioritiesList.priorities?.forEach((priority) {
        _priorityDao.insertPriority(PriorityEntity.fromRemote(priority));
      });

      return prioritiesList;
    }).catchError((error) => throw error);
  }

  Future<List<PriorityLevel>> findPriorityById(int id) {
    //creating filter
    List<Filter> filters = [];

    //check to see if dataLogsType is not null
    Filter dataLogTypeFilter = Filter.equals(DBConstants.FIELD_ID, id);
    filters.add(dataLogTypeFilter);

    //making db call
    return _priorityDao
        .findAllCategoriesSortedById()
        .then((priorities) =>Mappers().mapListPriorities(priorities))
        .catchError((error) => throw error);
  }

  Future<int> insertPriority(PriorityLevel priorityLevel) => _priorityDao
      .insertPriority(PriorityEntity.fromRemote(priorityLevel))
      .then((id) => id)
      .catchError((error) => throw error);

  Future<int> updatePriority(PriorityLevel priorityLevel) => _priorityDao
      .updatePriority(PriorityEntity.fromRemote(priorityLevel))
      .then((id) => id)
      .catchError((error) => throw error);

  Future<int> deletePriority(PriorityLevel priorityLevel) => _priorityDao
      .updatePriority(PriorityEntity.fromRemote(priorityLevel))
      .then((id) => id)
      .catchError((error) => throw error);
}
