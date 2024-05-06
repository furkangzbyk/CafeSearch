import 'package:flutter/material.dart';
import 'package:login/butongecis/sifreunuttum.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 700,
      alignment: Alignment.bottomRight,
      child: ElevatedButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => sifreunuttum())),
        child: Text(
          'Şifreni mi unuttun?',
          style: TextStyle(color: Colors.white),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.purple)),
      ),
    );
  }
}
