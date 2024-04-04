import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const String _principalFont = 'principal';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: const LoginView(),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  Text _textDecorated(double size, String text, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: _principalFont,
        fontSize: size,
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SizedBox(
        width: MediaQuery.of(context).size.width * 1.0,
        child: Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                'assert/images/logoHotel.png',
                width: MediaQuery.of(context).size.width * 0.35,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.center,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.65,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Color(0xFF1C8379)),
                  ),
                  child: _textDecorated(17, 'Entrar', Colors.white),
                  onPressed: () {},
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              alignment: Alignment.center,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.65,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shadowColor: MaterialStateColor.resolveWith(
                        (states) => Color(0xFF1C8379)),
                    side: MaterialStateBorderSide.resolveWith(
                        (states) => BorderSide(color: Color(0xFF1C8379))),
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.white),
                  ),
                  child: _textDecorated(17, 'Cadastrar', Color(0xFF1C8379)),
                  onPressed: () {},
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Column(
              children: [
                _textDecorated(
                    20, 'Siga nossas redes sociais', Color(0xFF1C8379)),
                _textDecorated(15, '@ReservaAqui', Color(0xFF1C8379)),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 25,
                  width: 120,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset('assert/images/logoinstagram.png'),
                      Image.asset('assert/images/logoZap.png'),
                      Image.asset('assert/images/logoLink.png'),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
