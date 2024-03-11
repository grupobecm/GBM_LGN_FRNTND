import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

import 'package:boletera/src/ui/layouts/layouts.dart';

part 'auxiliary_state.dart';

class AuxiliaryCubit extends Cubit<AuxiliaryState> {
  AuxiliaryCubit({
    String message = '',
    String code = '',
    bool isLoading = false,
    Layout actualLayout = Layout.shop,
  }) : super(AuxiliaryState(
          message: message,
          code: code,
          isLoading: isLoading,
          actualLayout: actualLayout,
        ));

  void changeActualLayout(Layout newLayout) {
    emit(state.copyWith(actualLayout: newLayout));
  }

  void changeLoadingState(bool isLoading) {
    emit(state.copyWith(isLoading: isLoading));
    Future.delayed(const Duration(milliseconds: 100));
  }

  void changeCode(String code) {
    emit(state.copyWith(code: code));
  }

  void resetMessage() {
    emit(state.copyWith(message: '', code: ''));
  }

  Widget selectedLayout(Widget? child) {
    if (state.actualLayout == Layout.shop) return ShopLayout(child: child!);
    if (state.actualLayout == Layout.auth) return AuthLayout(child: child!);
    if (state.actualLayout == Layout.dashboard) return DashboardLayout(child: child!);

    return const SizedBox();
  }

  void getMessageString(AppLocalizations localization) {
    switch (state.code) {
      case '200':
        emit(state.copyWith(message: localization.successLogin));
        break;
      case '404':
        emit(state.copyWith(message: localization.errorLogin));
        break;
      case '000':
        emit(state.copyWith(message: 'Error en la comunicación, Intentelo mas tarde.'));
        break;
      case 'Succeeded':
        emit(state.copyWith(message: localization.successStripe));
        break;
      case 'Error':
        emit(state.copyWith(message: localization.errorStripe));
        break;
      default:
        emit(state.copyWith(message: ''));
    }
  }

  SnackBar generateMessage(ContentType type) {
    return SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: state.code,
        message: state.message,
        contentType: type,
      ),
    );
  }
}
