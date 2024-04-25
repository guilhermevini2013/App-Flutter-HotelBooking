import '../infra/api/hotelBooking/userServices.dart';

class RegisterModelView{
  String name = '';
  String credential = '';
  String email = '';
  String password = '';
  String dateOfBirth ='';
  String cpf ='';
  String numberPhone ='';
  TypeUser typeUser = TypeUser.ENTERPRISE;
  bool checkBoxClient = true;
  bool checkBoxEnterprise = false;
  bool isSend = false;

  Map<String, dynamic> toJson() {
    switch (typeUser) {
      case TypeUser.CLIENT:
        return _toJsonClient();
      case TypeUser.ENTERPRISE:
        return _toJsonEnterprise();
    }
  }

  Map<String, dynamic> _toJsonClient() {
    if(dateOfBirth!.isEmpty){
      throw Exception('Data de nascimento incorreta');
    }
    var dateSplit = dateOfBirth!.split('/');
    return {
      'name': name,
      'email': email,
      'password': password,
      'identity': cpf,
      'numberPhone': numberPhone,
      'typeUser': typeUser.name,
      'dateOfBirth': '${dateSplit[2]}-${dateSplit[1]}-${dateSplit[0]}'
    };
  }

  Map<String, dynamic> _toJsonEnterprise() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'identity': cpf,
      'numberPhone': numberPhone,
      'typeUser': typeUser.name,
    };
  }
}