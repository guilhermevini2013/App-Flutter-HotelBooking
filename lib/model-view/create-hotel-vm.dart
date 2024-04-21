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

  String getAddress() {
    return '$streetName $city $streetName $district';
  }
}
