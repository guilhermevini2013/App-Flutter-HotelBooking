import 'package:apphotelbooking/infra/api/hotelBooking/hotelService.dart';
import 'package:apphotelbooking/model-view/create-hotel-vm.dart';

class HotelController{
  final HotelService _hotelService = HotelService();

  Future<void> createHotel(CreateHotelViewModel createHotelViewModel) async{
    _hotelService.registerUser(createHotelViewModel);
  }
}