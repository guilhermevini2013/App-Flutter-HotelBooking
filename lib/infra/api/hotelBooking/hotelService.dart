import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http_parser/http_parser.dart';

import '../../../model-view/create-hotel-vm.dart';
import 'config-api.dart';

class HotelService {
  final String _host = '192.168.31.106';
  final int _port = 8080;

  Future<void> registerUser(CreateHotelViewModel createHotelViewModel) async {
    final Uri apiUrl = Uri(
      scheme: 'http',
      host: _host,
      port: _port,
      path: '/hotel',
    );
    SharedPreferences sharedPreferences = await ConfigAPI.prefs;
    var request = http.MultipartRequest('POST', apiUrl);
    request.headers['Authorization'] = 'Bearer ${sharedPreferences.getString('token')}';
    // Convertendo o objeto createHotelViewModel para JSON e adicionando como parte do formulário
    request.fields['hotelCreate'] = jsonEncode(createHotelViewModel.toJson());
    // Adicionando as imagens como arquivos multipart ao formulário
    for (var image in createHotelViewModel.filesImage!) {
      var stream = http.ByteStream(image.openRead());
      var length = await image.length();
      var multipartFile = http.MultipartFile(
        'images',
        stream,
        length,
        contentType: MediaType('image', 'jpeg'), // Altere conforme o tipo de imagem
      );
      request.files.add(multipartFile);
    }
    request.headers['Content-Type'] = 'multipart/form-data';
    print(request.headers);
    // Enviando a requisição
    var response = await request.send();
    print(response.headers);

    // Verificando se a resposta foi bem-sucedida (status code 2xx)
    if (response.statusCode >= 200 && response.statusCode < 300) {
      print('Solicitação enviada com sucesso.');
    } else {
      print('Erro ao enviar solicitação. Código de status: ${response.statusCode}');
    }
  }

}
