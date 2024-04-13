import 'package:apphotelbooking/model-view/register-vm.dart';
import 'package:flutter/material.dart';
import 'package:masked_text/masked_text.dart';

import '../../enterprise/createhotel.dart';
import '../../shared-view-widgets/colors.dart';
import '../../shared-view-widgets/widgets-decorated.dart';

class EnterpriseRegisterComponents extends StatefulWidget {
  EnterpriseRegisterComponents(this._registerVM, {super.key});

  RegisterModelView _registerVM;

  @override
  State<EnterpriseRegisterComponents> createState() =>
      _EnterpriseRegisterComponentsState(_registerVM);
}

class _EnterpriseRegisterComponentsState
    extends State<EnterpriseRegisterComponents> {
  _EnterpriseRegisterComponentsState(this._registerVM);

  final _formKey = GlobalKey<FormState>();
  RegisterModelView _registerVM;

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
              _registerVM.name = value;
            },
            style: const TextStyle(
              fontFamily: 'principal',
              fontSize: 17,
            ),
            decoration: const InputDecoration(
              labelText: 'Nome da empresa',
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
              _registerVM.email = value;
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
              _registerVM.password = value;
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: MaskedTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Campo obrigatorio';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _registerVM.cpf = value;
                  },
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
            validator: (value) {
              if (value!.isEmpty) {
                return 'Campo obrigatorio';
              }
              return null;
            },
            onChanged: (value) {
              _registerVM.numberPhone = value;
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
              onPressed: () {
                _registerVM.isSend = true;
                setState(() {});
                if (true) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateHotel(_registerVM),
                      ));
                }
                _registerVM.isSend = false;
                setState(() {});
              },
            ),
          ),
          if (_registerVM.isSend) ...{const LinearProgressIndicator()}
        ],
      ),
    );
  }
}
