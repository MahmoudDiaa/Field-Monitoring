import 'package:Field_Monitoring/data/network/constants/endpoints.dart';

enum CategoryListViewMode { List, Radiobutton, SubCategoriesGroupedImageGrid }

enum SubCategoryListViewMode {
  ImageList,
  ImageGrid,
  ImageGridGrouped,
  Radiobutton
}

enum PriorityListViewMode { List, Radiobutton }

enum IncidentListViewMode { List, Radiobutton }

enum AuthScreenMode { Login, SignUp, ChangePassword }

enum IncidentStatusEnum {
  New,
  Assigned,
  Solved,
  Upped,
  SolvedInitially,
  Canceled,
  Unkown
}

extension IncidentStatusExtension on IncidentStatusEnum {
  int? get id {
    switch (this) {
      case IncidentStatusEnum.Assigned:
        return 11;
      case IncidentStatusEnum.Solved:
        return 12;
      case IncidentStatusEnum.New:
        return 10;
      case IncidentStatusEnum.SolvedInitially:
        return 14;
      case IncidentStatusEnum.Upped:
        return 15;
      default:
        return null;
    }
  }

  String? get workflowSubmitEndpointName {
    switch (this) {
      case IncidentStatusEnum.Assigned:
        return Endpoints.baseUrl1 + "/Incidents/Assign";
      case IncidentStatusEnum.Solved:
        return Endpoints.baseUrl1 + "/Incidents/FinallyDone";
      case IncidentStatusEnum.New:
        return null;
      case IncidentStatusEnum.SolvedInitially:
        return Endpoints.baseUrl1 + "/Incidents/DoneInitially";
      case IncidentStatusEnum.Upped:
        return Endpoints.baseUrl1 + "/Incidents/Taseed";
      default:
        return null;
    }
  }
}
