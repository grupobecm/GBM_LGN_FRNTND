import 'package:boletera/src/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:boletera/src/blocs/auxiliary/auxiliary_cubit.dart';
import 'package:boletera/src/services/services.dart';

class LogoImage extends StatelessWidget {
  final double? topPadding;
  final double? scale;
  final bool? horizontalPadding;

  const LogoImage({
    this.topPadding,
    this.scale,
    this.horizontalPadding = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AuxiliaryCubit auxiliaryCubit = context.watch<AuxiliaryCubit>();

    return Padding(
      padding: EdgeInsets.only(
        top: topPadding ?? 0,
        left: horizontalPadding == true ? 100 : 0,
        right: horizontalPadding == true ? 100 : 0,
      ),
      child: Hero(
        tag: 1,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => NavigationService.replaceTo(Flurorouter.shopRoute, auxiliaryCubit),
            child: Image.asset(
              'assets/images/logo_black.png',
              scale: scale,
            ),
          ),
        ),
      ),
    );
  }
}
