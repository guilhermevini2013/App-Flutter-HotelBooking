import 'package:apphotelbooking/model-view/create-hotel-vm.dart';
import 'package:flutter/cupertino.dart';

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
      _PageCreateHotelInformationState();
}

class _PageCreateHotelInformationState
    extends State<PageCreateHotelInformation> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.90,
      child: Column(
        children: [
          WidgetsDecorated.textDecorated(
              20,
              'Olá ${widget._registerMV.name} para começar a oferecer reservas registre seu Hotel!',
              ColorsView.black),
        ],
      ),
    );
  }
}
