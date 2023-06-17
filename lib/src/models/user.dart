import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String? id;
  String? imagen;
  String? name;
  String? lastname;
  String? phone;
  String? email;
  String? password;

  User({
    this.id,
    this.imagen,
    this.name,
    this.lastname,
    this.phone,
    this.email,
    this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        imagen: json["imagen"],
        name: json["name"],
        lastname: json["lastname"],
        phone: json["phone"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "imagen": imagen,
        "name": name,
        "lastname": lastname,
        "phone": phone,
        "email": email,
        "password": password,
      };
}
