class User {
  String first_name;
  String last_name;
  String password;
  String photo;
  String website;

  User({
    required this.first_name,
    required this.last_name,
    required this.password,
    required this.photo,
    required this.website,
  });
}

class Event {
  String title;
  String description;
  String photo;
  User host;
  List<User> signed;

  Event({
    required this.title,
    required this.description,
    required this.photo,
    required this.host,
    required this.signed,
  });
}
