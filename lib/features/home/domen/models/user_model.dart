class UserModel {
  String name;
  String age;
  String city;
  String birthday;
  // DateTime birthday;
  String description;
  List<String> interests;
  List<String> photos;

  UserModel({
    required this.name,
    required this.age,
    required this.city,
    required this.birthday,
    required this.description,
    required this.interests,
    required this.photos,
  });
}