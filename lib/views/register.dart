import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

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
      body: const RegisterViewComponents(),
    );
  }
}

class RegisterViewComponents extends StatelessWidget {
  const RegisterViewComponents({super.key});

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
          padding: const EdgeInsetsDirectional.only(top: 20),
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.70,
              child: Column(
                children: [
                  _textDecorated(22, 'Crie sua conta e começe a reservar!',
                      const Color(0xFF000000)),
                  const SizedBox(
                    height: 10,
                  ),
                  _textDecorated(
                      17, 'Escolha o tipo de conta', const Color(0xFF000000)),
                  const CheckBoxRegister()
                ],
              ),
            ),
          )),
    );
  }
}

class CheckBoxRegister extends StatefulWidget {
  const CheckBoxRegister({super.key});

  @override
  State<CheckBoxRegister> createState() => _CheckBoxRegisterState();
}

class _CheckBoxRegisterState extends State<CheckBoxRegister> {
  bool _checkBoxClient = true;
  bool _checkBoxEnterprise = false;

  Text _textDecorated(double size, String text, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
      ),
    );
  }

  void _alterCheckBoxClient(bool? value) {
    setState(() {
      _checkBoxClient = value!;
      _checkBoxEnterprise = !value!;
    });
  }

  void _alterCheckBoxEnterprise(bool? value) {
    setState(() {
      _checkBoxEnterprise = value!;
      _checkBoxClient = !value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          child: Row(
            children: [
              _textDecorated(15, 'Cliente', const Color(0xFF000000)),
              Checkbox(
                value: _checkBoxClient,
                onChanged: (value) {
                  _alterCheckBoxClient(value);
                },
              ),
            ],
          ),
        ),
        SizedBox(
          child: Row(
            children: [
              _textDecorated(15, 'Empresa', const Color(0xFF000000)),
              Checkbox(
                value: _checkBoxEnterprise,
                onChanged: (value) {
                  _alterCheckBoxEnterprise(value);
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
