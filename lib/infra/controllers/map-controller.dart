import 'dart:ffi';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import '../../model-view/create-hotel-vm.dart';
import '../../views/enterprise/create/card-check-map.dart';
import '../../views/shared-view-widgets/colors.dart';
import '../api/googleMaps/mapsService.dart';

class MapController {
  final MapsServices _services = MapsServices();

  Future<Void?> getCoordinate(CreateHotelViewModel createHotelVM, BuildContext context) async {
    _services
        .getCoordinate(createHotelVM)
        .then((value) => {
              showDialog(
                context: context,
                builder: (context) {
                  return CardCheckMap(createHotelVM);
                },
              )
            })
        .onError((error, stackTrace) => {
              Flushbar(
                message: error.toString().split(':')[1],
                duration: const Duration(seconds: 3),
                backgroundColor: ColorsView.redWarn,
                icon: const Icon(
                  Icons.warning_amber,
                  color: Colors.white,
                ), // Define por quanto tempo o Flushbar será exibido
              ).show(context)
            });
  }
}
