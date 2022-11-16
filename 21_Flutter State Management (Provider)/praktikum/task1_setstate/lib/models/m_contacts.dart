class ContactModel {
  String name;
  String phone;
  ContactModel({
    required this.name,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return {'name': name, 'phone': phone};
  }
}
