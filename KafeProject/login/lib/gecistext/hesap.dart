import 'package:flutter/material.dart';
import 'package:login/view/login.view.dart';

class HesapOlusturuldu extends StatelessWidget {
  const HesapOlusturuldu({super.key});

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
          'Hesabını Oluştur',
          style: TextStyle(color: Colors.white),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.purple)),
      ),
    );
  }
}
