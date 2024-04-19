import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../shared-view-widgets/colors.dart';
import '../shared-view-widgets/widgets-decorated.dart';

class CardCheckMap extends StatelessWidget {
  CardCheckMap({super.key});

  late GoogleMapController _mapController;

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
                initialCameraPosition: const CameraPosition(
                  target: LatLng(-23.5557714, -46.63955571),
                  zoom: 13.9,
                ),
                markers: {
                  const Marker(
                    markerId: MarkerId("unique"),
                    icon: BitmapDescriptor.defaultMarker,
                    position: LatLng(-23.5557714, -46.63955571),
                    infoWindow: InfoWindow(
                      title: "Seu Hotel"
                    ),
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
                onPressed: () {},
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
