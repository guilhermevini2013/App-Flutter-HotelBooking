import 'dart:async';

import 'package:apphotelbooking/model-view/login-vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../shared-view-widgets/colors.dart';
import '../../shared-view-widgets/widgets-decorated.dart';

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
      body: LoginViewComponents(),
    );
  }
}

class LoginViewComponents extends StatelessWidget {
  LoginViewComponents({super.key});

  var loginVM = LoginViewModel();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 1.0,
      height: MediaQuery.of(context).size.height * 0.7,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assert/images/logoHotel.png',
                  width: MediaQuery.of(context).size.width * 0.35),
              const SizedBox(
                height: 10,
              ),
              WidgetsDecorated.textDecorated(
                  22, 'Entre agora', const Color(0xFF000000)),
              const TextCarousel(),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: _formKey,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.80,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Campo obrigatorio';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          loginVM.credential = value;
                        },
                        style: const TextStyle(
                          fontFamily: 'principal',
                          fontSize: 17,
                        ),
                        decoration: const InputDecoration(
                            labelText: 'Credenciais',
                            helperText: 'E-mail ou CNPJ'),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Campo obrigatorio';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          loginVM.password = value;
                        },
                        obscureText: true,
                        style: const TextStyle(
                          fontFamily: 'principal',
                          fontSize: 17,
                        ),
                        decoration: const InputDecoration(
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
                                (states) => ColorsView.waterGreen),
                            side: MaterialStateBorderSide.resolveWith((states) =>
                                const BorderSide(color: ColorsView.waterGreen)),
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) => ColorsView.white),
                          ),
                          child: WidgetsDecorated.textDecorated(
                              20, 'Entrar', ColorsView.waterGreen),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {}
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
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

  int _currentIndex = 0;
  final List<String> _phrases = [
    'Tem um quarto esperando por você!',
    'Segurança e conforto para você!',
    'Busque o melhor hotel e reserve aqui!'
  ];

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
                color: ColorsView.black,
              ),
            ),
          );
        },
      ),
    );
  }
}
