import 'package:apphotelbooking/model-view/register-vm.dart';
import 'package:apphotelbooking/views/enterprise/create/page-create-hotel-image.dart';
import 'package:apphotelbooking/views/enterprise/create/page-create-hotel-information.dart';
import 'package:flutter/material.dart';

import '../../../model-view/create-hotel-vm.dart';

class CreateHotel extends StatelessWidget {
  const CreateHotel(this._registerMV, {super.key});

  final RegisterModelView _registerMV;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: const Color(0xFF000000),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_sharp,
            size: 30,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: CreateHotelPage(_registerMV),
      ),
    );
  }
}

class CreateHotelPage extends StatelessWidget {
  CreateHotelPage(this._registerMV, {super.key});

  final RegisterModelView _registerMV;
  final CreateHotelViewModel _createHotelViewModel = CreateHotelViewModel();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 1.0,
      child: PageView(children: [
        Center(
          child: PageCreateHotelInformation(_registerMV, _createHotelViewModel,_formKey),
        ),
        Center(
          child: PageCreateHotelImage(_createHotelViewModel),
        ),
      ]),
    );
  }
}
