import 'package:apphotelbooking/model-view/register-vm.dart';
import 'package:flutter/material.dart';
import 'package:masked_text/masked_text.dart';

import '../../shared-view-widgets/colors.dart';
import '../../shared-view-widgets/widgets-decorated.dart';

class EnterpriseRegisterComponents extends StatefulWidget {
  EnterpriseRegisterComponents(this.registerVM, {super.key});

  RegisterModelView registerVM;

  @override
  State<EnterpriseRegisterComponents> createState() =>
      _EnterpriseRegisterComponentsState();
}

class _EnterpriseRegisterComponentsState
    extends State<EnterpriseRegisterComponents> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
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
                    (states) => ColorsView.waterGreen),
                side: MaterialStateBorderSide.resolveWith(
                    (states) => const BorderSide(color: ColorsView.waterGreen)),
                backgroundColor: MaterialStateColor.resolveWith(
                    (states) => ColorsView.white),
              ),
              child: WidgetsDecorated.textDecorated(
                  20, 'Cadastrar', ColorsView.waterGreen),
              onPressed: () async {},
            ),
          ),
          if (true) ...{const LinearProgressIndicator()}
        ],
      ),
    );
  }
}
