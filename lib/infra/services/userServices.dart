import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserService {
  final String _host = '192.168.31.106';
  final int _port = 8080;

  Future<String> registerUser(UserRegisterDTO userRegisterDTO) async {
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
      Map<String, dynamic> mapError = jsonDecode(response.body);
      throw Exception(mapError['errors'][0]);
    }
    return 'Cadastro efetuado!';
  }
}

class UserRegisterDTO {
  final String _name;
  final String _email;
  final String _password;
  final String _identity;
  final String? _dateOfBirth;
  final String _numberPhone;
  final TypeUser _typeUser;

  UserRegisterDTO(this._name, this._email, this._password, this._identity,
      this._dateOfBirth, this._numberPhone, this._typeUser);

  TypeUser get typeUser => _typeUser;

  String get numberPhone => _numberPhone;

  String get dateOfBirth => _dateOfBirth!;

  String get identity => _identity;

  String get password => _password;

  String get email => _email;

  String get name => _name;

  Map<String, dynamic> toJson() {
    switch (_typeUser) {
      case TypeUser.CLIENT:
        return _toJsonClient();
      case TypeUser.ENTERPRISE:
        return _toJsonEnterprise();
    }
  }

  Map<String, dynamic> _toJsonClient() {
    var dateSplit = _dateOfBirth!.split('/');
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

  Map<String, dynamic> _toJsonEnterprise() {
    return {
      'name': _name,
      'email': _email,
      'password': _password,
      'identity': _identity,
      'numberPhone': _numberPhone,
      'typeUser': _typeUser.name,
    };
  }
}

enum TypeUser { CLIENT, ENTERPRISE }
