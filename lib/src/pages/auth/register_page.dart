import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:quitanda_virtual/src/pages/auth/login_screen.dart';
import '../../config/custom_colors.dart';
import '../../widgets/button_confirm.dart';
import '../../widgets/input_login.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizeVertical = MediaQuery.of(context).size.height * 0.06;
    final sizeHorizontal = MediaQuery.of(context).size.width * 0.05;
    var maskCpfFormatter = MaskTextInputFormatter(
        mask: '###.###.###-##', filter: {'#': RegExp(r'[0-9]')});
    var maskNumberFormat = MaskTextInputFormatter(
        mask: '(##) #####-####', filter: {'#': RegExp(r'[0-9]')});
    return Scaffold(
      backgroundColor: CustomColors.customContrastsColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          'Faça seu cadastro',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: sizeVertical, horizontal: sizeHorizontal),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        InputLogin(
                            labelInput: 'Nome',
                            prefexIcon: Icons.person,
                            sufxIcon: null,
                            isVisibility: false,
                            input: TextInputType.text),
                        const SizedBox(
                          height: 15,
                        ),
                        InputLogin(
                          labelInput: 'Cpf',
                          prefexIcon: Icons.paste,
                          format: maskCpfFormatter,
                          input: TextInputType.number,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        InputLogin(
                            labelInput: 'E-mail',
                            prefexIcon: Icons.email_outlined,
                            sufxIcon: null,
                            isVisibility: false,
                            input: TextInputType.emailAddress),
                        const SizedBox(
                          height: 15,
                        ),
                        InputLogin(
                          labelInput: 'Celular',
                          prefexIcon: Icons.phone_android_outlined,
                          format: maskNumberFormat,
                          input: TextInputType.number,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        InputLogin(
                          labelInput: 'Senha',
                          prefexIcon: Icons.lock_outline,
                          sufxIcon: Icons.visibility_off_outlined,
                          isVisibility: true,
                          input: TextInputType.text,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        InputLogin(
                            labelInput: 'Confirmar senha',
                            prefexIcon: Icons.lock_outline,
                            sufxIcon: Icons.visibility_off_outlined,
                            isVisibility: true,
                            input: TextInputType.text),
                        const SizedBox(
                          height: 15,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ButtonConfirm(
                          title: 'Cadastrar',
                          colorButton: CustomColors.customContrastsColor,
                          colorText: Colors.white,
                          onPressedConfirm: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const RegisterPage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 10,
                left: 5,
                child: SafeArea(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop(
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
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
