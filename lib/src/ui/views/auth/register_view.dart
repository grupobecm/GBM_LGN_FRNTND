import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// import 'package:flutter/material.dart';

// class RecoveryPasswordView extends StatelessWidget {
//   const RecoveryPasswordView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.symmetric(horizontal: 130, vertical: 50),
//       child: Column(
//         children: [
//           const Text(
//             'Recuperar contraseña',
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
//           ),
//           const SizedBox(height: 30),
//           const Text(
//             'Ingresa el correo electrónco con el que te registraste.',
//             style: TextStyle(fontSize: 13),
//           ),
//           const SizedBox(height: 50),
//           TextField(
//             decoration: InputDecoration(
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(5),
//               ),
//               labelText: 'Correo',
//             ),
//           ),
//           const SizedBox(height: 70),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               OutlinedButton(
//                 style: ButtonStyle(
//                   side: MaterialStatePropertyAll(
//                     BorderSide(color: Theme.of(context).colorScheme.primary),
//                   ),
//                 ),
//                 child: const Text('Cancelar'),
//                 onPressed: () {},
//               ),
//               Container(
//                 width: 120,
//                 height: 35,
//                 decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                   gradient: LinearGradient(
//                     colors: [
//                       Color(0xFF4e85f4),
//                       Color(0xFF5529ef),
//                     ],
//                     stops: [0.3, 0.7],
//                   ),
//                 ),
//                 child: MaterialButton(
//                   shape: const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(20)),
//                   ),
//                   hoverColor: const Color(0xFF4a68f4).withOpacity(0.7),
//                   child: const Text(
//                     'Aceptar',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   onPressed: () {},
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
