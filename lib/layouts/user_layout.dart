import 'package:boletera/views/login_view.dart';
import 'package:boletera/views/recovery_password_view.dart';
import 'package:flutter/material.dart';

class UserLayout extends StatelessWidget {
  const UserLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Row(
        children: [
          Container(
            color: Colors.amber,
            width: size.width - 600,
            height: size.height,
          ),
          Container(
            color: Colors.white,
            width: 600,
            child: const RecoveryPasswordView(),
          )
        ],
      ),
    );
  }
}
