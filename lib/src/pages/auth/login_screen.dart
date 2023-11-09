import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:quitanda_virtual/src/config/custom_colors.dart';
import 'package:quitanda_virtual/src/pages/auth/register_page.dart';
import 'package:quitanda_virtual/src/pages/screen_base/base_screen.dart';
import 'package:quitanda_virtual/src/widgets/button_confirm.dart';
import 'package:quitanda_virtual/src/widgets/input_login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final iconsSizeHeight = MediaQuery.of(context).size.width *
        0.2; //Ajuste de fração do ícone conforme o tamanho da tela do aparelho
    final iconsSizeWidth = MediaQuery.of(context).size.width * 0.2;
    final sizeVertical = MediaQuery.of(context).size.height * 0.06;
    final sizeHorizontal = MediaQuery.of(context).size.width * 0.05;
    return Scaffold(
      backgroundColor: CustomColors.customContrastsColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: sizeVertical),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Image.asset(
                        'assets/icons/logo_market.png',
                        width: iconsSizeWidth,
                        height: iconsSizeHeight,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        'Quitanda Virtual',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 30,
                        child: DefaultTextStyle(
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          child: AnimatedTextKit(
                            pause: const Duration(seconds: 1),
                            repeatForever: true,
                            animatedTexts: [
                              ScaleAnimatedText('O melhor preço da região'),
                              ScaleAnimatedText('Carnes'),
                              ScaleAnimatedText('Hortfruti'),
                              ScaleAnimatedText('E muito mais!'),
                            ],
                          ),
                        ),
                      ),
                    ],
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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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
                    labelInput: 'Senha',
                    prefexIcon: Icons.lock_outline,
                    sufxIcon: Icons.visibility_off_outlined,
                    isVisibility: true,
                    input: TextInputType.text),
                const SizedBox(
                  height: 15,
                ),
                ButtonConfirm(
                  title: 'Entrar',
                  colorButton: CustomColors.customContrastsColor,
                  onPressedConfirm: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const BaseScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        print('Click');
                      },
                      child: const Text(
                        'Esqueceu a senha? Clique aqui!',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 226, 41, 41),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Ou',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ButtonConfirm(
                  title: 'Criar conta',
                  colorButton: Colors.white,
                  colorText: CustomColors.customContrastsColor,
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
    );
  }
}
