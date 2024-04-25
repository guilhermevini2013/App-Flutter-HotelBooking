import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../model-view/register-vm.dart';

class UserService {
  final String _host = '192.168.31.106';
  final int _port = 8080;

  Future<void> registerUser(RegisterModelView registerModelView) async {
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
      body: jsonEncode(registerModelView.toJson()),
    );
    if (response.statusCode >= 400) {
      Map<String, dynamic> mapError = jsonDecode(response.body);
      throw Exception(mapError['errors'][0]);
    }
  }
}

enum TypeUser { CLIENT, ENTERPRISE }
