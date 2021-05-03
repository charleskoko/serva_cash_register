import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'company.dart';

class User extends Equatable {
  String id, firstName, lastName, email, mobile;
  Company company;
  int isAdmin;

  User(this.id, this.firstName, this.email, this.isAdmin, this.lastName,
      this.mobile);

  User.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.company = Company.fromJson(json['company']);
    this.firstName = json['first_name'];
    this.email = json['email'];
    this.isAdmin = json['is_admin'];
    this.lastName = json['last_name'];
    this.mobile = json['mobile'];
  }

  @override
  List<Object> get props => [id, firstName, lastName, email, mobile, isAdmin];
}
