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
  String tellPhone = '+00 (00) 0000-00000';
  String getAddress() {
    return '$streetName $city $streetName $district';
  }

  Map<String,dynamic> toJson(){
    return {
      'name':nameHotel,
      'sizeHotel':sizeType,
      'address': {
        'street': streetName,
        'streetNumber': streetNumber,
        'city': city,
        'district':district,
        'positionX':lat,
        'positionY':log
      },
      'contact':{
        'numberPhone': tellPhone,
        'email':'123@123'
      }
    };
  }
}
