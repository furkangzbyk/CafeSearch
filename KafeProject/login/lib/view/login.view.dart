import 'package:flutter/material.dart';
import 'package:login/butongecis/hesapolustur.dart';
import 'package:login/utils/global.colors.dart';
import 'package:login/view/login/button.global.dart';
import 'package:login/view/login/social.login.dart';
import 'package:login/view/login/text.form.global.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final TextEditingController emailController = TextEditingController();
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
                'Giriş Yap',
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
              const ButtonGlobal(),
              const SizedBox(height: 25),
              const SocialLogin(),
            ],
          ),
        )),
      ),
      bottomNavigationBar: Container(
        height: 80,
        color: Colors.white,
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => hesapolustur())),
          child: const Text(
            'Hesap Oluştur',
            style: TextStyle(color: Colors.white),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.purple)),
        ),
      ),
    );
  }
}
