import 'package:apphotelbooking/views/principal/login/login.dart';
import 'package:apphotelbooking/views/principal/register/register-page.dart';
import 'package:flutter/material.dart';

import '../shared-view-widgets/colors.dart';
import '../shared-view-widgets/widgets-decorated.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reserva Aqui',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: MediaQuery.of(context).size.width * 1.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                        (states) => ColorsView.waterGreen),
                  ),
                  child: WidgetsDecorated.textDecorated(
                      20, 'Entrar', ColorsView.white),
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
                        (states) => ColorsView.waterGreen),
                    side: MaterialStateBorderSide.resolveWith((states) =>
                        const BorderSide(color: ColorsView.waterGreen)),
                    backgroundColor: MaterialStateColor.resolveWith(
                        (states) => ColorsView.white),
                  ),
                  child: WidgetsDecorated.textDecorated(
                      20, 'Cadastre-se', ColorsView.waterGreen),
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
                WidgetsDecorated.textDecorated(
                    20, 'Siga nossas redes sociais', ColorsView.waterGreen),
                WidgetsDecorated.textDecorated(
                    16, '@ReservaAqui', ColorsView.waterGreen),
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
