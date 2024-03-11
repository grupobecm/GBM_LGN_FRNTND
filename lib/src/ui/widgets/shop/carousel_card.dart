import 'package:flutter/material.dart';

import 'package:boletera/src/blocs/blocs.dart';
import 'package:boletera/src/routes/router.dart';
import 'package:boletera/src/services/services.dart';
// import 'package:boletera/src/ui/widgets/widgets.dart';

class CarouselCard extends StatelessWidget {
  const CarouselCard({super.key});

  @override
  Widget build(BuildContext context) {
    final AuxiliaryCubit auxiliaryCubit = AuxiliaryCubit();

    final Size size = MediaQuery.of(context).size;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => NavigationService.navigateTo(Flurorouter.shopEventRoute, auxiliaryCubit),
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                width: size.width * 0.9,
                child: Image.asset(
                  'assets/images/Banner.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              width: size.width * 0.9,
              height: 130,
              // height: size.height,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Expo Moto',
                        style: Theme.of(context).textTheme.headlineSmall,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Spacer(),
                    Icon(Icons.calendar_month, color: Theme.of(context).colorScheme.shadow),
                    Text('26-27 Febrero', style: Theme.of(context).textTheme.headlineSmall),
                    const SizedBox(width: 30),
                    Icon(Icons.access_time, color: Theme.of(context).colorScheme.shadow),
                    Text('1:20 pm - 12:00 am', style: Theme.of(context).textTheme.headlineSmall),
                    const SizedBox(width: 20),
                    Icon(Icons.location_on, color: Theme.of(context).colorScheme.shadow),
                    Expanded(
                      child: Text(
                        'WTC, CDMX',
                        style: Theme.of(context).textTheme.headlineSmall,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 20),
                    // CustomGradientButton(isRectangular: true, text: 'Adquirir Boletos', onPressed: () {})
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
