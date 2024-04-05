import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: Color(0xFF1C8379),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_sharp,
            size: 30,
          ),
        ),
      ),
      body: const LoginViewComponents(),
    );
  }
}

class LoginViewComponents extends StatelessWidget {
  const LoginViewComponents({super.key});

  Text _textDecorated(double size, String text, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 70),
        child: Center(
          child: Column(
            children: [
              Column(
                children: [
                  Image.asset('assert/images/logoHotel.png',
                      width: MediaQuery.of(context).size.width * 0.35),
                  const SizedBox(
                    height: 10,
                  ),
                  _textDecorated(22, 'Entre agora', const Color(0xFF000000)),
                  _textDecorated(15, 'Tem um quarto esperando por você!',
                      const Color(0xFF000000))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
