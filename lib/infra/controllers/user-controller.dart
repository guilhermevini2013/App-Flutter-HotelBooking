import 'package:apphotelbooking/infra/api/hotelBooking/userServices.dart';

import '../../model-view/register-vm.dart';

class UserController {
  final UserService _userService = UserService();

  Future<void> register(RegisterModelView registerModelView) async {
   await _userService.registerUser(registerModelView);
  }
}
