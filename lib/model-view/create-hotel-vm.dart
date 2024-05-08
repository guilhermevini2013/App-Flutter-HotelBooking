import 'dart:convert';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class CreateHotelViewModel {
  List<XFile> filesImage = [];
  String nameHotel = '';
  String streetName = '';
  String streetNumber = '';
  String district = '';
  String city = '';
  String sizeType = 'SMALL';
  double lat = 0;
  double log = 0;
  String description ='';
  double price =0;
  String tellPhone = '+00 (00) 0000-00000';
  String getAddress() {
    return '$streetName $city $streetName $district';
  }

  Map<String, dynamic> toJson() {
    List<String> imagesBase64 = [];

    for (XFile file in filesImage) {
      List<int> bytes = File(file.path).readAsBytesSync();
      String base64Image = base64Encode(bytes);
      imagesBase64.add(base64Image);
    }
    return {
      'name': nameHotel,
      'sizeHotel': sizeType,
      "price": price,
      "description": description,
      'address': {
        'street': streetName,
        'streetNumber': streetNumber,
        'city': city,
        'district': district,
        'positionX': lat,
        'positionY': log
      },
      'contact': {
        'numberPhone': tellPhone,
        'email': '123@123'
      },
      'imageBase64': imagesBase64,
    };
  }
}
