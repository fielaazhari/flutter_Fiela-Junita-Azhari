// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserDio {
  int id;
  String email;
  String first_name;
  String last_name;
  String avatar;
  UserDio({
    required this.id,
    required this.email,
    required this.first_name,
    required this.last_name,
    required this.avatar,
  });

  Map toJson() => {
        id: id,
        email: 'email',
        first_name: 'first_name',
        last_name: 'last_name',
        avatar: 'avatar',
      };

  UserDio.fromJson(Map json)
      : id = json['id'],
        email = json['email'],
        first_name = json['first_name'],
        last_name = json['last_name'],
        avatar = json['avatar'];
  // link = json['avatar'];
}
