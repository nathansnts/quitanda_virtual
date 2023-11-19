import 'package:flutter/material.dart';
import 'package:quitanda_virtual/src/config/custom_colors.dart';
import 'package:quitanda_virtual/src/pages/profile/change_registration_data.dart';

import 'change_password_data.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Meu perfil',
          style: TextStyle(fontSize: 22),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: const [
          Icon(
            Icons.exit_to_app_outlined,
            size: 28,
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 45),
          child: Column(
            children: [
              Image.asset(
                'assets/icons/person.png',
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  'Alterar foto',
                  style: TextStyle(
                    color: CustomColors.customContrastsColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ChangeRegistrationData()));
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: CustomColors.customContrastsColor),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.person),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Alterar dados cadastrais',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ChangePasswordData()));
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: CustomColors.customContrastsColor),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.lock_outline),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Alterar senha de acesso',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
