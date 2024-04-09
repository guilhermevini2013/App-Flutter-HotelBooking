import 'package:apphotelbooking/views/principal/login.dart';
import 'package:apphotelbooking/views/principal/register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1C8379)),
        useMaterial3: false,
        fontFamily: 'principal',
      ),
      home: const PrincipalView(),
    );
  }
}

class PrincipalView extends StatelessWidget {
  const PrincipalView({super.key});

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
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                height: 45,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => const Color(0xFF1C8379)),
                  ),
                  child: _textDecorated(20, 'Entrar', Colors.white),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginView()));
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.65,
                height: 45,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shadowColor: MaterialStateColor.resolveWith(
                        (states) => const Color(0xFF1C8379)),
                    side: MaterialStateBorderSide.resolveWith(
                        (states) => const BorderSide(color: Color(0xFF1C8379))),
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => Colors.white),
                  ),
                  child: _textDecorated(
                      20, 'Cadastre-se', const Color(0xFF1C8379)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterView(),
                        ));
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Column(
              children: [
                _textDecorated(
                    20, 'Siga nossas redes sociais', const Color(0xFF1C8379)),
                _textDecorated(16, '@ReservaAqui', const Color(0xFF1C8379)),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 26,
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
