import 'package:flutter/material.dart';

import '../../config/custom_colors.dart';
import '../../widgets/button_confirm.dart';
import '../../widgets/input_login.dart';

class ChangePasswordData extends StatelessWidget {
  const ChangePasswordData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alterar senha de acesso'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              InputLogin(
                  labelInput: 'Senha atual',
                  prefexIcon: Icons.lock,
                  input: TextInputType.text),
              const SizedBox(
                height: 25,
              ),
              InputLogin(
                  labelInput: 'Nova senha',
                  prefexIcon: Icons.lock,
                  input: TextInputType.text),
              const SizedBox(
                height: 25,
              ),
              InputLogin(
                  labelInput: 'Confirmar senha',
                  prefexIcon: Icons.lock,
                  input: TextInputType.text),
              const SizedBox(
                height: 25,
              ),
              ButtonConfirm(
                title: 'Alterar senha',
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
                        'Alteração de senha',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      content: const Text(
                        'Deseja alterar a senha?',
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
