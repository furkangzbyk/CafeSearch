import 'package:flutter/material.dart';
import 'package:login/gecistext/hesap.dart';
import 'package:login/utils/global.colors.dart';
import 'package:login/view/login/text.form.global.dart';

// ignore: camel_case_types
class hesapolustur extends StatelessWidget {
  hesapolustur({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordrepeat = TextEditingController();

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
                'Hesabını Oluştur',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: GlobalColors.textColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              //// Email Input
              TextFormGlobal(
                controller: emailController,
                text: 'Email',
                obscure: false,
                textInputType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 10),

              ////Password Input
              TextFormGlobal(
                controller: passwordController,
                text: 'Şifre',
                textInputType: TextInputType.text,
                obscure: true,
              ),

              const SizedBox(height: 10),

              TextFormGlobal(
                controller: passwordrepeat,
                text: 'Şifreni Onayla',
                textInputType: TextInputType.text,
                obscure: true,
              ),

              const SizedBox(height: 10),
              const HesapOlusturuldu(),
              const SizedBox(height: 25),
            ],
          ),
        )),
      ),
    );
  }
}
