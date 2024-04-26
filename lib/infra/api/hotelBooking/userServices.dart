import 'dart:convert';

import 'package:apphotelbooking/infra/api/hotelBooking/config-api.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model-view/login-vm.dart';
import '../../../model-view/register-vm.dart';

class UserService {
  final ConfigAPI _configAPI = ConfigAPI();

  Future<void> registerUser(RegisterModelView registerModelView) async {
    final Uri apiUrl = Uri(
      scheme: 'http',
      host: _configAPI.host,
      port: _configAPI.port,
      path: '/user/register',
    );
    var response = await http.post(
      apiUrl,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(registerModelView.toJson()),
    );
    _verifyResponse(response);
  }

  Future<void> loginUser(LoginViewModel loginViewModel) async {
    final Uri apiUrl = Uri(
      scheme: 'http',
      host: _configAPI.host,
      port: _configAPI.port,
      path: '/user/auth',
    );
    var response = await http.post(
      apiUrl,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(loginViewModel.toJson()),
    );
    _verifyResponse(response);
    Map<String, dynamic> mapResponse = jsonDecode(response.body);
    SharedPreferences preferences = await ConfigAPI.prefs;
    preferences.setString('token', mapResponse['token']);
  }

  void _verifyResponse(http.Response response) {
    if (response.statusCode >= 400) {
      Map<String, dynamic> mapError = jsonDecode(response.body);
      throw Exception(mapError['errors'][0]);
    }
    return;
  }
}

enum TypeUser { CLIENT, ENTERPRISE }
