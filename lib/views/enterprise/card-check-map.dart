import 'package:apphotelbooking/model-view/create-hotel-vm.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../infra/api/googleMaps/mapsService.dart';
import '../shared-view-widgets/colors.dart';
import '../shared-view-widgets/widgets-decorated.dart';

class CardCheckMap extends StatefulWidget {
  CardCheckMap(this._createHotelViewModel, {super.key});

  CreateHotelViewModel _createHotelViewModel;

  @override
  State<CardCheckMap> createState() => _CardCheckMapState();
}

class _CardCheckMapState extends State<CardCheckMap> {
  late GoogleMapController _mapController;

  late double _latitude;

  late double _longitude;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _latitude = widget._createHotelViewModel.lat;
    _longitude = widget._createHotelViewModel.log;
  }

  void _onMapCreate(GoogleMapController mapController) {
    _mapController = mapController;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      insetAnimationDuration: const Duration(seconds: 2),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.45,
        width: MediaQuery.of(context).size.width * 1,
        color: const Color(0xFFFAFAFA),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.33,
              width: MediaQuery.of(context).size.width * 1,
              child: GoogleMap(
                onMapCreated: _onMapCreate,
                initialCameraPosition: CameraPosition(
                  target: LatLng(_latitude, _longitude),
                  zoom: 13.9,
                ),
                markers: {
                  Marker(
                    markerId: const MarkerId("unique"),
                    icon: BitmapDescriptor.defaultMarker,
                    position: LatLng(_latitude, _longitude),
                    infoWindow: const InfoWindow(title: "Seu Hotel"),
                  ),
                },
              ),
            ),
            WidgetsDecorated.textDecorated(
                20, 'Confirme o endereço', ColorsView.black),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: ElevatedButton(
                style: ButtonStyle(
                  shadowColor: MaterialStateColor.resolveWith(
                      (states) => ColorsView.waterGreen),
                  side: MaterialStateBorderSide.resolveWith((states) =>
                      const BorderSide(color: ColorsView.waterGreen)),
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => ColorsView.white),
                ),
                onPressed: () {

                },
                child: const Icon(
                  Icons.done,
                  color: ColorsView.waterGreen,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
