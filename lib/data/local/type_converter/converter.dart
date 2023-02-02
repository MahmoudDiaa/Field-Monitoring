class Converters {
  String convertToString(List<dynamic> value) {
    return value.toString();
  }
  List<dynamic> convertToList(String value) {
    return value.split(',');
  }

}