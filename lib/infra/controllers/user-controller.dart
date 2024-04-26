import 'package:apphotelbooking/infra/api/hotelBooking/userServices.dart';
import 'package:apphotelbooking/model-view/login-vm.dart';

import '../../model-view/register-vm.dart';

class UserController {
  final UserService _userService = UserService();

  Future<void> register(RegisterModelView registerModelView) async {
    await _userService.registerUser(registerModelView);
  }

  Future<void> login(LoginViewModel loginViewModel) async {
    print(loginViewModel.toJson());
    await _userService.loginUser(loginViewModel);
  }
}
