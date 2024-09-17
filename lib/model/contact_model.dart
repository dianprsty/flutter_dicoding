class ContactModel {
  final int _id;
  String _name;
  String _number;

  ContactModel({required id, required name, required number})
      : _id = id,
        _name = name,
        _number = number;

  int get id => _id;
  String get name => _name;
  String get number => _number;

  void setName(String name) {
    _name = name;
  }

  void setNumber(String number) {
    _number = number;
  }

  String eachWordFirstLetterUpperCase(String? name) {
    List<String> nameList = name?.split(" ") ?? [];
    String result = "";
    for (int i = 0; i < nameList.length; i++) {
      if (i == 2) break;
      result = "$result${nameList[i].substring(0, 1).toUpperCase()}";
    }

    return result;
  }
}
