import 'package:flutter/material.dart';
import 'package:login/view/login.view.dart';

class girisbasarili extends StatelessWidget {
  const girisbasarili({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 800,
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => MapScreen())),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.purple)),
        child: const Text(
          'Giriş Yap',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
