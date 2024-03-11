import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:boletera/src/blocs/blocs.dart';
import 'package:boletera/src/ui/widgets/widgets.dart';

class TicketPurchase extends StatelessWidget {
  const TicketPurchase({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 100,
          color: Colors.black,
          child: const Center(
            child: Text(
              'Aqui va el stteper',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const OrderCard(),
              Card(
                color: Colors.amber,
                child: SizedBox(
                  width: size.width * 0.3,
                  height: size.height * 0.6,
                  child: Center(
                    child: Text('Datos del Evento', style: Theme.of(context).textTheme.titleMedium),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class OrderCard extends StatelessWidget {
  const OrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    final PurchaseCubit purchaseCubit = context.watch<PurchaseCubit>();

    final Size size = MediaQuery.of(context).size;

    return Card(
      elevation: 10,
      child: SizedBox(
        width: size.width * 0.4,
        height: size.height * 0.3,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Datos de la orden', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(child: CustomFormField(text: 'Nombre *', onChanged: () {})),
                  const SizedBox(width: 10),
                  Expanded(child: CustomFormField(text: 'Apellidos *', onChanged: () {})),
                ],
              ),
              CustomFormField(text: 'Email *', onChanged: () {}),
              Align(
                alignment: Alignment.bottomRight,
                child: CustomGradientButton(
                  text: 'Pagar Boleto',
                  onPressed: () {
                    purchaseCubit.processPayment(context);
                    // purchaseCubit.stripePayment('pi_3OrxcJLQGIF4IMXc0gxoJJJm_secret_DH18iu50RydvkhzRxDCNBmEYC');
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
