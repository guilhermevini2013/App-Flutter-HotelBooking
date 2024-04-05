import 'dart:async';

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
        foregroundColor: const Color(0xFF000000),
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
                  const TextCarousel(),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.80,
                    child: Column(
                      children: [
                        const TextField(
                          style: TextStyle(
                            fontFamily: 'principal',
                            fontSize: 17,
                          ),
                          decoration: InputDecoration(
                              labelText: 'Credenciais',
                              helperText: 'E-mail ou CNPJ'),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const TextField(
                          obscureText: true,
                          style: TextStyle(
                            fontFamily: 'principal',
                            fontSize: 17,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Senha',
                          ),
                        ),
                        const SizedBox(
                          height: 45,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.65,
                          height: 45,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shadowColor: MaterialStateColor.resolveWith(
                                  (states) => const Color(0xFF1C8379)),
                              side: MaterialStateBorderSide.resolveWith(
                                  (states) => const BorderSide(
                                      color: Color(0xFF1C8379))),
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.white),
                            ),
                            child: _textDecorated(
                                20, 'Entrar', const Color(0xFF1C8379)),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextCarousel extends StatefulWidget {
  const TextCarousel({super.key});

  @override
  State<TextCarousel> createState() => _TextCarouselState();
}

class _TextCarouselState extends State<TextCarousel> {
  final PageController _pageController = PageController();
  final List<String> _phrases = [
    'Tem um quarto esperando por você!',
    'Segurança e conforto para você!',
    'Busque o melhor hotel e reserve aqui!'
  ];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _phrases.length;
        _pageController.animateToPage(
          _currentIndex,
          duration: const Duration(milliseconds: 1000),
          curve: Curves.fastOutSlowIn,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: PageView.builder(
        onPageChanged: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        controller: _pageController,
        itemCount: _phrases.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: Text(
              _phrases[index],
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
          );
        },
      ),
    );
  }
}
