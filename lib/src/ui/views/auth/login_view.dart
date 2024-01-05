import 'package:flutter/material.dart';

import 'package:boletera/src/ui/widgets/widgets.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 370),
        child: const Form(
          child: Column(
            children: [
              SocialButtons(),
              SizedBox(height: 40),
              LoginForm(),
              SizedBox(height: 40),
              ResgisterLink(),
            ],
          ),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:sign_button/sign_button.dart';

// class LoginView extends StatelessWidget {
//   const LoginView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.symmetric(horizontal: 130, vertical: 50),
//       child: Column(
//         children: [
//           const Text(
//             'Continuar con',
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
//           ),
//           const SizedBox(height: 40),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               SignInButton(
//                 shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
//                 buttonType: ButtonType.facebook,
//                 btnColor: const Color.fromARGB(247, 247, 247, 255),
//                 btnTextColor: Colors.black,
//                 btnText: 'Facebook',
//                 buttonSize: ButtonSize.large,
//                 width: 140,
//                 onPressed: () {},
//               ),
//               SignInButton(
//                 shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
//                 buttonType: ButtonType.google,
//                 btnText: 'Google',
//                 buttonSize: ButtonSize.large,
//                 width: 140,
//                 onPressed: () {},
//               )
//             ],
//           ),
//           const SizedBox(height: 30),
//           const Text(
//             'O ingresa con tu cuenta de correo',
//           ),
//           const SizedBox(height: 30),
//           TextField(
//             decoration: InputDecoration(
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(5),
//               ),
//               labelText: 'Correo',
//             ),
//           ),
//           const SizedBox(height: 20),
//           TextField(
//             decoration: InputDecoration(
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(5),
//               ),
//               labelText: 'Contraseña',
//             ),
//           ),
//           const SizedBox(height: 40),
//           Container(
//             width: 400,
//             height: 40,
//             decoration: const BoxDecoration(
//               borderRadius: BorderRadius.all(Radius.circular(20)),
//               gradient: LinearGradient(
//                 colors: [
//                   Color(0xFF4e85f4),
//                   Color(0xFF5529ef),
//                 ],
//                 stops: [0.2, 0.8],
//               ),
//             ),
//             child: MaterialButton(
//               shape: const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(20)),
//               ),
//               hoverColor: const Color(0xFF4a68f4).withOpacity(0.7),
//               child: const Text(
//                 'Iniciar sesión',
//                 style: TextStyle(color: Colors.white),
//               ),
//               onPressed: () {},
//             ),
//           ),
//           const SizedBox(height: 30),
//           const Text(
//             '¿Olvidaste tu contraseña?',
//           ),
//           const SizedBox(height: 50),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text(
//                 style: TextStyle(color: Colors.grey),
//                 '¿Eres nuevo en Ticketin? ',
//               ),
//               TextButton(
//                 style: const ButtonStyle(overlayColor: MaterialStatePropertyAll(Colors.transparent)),
//                 child: Text(
//                   'Crea una cuenta',
//                   style: TextStyle(
//                     color: Theme.of(context).colorScheme.primary,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 onPressed: () {},
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

