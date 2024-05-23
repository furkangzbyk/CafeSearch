import 'package:flutter/material.dart';
import 'package:login/gecistext/sifre.dart';
import 'package:login/utils/global.colors.dart';
import 'package:login/view/login/text.form.global.dart';

// ignore: camel_case_types
class sifreunuttum extends StatelessWidget {
  sifreunuttum({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'CafeSearch',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: GlobalColors.mainColor,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Text(
                'Şifreni Değiştir',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: GlobalColors.textColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 15),
              //// Email Input
              TextFormGlobal(
                controller: emailController,
                text: 'Mevcut Şifre',
                obscure: false,
                textInputType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 10),

              ////Password Input
              TextFormGlobal(
                controller: passwordController,
                text: 'Yeni Şifre',
                textInputType: TextInputType.text,
                obscure: true,
              ),

              const SizedBox(height: 10),

              TextFormGlobal(
                controller: newPasswordController,
                text: 'Yeni Şifreni Onayla',
                textInputType: TextInputType.text,
                obscure: true,
              ),

              const SizedBox(height: 10),
              const SifreDegistirildi(),
              const SizedBox(height: 25),
            ],
          ),
        )),
      ),
    );
  }
}
