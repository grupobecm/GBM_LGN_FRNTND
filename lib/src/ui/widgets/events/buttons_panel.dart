import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:boletera/src/blocs/blocs.dart';
import 'package:boletera/src/routes/router.dart';
import 'package:boletera/src/ui/views/views.dart';
import 'package:boletera/src/services/services.dart';
import 'package:boletera/src/ui/widgets/custom_gradient_button.dart';
import 'package:boletera/src/ui/widgets/custom_outlined_button.dart';

// ignore: must_be_immutable
class ButtonsPanel extends StatelessWidget {
  late EventsBloc _eventsBloc;
  late AuxiliaryCubit _auxiliaryCubit;

  ButtonsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    _auxiliaryCubit = context.watch<AuxiliaryCubit>();
    _eventsBloc = context.watch<EventsBloc>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _eventsBloc.state.step != 0
            ? CustomOutlinedButton(
                text: _eventsBloc.state.step == 1
                    ? 'Crear Area'
                    : _eventsBloc.state.step == 2
                        ? 'Crear Fase'
                        : 'Agregar Invitado',
                onPressed: () => _selectFunction(context),
              )
            : CustomGradientButton(
                text: 'Guardar',
                // onPressed: () => _eventsBloc.passStep(),
                onPressed: () => _selectFunction(context),
              ),
        const SizedBox(width: 10),
        _eventsBloc.state.step != 0
            ? _eventsBloc.state.step == 3
                ? CustomGradientButton(
                    text: 'Finalizar',
                    onPressed: () {
                      if (_eventsBloc.state.step == 3) {
                        _eventsBloc.resetSteps();
                        NavigationService.replaceTo(Flurorouter.eventsRoute, _auxiliaryCubit);
                      } else {
                        _eventsBloc.passStep();
                      }
                    })
                : CustomGradientButton(
                    text: 'Continuar',
                    onPressed: () {
                      if (_eventsBloc.state.step == 3) {
                        _eventsBloc.resetSteps();
                        NavigationService.replaceTo(Flurorouter.eventsRoute, _auxiliaryCubit);
                      } else {
                        _eventsBloc.passStep();
                      }
                    })
            : const SizedBox(),
      ],
    );
  }

  void _selectFunction(BuildContext context) async {
    // final AuxiliaryCubit messageCubit = context.watch<AuxiliaryCubit>();
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    final ScaffoldMessengerState scaffoldMessenger = ScaffoldMessenger.of(context)..hideCurrentSnackBar();

    switch (_eventsBloc.state.step) {
      case 0:
        await _eventsBloc.createEvent(context);
        if (_auxiliaryCubit.state.code.isNotEmpty) {
          _auxiliaryCubit.getMessageString(appLocalizations);
          scaffoldMessenger.showSnackBar(
            _auxiliaryCubit.generateMessage(
              _auxiliaryCubit.state.code == '200' ? ContentType.success : ContentType.failure,
            ),
          );
        }

        if (_auxiliaryCubit.state.code == '200' || _auxiliaryCubit.state.code == '201') _eventsBloc.passStep();
        _auxiliaryCubit.resetMessage();
        break;
      case 1:
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (_) {
            final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

            _eventsBloc.resetFormKey(loginFormKey);

            return Dialog(
              child: CreateAreaForm(
                formKey: _eventsBloc.formKey,
              ),
            );
          },
        );
        break;
      case 2:
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (_) {
            final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

            _eventsBloc.resetFormKey(loginFormKey);

            return Dialog(
              child: CreatePhaseForm(
                formKey: _eventsBloc.formKey,
              ),
            );
          },
        );
        break;
      case 3:
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (_) {
            final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

            _eventsBloc.resetFormKey(loginFormKey);

            return Dialog(
              child: CreateGuestForm(
                formKey: _eventsBloc.formKey,
              ),
            );
          },
        );
        break;
      default:
    }
  }
}
