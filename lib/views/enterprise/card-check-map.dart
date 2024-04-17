import 'package:flutter/material.dart';

import '../shared-view-widgets/colors.dart';
import '../shared-view-widgets/widgets-decorated.dart';

class CardCheckMap extends StatelessWidget {
  const CardCheckMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      insetAnimationDuration: const Duration(seconds: 2),
      child: Container(
        color: const Color(0xFFFAFAFA),
        child: Column(
          children: [
            //MAPS-----------------------------------------
            WidgetsDecorated.textDecorated(
                17, 'Confirme o endereço', ColorsView.black),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
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
                    Icons.edit,
                    color: ColorsView.waterGreen,
                  ),
                ),
                ElevatedButton(
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
              ],
            )
          ],
        ),
      ),
    );
  }
}
