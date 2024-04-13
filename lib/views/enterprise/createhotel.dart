import 'package:apphotelbooking/model-view/register-vm.dart';
import 'package:apphotelbooking/views/shared-view-widgets/colors.dart';
import 'package:apphotelbooking/views/shared-view-widgets/widgets-decorated.dart';
import 'package:flutter/material.dart';

class CreateHotel extends StatelessWidget {
  CreateHotel(this._registerMV, {super.key});

  RegisterModelView _registerMV;

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

class CreateHotelPage extends StatefulWidget {
  CreateHotelPage(this._registerMV, {super.key});

  RegisterModelView _registerMV;

  @override
  State<CreateHotelPage> createState() => _CreateHotelPageState();
}

class _CreateHotelPageState extends State<CreateHotelPage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 1.0,
      child: PageView(children: [
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.90,
            child: Column(
              children: [
                WidgetsDecorated.textDecorated(
                    20,
                    'Olá ${widget._registerMV.name} para começar a oferecer reservas registre seu Hotel!',
                    ColorsView.black),
              ],
            ),
          ),
        ),
        Center(
          child: SizedBox(
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
                  onPressed: () => {

                  },
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
                    children: List.generate(9, (index) {
                      return GridTile(
                        child: Container(
                          color: Colors.blueGrey,
                          child: Center(
                            child: Text(
                              'Item $index',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
