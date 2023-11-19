import 'package:flutter/material.dart';
import 'package:quitanda_virtual/src/config/custom_colors.dart';
import 'package:quitanda_virtual/src/widgets/button_confirm.dart';
import 'package:quitanda_virtual/src/widgets/input_login.dart';

class ChangeRegistrationData extends StatelessWidget {
  const ChangeRegistrationData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alterar dados cadastrais'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              InputLogin(
                  labelInput: 'Nome',
                  prefexIcon: Icons.person_outline_outlined,
                  input: TextInputType.text),
              const SizedBox(
                height: 25,
              ),
              InputLogin(
                  labelInput: 'E-mail',
                  prefexIcon: Icons.email_outlined,
                  input: TextInputType.emailAddress),
              const SizedBox(
                height: 25,
              ),
              InputLogin(
                  labelInput: 'Cpf',
                  prefexIcon: Icons.paste_outlined,
                  input: TextInputType.text),
              const SizedBox(
                height: 25,
              ),
              InputLogin(
                  labelInput: 'Telefone',
                  prefexIcon: Icons.phone_android_outlined,
                  input: TextInputType.phone),
              const SizedBox(
                height: 30,
              ),
              ButtonConfirm(
                title: 'Confirmar alterações',
                colorButton: CustomColors.customContrastsColor,
                onPressedConfirm: () {
                  showDialog<String>(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => AlertDialog(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      title: const Text(
                        'Alteração dos dados',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      content: const Text(
                        'Deseja confirmar as alterações?',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      actions: [
                        TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                CustomColors.customContrastsColor),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Sim',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context, 'Não');
                          },
                          child: Text(
                            'Não',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: CustomColors.customContrastsColor),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
