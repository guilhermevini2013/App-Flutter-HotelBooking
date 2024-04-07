import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserService {
  final String _host = '192.168.31.106';
  final int _port = 8080;

  Future<void> registerUser(UserRegisterDTO userRegisterDTO) async {
    final Uri apiUrl = Uri(
      scheme: 'http',
      host: _host,
      port: _port,
      path: '/user/register',
    );
    var response = await http.post(
      apiUrl,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(userRegisterDTO.toJson()),
    );
    if (response.statusCode >= 400) {
      throw Exception('Algo deu errado!');
    }
  }
}

class UserRegisterDTO {
  final String _name;
  final String _email;
  final String _password;
  final String _identity;
  final String _dateOfBirth;
  final String _numberPhone;
  final TypeUser _typeUser;

  UserRegisterDTO(this._name, this._email, this._password, this._identity,
      this._dateOfBirth, this._numberPhone, this._typeUser);

  TypeUser get typeUser => _typeUser;

  String get numberPhone => _numberPhone;

  String get dateOfBirth => _dateOfBirth;

  String get identity => _identity;

  String get password => _password;

  String get email => _email;

  String get name => _name;

  Map<String, dynamic> toJson() {
    var dateSplit = _dateOfBirth.split('/');
    return {
      'name': _name,
      'email': _email,
      'password': _password,
      'identity': _identity,
      'numberPhone': _numberPhone,
      'typeUser': _typeUser.name,
      'dateOfBirth': '${dateSplit[2]}-${dateSplit[1]}-${dateSplit[0]}'
    };
  }
}

enum TypeUser { CLIENT, ENTERPRISE }