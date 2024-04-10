import 'package:another_flushbar/flushbar.dart';
import 'package:apphotelbooking/model-view/register-vm.dart';
import 'package:apphotelbooking/views/principal/register/register-client-widget.dart';
import 'package:apphotelbooking/views/principal/register/register-enterprise-widget.dart';
import 'package:flutter/material.dart';
import 'package:masked_text/masked_text.dart';

import '../../shared-view-widgets/colors.dart';
import '../../shared-view-widgets/widgets-decorated.dart';

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
                      ColorsView.black),
                  const SizedBox(
                    height: 10,
                  ),
                  _textDecorated(
                      17, 'Escolha o tipo de conta', ColorsView.black),
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
  final RegisterModelView _registerVM = RegisterModelView();

  void _alterCheckBoxClient(bool? value) {
    setState(() {
      _registerVM.checkBoxClient = value!;
      _registerVM.checkBoxEnterprise = !value!;
    });
  }

  void _alterCheckBoxEnterprise(bool? value) {
    setState(() {
      _registerVM.checkBoxEnterprise = value!;
      _registerVM.checkBoxClient = !value!;
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
                  WidgetsDecorated.textDecorated(
                      15, 'Cliente', ColorsView.black),
                  Checkbox(
                    value: _registerVM.checkBoxClient,
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
                  WidgetsDecorated.textDecorated(
                      15, 'Empresa', ColorsView.black),
                  Checkbox(
                    value: _registerVM.checkBoxEnterprise,
                    onChanged: (value) {
                      _alterCheckBoxEnterprise(value);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
        WidgetsDecorated.textDecorated(
            17, 'Preencha as informações', ColorsView.black),
        if (_registerVM.checkBoxClient) ...{
          ClientRegisterComponents(_registerVM)!
        } else ...{
          EnterpriseRegisterComponents(_registerVM)!
        }
      ],
    );
  }
}
