import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../model-view/create-hotel-vm.dart';
import '../shared-view-widgets/colors.dart';
import '../shared-view-widgets/widgets-decorated.dart';

class PageCreateHotelImage extends StatefulWidget {
   const PageCreateHotelImage(this._createHotelViewModel,{super.key});
  final CreateHotelViewModel _createHotelViewModel;

  @override
  State<PageCreateHotelImage> createState() => _PageCreateHotelImageState(_createHotelViewModel);
}

class _PageCreateHotelImageState extends State<PageCreateHotelImage> {
  _PageCreateHotelImageState(this._createHotelViewModel);
  final CreateHotelViewModel _createHotelViewModel;

  Future<void> _openGallery(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickMultiImage();

    if (pickedFile != null && _createHotelViewModel.filesImage.length < 9) {
      pickedFile.forEach((element) {
        _createHotelViewModel.filesImage.add(element);
      });
      setState(() {});
    } else if(pickedFile != null){
      Flushbar(
        icon: const Icon(
          Icons.report_gmailerrorred,
          color: ColorsView.white,
        ),
        backgroundColor: ColorsView.redWarn,
        message: 'Maximo 9 fotos.',
        duration: const Duration(seconds: 2),
      ).show(context);
    }

  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.90,
      child: Column(
        children: [
          WidgetsDecorated.textDecorated(
              20,
              'Selecione as imagens para o perfil do seu hotel.',
              ColorsView.black),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () => {_openGallery(context)},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.photo_library,
                  size: 25,
                ),
                const SizedBox(
                  width: 10,
                ),
                WidgetsDecorated.textDecorated(
                    17, 'Adicionar foto', ColorsView.white),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 0.75,
              children:
              _createHotelViewModel.filesImage.map((XFile imageFile) {
                return Card(
                  child: Image.file(
                    File(imageFile.path),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
