import 'dart:convert';
import 'dart:ffi';

import '../../../model-view/create-hotel-vm.dart';
import 'package:http/http.dart' as http;

class MapsServices {
  final String _apiKey = 'IzaSyBnSHQstZM4rxzCFqI6CJ1NevzGCutNvY';
  final String _geocode = 'maps.googleapis.com';

  Future<Void?> getCoordinate(CreateHotelViewModel createHotelVM) async {
    final Uri apiUrl = Uri(
        scheme: 'https',
        host: _geocode,
        path: '/maps/api/geocode/json',
        queryParameters: {
          "key": _apiKey,
          "address": createHotelVM.getAddress()
        });
    var response = await http.get(
      apiUrl,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    Map<String, dynamic> mapResult = jsonDecode(response.body);
    if (mapResult["status"] == "ZERO_RESULTS") {
      throw Exception("Endereço incorreto");
    }
    createHotelVM.lat = mapResult["results"][0]["geometry"]["location"]["lat"];
    createHotelVM.log = mapResult["results"][0]["geometry"]["location"]["lng"];
  }
}
