import 'dart:async';

import 'package:apphotelbooking/model-view/create-hotel-vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:masked_text/masked_text.dart';

import '../../model-view/register-vm.dart';
import '../shared-view-widgets/colors.dart';
import '../shared-view-widgets/widgets-decorated.dart';

class PageCreateHotelInformation extends StatefulWidget {
  const PageCreateHotelInformation(this._registerMV, this._createHotelViewModel,
      {super.key});

  final CreateHotelViewModel _createHotelViewModel;
  final RegisterModelView _registerMV;

  @override
  State<PageCreateHotelInformation> createState() =>
      _PageCreateHotelInformationState(_createHotelViewModel);
}

class _PageCreateHotelInformationState
    extends State<PageCreateHotelInformation> {
  _PageCreateHotelInformationState(this._createHotelViewModel);

  final CreateHotelViewModel _createHotelViewModel;
  final _formKey = GlobalKey<FormState>();
  bool _next = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 1,
      child: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WidgetsDecorated.textDecorated(
                    20,
                    'Olá ${widget._registerMV.name} para começar a oferecer reservas, registre seu Hotel!',
                    ColorsView.black),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Campo obrigatorio';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _createHotelViewModel.nameHotel = value;
                  },
                  style: const TextStyle(
                    fontFamily: 'principal',
                    fontSize: 17,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Nome do hotel',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                WidgetsDecorated.textDecorated(
                    16, 'Selecione o porte do hotel', ColorsView.black),
                DropdownButton<String>(
                  isExpanded: true,
                  value: _createHotelViewModel.sizeType,
                  items: const [
                    DropdownMenuItem(
                      value: 'LARGE',
                      child: Text('Grande'),
                    ),
                    DropdownMenuItem(
                      value: 'MEDIUM',
                      child: Text('Medio'),
                    ),
                    DropdownMenuItem(
                      value: 'SMALL',
                      child: Text('Pequeno'),
                    ),
                  ],
                  onChanged: (value) {
                    _createHotelViewModel.sizeType = value!;
                    setState(() {});
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Campo obrigatorio';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _createHotelViewModel.streetName = value;
                  },
                  style: const TextStyle(
                    fontFamily: 'principal',
                    fontSize: 17,
                  ),
                  decoration: const InputDecoration(
                      labelText: 'Rua', counterText: 'ex: Rua jose bonifacio'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.36,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Campo obrigatorio';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          _createHotelViewModel.streetNumber = value as int;
                        },
                        maxLength: 7,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                          fontFamily: 'principal',
                          fontSize: 17,
                        ),
                        decoration: const InputDecoration(
                          labelText: 'Numero da rua',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.38,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Campo obrigatorio';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          _createHotelViewModel.district = value;
                        },
                        maxLength: 20,
                        style: const TextStyle(
                          fontFamily: 'principal',
                          fontSize: 17,
                        ),
                        decoration: const InputDecoration(
                          labelText: 'Bairro',
                        ),
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Campo obrigatorio';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _createHotelViewModel.city = value;
                  },
                  style: const TextStyle(
                    fontFamily: 'principal',
                    fontSize: 17,
                  ),
                  decoration: const InputDecoration(
                      labelText: 'Cidade', counterText: 'ex: Campinas'),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WidgetsDecorated.textDecorated(
                        20, 'Arraste para o lado', ColorsView.waterGreen),
                    const Icon(
                      size: 35,
                      Icons.swipe_left,
                      color: ColorsView.waterGreen,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
