import 'package:flutter/material.dart';

void main() {
  runApp(const HomeView());
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotel Booking',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.transparent),
        useMaterial3: false,
      ),
      home: const HomePresentation(),
    );
  }
}

class HomePresentation extends StatelessWidget {
  const HomePresentation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Container(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 30),
        child: const Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('assets/images/logo.png'),
                  width: 230,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Text(
                    'Começe já',
                    style: TextStyle(
                      fontFamily: 'Principal',
                      fontSize: 25,
                      color: Color(0xFF21347A),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                HomeMenu()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeMenu extends StatefulWidget {
  const HomeMenu({super.key});

  @override
  State<HomeMenu> createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  bool _registerPage = false;

  void _mudarTela(MenuButton typeButton){
    setState(() {
      if(typeButton == MenuButton.REGISTER){
        _registerPage = true;
      }else{
        _registerPage = false;
      }
    });
  }

  Widget _createButton(String text, Color color, MenuButton typeButton) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: const Color(0x0096a9ff),
        shadowColor: color,
        fixedSize: const Size(155, 30),
        shape: LinearBorder.bottom(
          side: const BorderSide(width: 1, color: Color(0xFF21347A)),
        ),
      ),
      onPressed: () {
        _mudarTela(typeButton);
      },
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'Principal',
          fontSize: 17,
          color: Color(0xFF21347A),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _createButton('Entrar', Colors.transparent, MenuButton.JOIN),
            _createButton('Cadastrar', Colors.transparent, MenuButton.REGISTER),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            children: [
              if (!_registerPage) ...{
                const Text(
                  'Bem-vindo',
                  style: TextStyle(
                    fontFamily: 'Principal',
                    fontSize: 30,
                    color: Color(0xFF21347A),
                  ),
                ),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Credenciais',
                    labelStyle: TextStyle(
                      color: Color(0xFF21347A),
                    ),
                    counterText: 'E-mail ou CNPJ',
                    focusedBorder: OutlineInputBorder(
                      // Define a cor da borda quando o TextField está ativado
                      borderSide: BorderSide(
                        color: Color(0xFF21347A),
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                ),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    labelStyle: TextStyle(
                      color: Color(0xFF21347A),
                    ),
                    focusedBorder: OutlineInputBorder(
                      // Define a cor da borda quando o TextField está ativado
                      borderSide: BorderSide(
                        color: Color(0xFF21347A),
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                ),

              } else ...{
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    labelStyle: TextStyle(
                      color: Color(0xFF21347A),
                    ),
                    focusedBorder: OutlineInputBorder(
                      // Define a cor da borda quando o TextField está ativado
                      borderSide: BorderSide(
                        color: Color(0xFF21347A),
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                )
              }
            ],
          ),
        )
      ],
    );
  }
}

enum MenuButton { JOIN, REGISTER }
