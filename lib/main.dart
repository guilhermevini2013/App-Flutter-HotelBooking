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
        fontFamily: 'Principal',
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
        padding: const EdgeInsets.fromLTRB(10, 70, 10, 30),
        child: const SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
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
  bool _typeRegisterClient = true;
  bool _typeRegisterEnterprise = false;
  final List<String> _options = ['MASCULINO', 'FEMININO'];
  late String? _optionGender = _options[0];

  void _alterView(MenuButton typeButton) {
    setState(() {
      if (typeButton == MenuButton.REGISTER) {
        _registerPage = true;
      } else {
        _registerPage = false;
      }
    });
  }

  void _getRegisterView(TypeRegister type) {
    setState(() {
      if (type == TypeRegister.CLIENT) {
        _typeRegisterClient = true;
        _typeRegisterEnterprise = false;
      } else {
        _typeRegisterClient = false;
        _typeRegisterEnterprise = true;
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
        _alterView(typeButton);
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
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            children: [
              if (!_registerPage) ...{
                const Text(
                  'Bem-vindo',
                  style: TextStyle(
                    fontSize: 25,
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
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF4A3DFA),
                      textStyle: const TextStyle(fontSize: 20),
                      fixedSize: Size(270, 30)),
                  child: Text('Entrar'),
                  onPressed: () {},
                )
              } else ...{
                const Text(
                  'Cadastra-se',
                  style: TextStyle(
                    fontFamily: 'Principal',
                    fontSize: 25,
                    color: Color(0xFF21347A),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      child: Row(
                        children: [
                          const Text('Cliente'),
                          Checkbox(
                            activeColor: Color(0xFF4A3DFA),
                            value: _typeRegisterClient,
                            onChanged: (value) {
                              _getRegisterView(TypeRegister.CLIENT);
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Row(
                        children: [
                          const Text('Empresa'),
                          Checkbox(
                            activeColor: Color(0xFF4A3DFA),
                            value: _typeRegisterEnterprise,
                            onChanged: (value) {
                              _getRegisterView(TypeRegister.ENTERPRISE);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                if (_typeRegisterClient) ...{
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Nome',
                      labelStyle: TextStyle(
                        color: Color(0xFF21347A),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF21347A),
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 160,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'CPF',
                            labelStyle: TextStyle(
                              color: Color(0xFF21347A),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF21347A),
                                style: BorderStyle.solid,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                          width: 160,
                          child: DropdownButton<String>(
                            value: _optionGender,
                            onChanged: (String? newValue) {
                              setState(() {
                                _optionGender = newValue;
                              });
                            },
                            items: _options
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        color: Color(0xFF21347A),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF21347A),
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Telefone',
                      labelStyle: TextStyle(
                        color: Color(0xFF21347A),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF21347A),
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Data de nascimento',
                      labelStyle: TextStyle(
                        color: Color(0xFF21347A),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF21347A),
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                   SizedBox(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF4A3DFA),
                          textStyle: const TextStyle(fontSize: 20),
                          fixedSize: Size(270, 30)),
                      child: Text('Cadastrar'),
                      onPressed: () {},
                    )
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                }else...{

                }
              }
            ],
          ),
        )
      ],
    );
  }
}

enum TypeRegister { CLIENT, ENTERPRISE }

enum MenuButton { JOIN, REGISTER }
