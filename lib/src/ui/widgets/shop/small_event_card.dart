import 'package:boletera/src/blocs/blocs.dart';
import 'package:boletera/src/routes/router.dart';
import 'package:boletera/src/services/services.dart';
import 'package:flutter/material.dart';

class SmallEventCard extends StatefulWidget {
  const SmallEventCard({super.key});

  @override
  State<SmallEventCard> createState() => _SmallEventCardState();
}

class _SmallEventCardState extends State<SmallEventCard> {
  late bool isHovered;

  @override
  void initState() {
    isHovered = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AuxiliaryCubit auxiliaryCubit = AuxiliaryCubit();

    return SizedBox(
      width: 350,
      height: 370,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (event) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: GestureDetector(
          onTap: () => NavigationService.navigateTo(Flurorouter.shopEventRoute, auxiliaryCubit),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: const BorderSide(
                color: Colors.grey,
                width: 0.2, // ancho del borde
              ),
            ),
            elevation: isHovered ? 10 : 1,
            shadowColor: Colors.black,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 190,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                    child: Image.asset(
                      'assets/images/Banner.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Expo Moto', style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 20),
                      Text(
                        '26/11/2024',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(height: 10),
                      Text('WTC, CDMX', style: Theme.of(context).textTheme.bodySmall),
                      // const SizedBox(height: 20),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
