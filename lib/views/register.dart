import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:masked_text/masked_text.dart';

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
              width: MediaQuery.of(context).size.width * 0.75,
              child: Column(
                children: [
                  _textDecorated(22, 'Crie sua conta e começe a reservar!',
                      const Color(0xFF000000)),
                  const SizedBox(
                    height: 10,
                  ),
                  _textDecorated(
                      17, 'Escolha o tipo de conta', const Color(0xFF000000)),
                  const RegisterComponents()
                ],
              ),
            ),
          )),
    );
  }
}

class RegisterComponents extends StatefulWidget {
  const RegisterComponents({super.key});

  @override
  State<RegisterComponents> createState() => _RegisterComponentsState();
}

class _RegisterComponentsState extends State<RegisterComponents> {
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
    return Column(
      children: [
        Row(
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
        ),
        _textDecorated(17, 'Preencha as informações', const Color(0xFF000000)),
        if (_checkBoxClient) ...{
          const _ClientRegisterComponents()
        } else ...{
          const _EnterpriseRegisterComponents()
        }
      ],
    );
  }
}

class _ClientRegisterComponents extends StatelessWidget {
  const _ClientRegisterComponents({super.key});

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
    return Column(
      children: [
        const TextField(
          style: TextStyle(
            fontFamily: 'principal',
            fontSize: 17,
          ),
          decoration: InputDecoration(
            labelText: 'Nome',
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const TextField(
          style: TextStyle(
            fontFamily: 'principal',
            fontSize: 17,
          ),
          decoration: InputDecoration(
            labelText: 'E-mail',
          ),
        ),
        const SizedBox(
          height: 10,
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
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.35,
              child: MaskedTextField(
                mask: "###.###.###-##",
                maxLength: 14,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  fontFamily: 'principal',
                  fontSize: 17,
                ),
                decoration: const InputDecoration(
                  labelText: 'CPF',
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.35,
              child: MaskedTextField(
                mask: "##/##/####",
                maxLength: 10,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  fontFamily: 'principal',
                  fontSize: 17,
                ),
                decoration: const InputDecoration(
                  labelText: 'Nascimento',
                ),
              ),
            ),
          ],
        ),
        MaskedTextField(
          mask: "+## (##) ####-#####",
          maxLength: 19,
          keyboardType: TextInputType.number,
          style: const TextStyle(
            fontFamily: 'principal',
            fontSize: 17,
          ),
          decoration: const InputDecoration(
            labelText: 'Telefone',
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.65,
          height: 45,
          child: ElevatedButton(
            style: ButtonStyle(
              shadowColor: MaterialStateColor.resolveWith(
                  (states) => const Color(0xFF1C8379)),
              side: MaterialStateBorderSide.resolveWith(
                  (states) => const BorderSide(color: Color(0xFF1C8379))),
              backgroundColor:
                  MaterialStateColor.resolveWith((states) => Colors.white),
            ),
            child: _textDecorated(20, 'Cadastrar', const Color(0xFF1C8379)),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}

class _EnterpriseRegisterComponents extends StatelessWidget {
  const _EnterpriseRegisterComponents({super.key});

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
    return Column(
      children: [
        const TextField(
          style: TextStyle(
            fontFamily: 'principal',
            fontSize: 17,
          ),
          decoration: InputDecoration(
            labelText: 'Nome da empresa',
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const TextField(
          style: TextStyle(
            fontFamily: 'principal',
            fontSize: 17,
          ),
          decoration: InputDecoration(
            labelText: 'E-mail',
          ),
        ),
        const SizedBox(
          height: 10,
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
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              child: MaskedTextField(
                mask: "##.###.###/####-##",
                maxLength: 18,
                keyboardType: TextInputType.number,
                style: const TextStyle(
                  fontFamily: 'principal',
                  fontSize: 17,
                ),
                decoration: const InputDecoration(
                  labelText: 'CNPJ',
                ),
              ),
            ),
          ],
        ),
        MaskedTextField(
          mask: "+## (##) ####-#####",
          maxLength: 19,
          keyboardType: TextInputType.number,
          style: const TextStyle(
            fontFamily: 'principal',
            fontSize: 17,
          ),
          decoration: const InputDecoration(
            labelText: 'Telefone',
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.65,
          height: 45,
          child: ElevatedButton(
            style: ButtonStyle(
              shadowColor: MaterialStateColor.resolveWith(
                  (states) => const Color(0xFF1C8379)),
              side: MaterialStateBorderSide.resolveWith(
                  (states) => const BorderSide(color: Color(0xFF1C8379))),
              backgroundColor:
                  MaterialStateColor.resolveWith((states) => Colors.white),
            ),
            child: _textDecorated(20, 'Cadastrar', const Color(0xFF1C8379)),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
