import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  int? id;
  String? name;
  String? firstName;
  String? email;
  String? description;
  String? role;
  String? login;
  String? password;

  User({
    this.id,
    this.name,
    this.firstName,
    this.email,
    this.description,
    this.role,
    this.login,
    this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        firstName: json['firstName'],
        email: json['email'],
        description: json['description'],
        role: json['role'],
        login: json['login'],
        password: json['password'],
      );

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'name': this.name,
        'firstName': this.firstName,
        'email': this.email,
        'description': this.description,
        'role': this.role,
        'login': this.login,
        'password': this.password,
      };
}
