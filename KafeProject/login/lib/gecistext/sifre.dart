import 'package:flutter/material.dart';
import 'package:login/view/login.view.dart';

class SifreDegistirildi extends StatelessWidget {
  const SifreDegistirildi({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 260,
      alignment: Alignment.bottomRight,
      child: ElevatedButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginView())),
        child: Text(
          'Şifreni Değiştir',
          style: TextStyle(color: Colors.white),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.purple)),
      ),
    );
  }
}
