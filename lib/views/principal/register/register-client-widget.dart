import 'package:another_flushbar/flushbar.dart';
import 'package:apphotelbooking/infra/api/hotelBooking/userServices.dart';
import 'package:apphotelbooking/infra/controllers/user-controller.dart';
import 'package:flutter/material.dart';
import 'package:masked_text/masked_text.dart';

import '../../../model-view/register-vm.dart';
import '../../shared-view-widgets/colors.dart';
import '../../shared-view-widgets/widgets-decorated.dart';

class ClientRegisterComponents extends StatefulWidget {
  ClientRegisterComponents(this.registerVM, {super.key});

  RegisterModelView registerVM;

  @override
  State<ClientRegisterComponents> createState() =>
      _ClientRegisterComponentsState(registerVM);
}

class _ClientRegisterComponentsState extends State<ClientRegisterComponents> {
  _ClientRegisterComponentsState(this.registerVM);

  RegisterModelView registerVM;
  final _formKey = GlobalKey<FormState>();
  UserController _userController = UserController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
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
              registerVM.name = value;
            },
            style: const TextStyle(
              fontFamily: 'principal',
              fontSize: 17,
            ),
            decoration: const InputDecoration(
              labelText: 'Nome',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Campo obrigatorio';
              }
              return null;
            },
            onChanged: (value) {
              registerVM.email = value;
            },
            style: const TextStyle(
              fontFamily: 'principal',
              fontSize: 17,
            ),
            decoration: const InputDecoration(
              labelText: 'E-mail',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Campo obrigatorio';
              }
              return null;
            },
            onChanged: (value) {
              registerVM.password = value;
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
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.37,
                child: MaskedTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Campo obrigatorio';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    registerVM.cpf = value;
                  },
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
                width: MediaQuery.of(context).size.width * 0.33,
                child: MaskedTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Campo obrigatorio';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    registerVM.dateOfBirth = value;
                  },
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
            validator: (value) {
              if (value!.isEmpty) {
                return 'Campo obrigatorio';
              }
              return null;
            },
            onChanged: (value) {
              registerVM.numberPhone = value;
            },
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
                    (states) => ColorsView.waterGreen),
                side: MaterialStateBorderSide.resolveWith(
                    (states) => const BorderSide(color: ColorsView.waterGreen)),
                backgroundColor: MaterialStateColor.resolveWith(
                    (states) => ColorsView.white),
              ),
              child: WidgetsDecorated.textDecorated(
                  20, 'Cadastrar', ColorsView.waterGreen),
              onPressed: () async {
                registerVM.isSend = true;
                setState(() {});
                if (_formKey.currentState!.validate()) {
                  registerVM.typeUser = TypeUser.CLIENT;
                  await _userController.register(registerVM).then(
                    (value) {
                      Flushbar(
                        duration: const Duration(seconds: 2),
                        backgroundColor: ColorsView.waterGreen,
                        messageText: WidgetsDecorated.textDecorated(
                            20, 'Cadastrado com sucesso!', Colors.white),
                      ).show(context);
                    },
                  ).onError(
                    (error, stackTrace) {
                      Flushbar(
                        duration: const Duration(seconds: 2),
                        backgroundColor: ColorsView.redWarn,
                        messageText: WidgetsDecorated.textDecorated(
                            20, error.toString().split(":")[1], Colors.white),
                      ).show(context);
                    },
                  );
                }
                registerVM.isSend = false;
                setState(() {});
              },
            ),
          ),
          if (registerVM.isSend) ...{const LinearProgressIndicator()},
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
        ],
      ),
    );
  }
}
