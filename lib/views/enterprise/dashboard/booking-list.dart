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
            color: Colors.amberAccent,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    width: 20,
                    height: 20,
                    child: Text('dadawd'),
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
