import 'package:apphotelbooking/infra/api/hotelBooking/userServices.dart';

class LoginViewModel {
  late String credential = '';
  late String password = '';
  late TypeUser typeUser = TypeUser.ENTERPRISE;

  LoginViewModel(this.credential, this.password, this.typeUser);

  Map<String, dynamic> toJson() {
    return {
      'credential': credential,
      'password': password,
      'typeUser': typeUser.name
    };
  }
}
