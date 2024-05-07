
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import '../../../model-view/create-hotel-vm.dart';
import 'config-api.dart';
import 'package:http/http.dart' as http;

class HotelService {
  final ConfigAPI _configAPI = ConfigAPI();

  Future<void> registerUser(CreateHotelViewModel createHotelViewModel) async {
    SharedPreferences sharedPreferences = await ConfigAPI.prefs;
    final Uri apiUrl = Uri(
      scheme: 'http',
      host: _configAPI.host,
      port: _configAPI.port,
      path: '/hotel',
    );
     var response = await http.post(
      apiUrl,
      headers: {
        "Authorization": "Bearer ${sharedPreferences.get('token')}",
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(createHotelViewModel.toJson())
    );
    print(response.statusCode);
  }
}
