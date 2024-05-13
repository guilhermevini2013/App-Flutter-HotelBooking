import 'package:apphotelbooking/views/shared-view-widgets/colors.dart';
import 'package:apphotelbooking/views/shared-view-widgets/widgets-decorated.dart';
import 'package:flutter/material.dart';

class BookingList extends StatefulWidget {
  const BookingList({super.key});

  @override
  State<BookingList> createState() => _BookingListState();
}

class _BookingListState extends State<BookingList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: ColorsView.waterGreen,
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 0.12,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WidgetsDecorated.textDecorated(
                  25, 'Reservas pendentes', Colors.white)
            ],
          ),
        ),
        Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width * 1,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: 50,
                    margin: const EdgeInsets.only(bottom: 20),
                    color: Colors.black12,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            WidgetsDecorated.textDecorated(
                                17, 'totalPerson', Colors.black),
                            WidgetsDecorated.textDecorated(
                                17, 'initialDate', Colors.black),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            WidgetsDecorated.textDecorated(
                                17, 'price', Colors.black),
                            WidgetsDecorated.textDecorated(
                                17, 'finalDate', Colors.black),
                          ],
                        ),
                        ElevatedButton(
                            onPressed: () {}, child: const Text("Aceitar"))
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
