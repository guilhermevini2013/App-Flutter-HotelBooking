import 'package:flutter/material.dart';

import 'booking-list.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _indexPageSelect = 0;

  static const List<Widget> widgetOptions = <Widget>[
    BookingList(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _indexPageSelect = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indexPageSelect,
        onTap: (value) {
          print(value);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.checklist),
            label: 'Reservas',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.edit), label: 'Editar')
        ],
      ),
      body: widgetOptions[_indexPageSelect],
    );
  }
}
