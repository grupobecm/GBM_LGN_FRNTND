import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

part 'messages_state.dart';

class MessageCubit extends Cubit<MessageState> {
  MessageCubit({
    String message = '',
    String code = '',
  }) : super(MessageState(
          message: message,
          code: code,
        ));

  void changeCode(String code) {
    emit(state.copyWith(code: code));
  }

  void resetMessage() {
    emit(state.copyWith(message: '', code: ''));
  }

  void getMessageString(AppLocalizations localization) {
    switch (state.code) {
      case '200':
        emit(state.copyWith(message: localization.successLogin));
        break;
      case '404':
        emit(state.copyWith(message: localization.errorLogin));
        break;
      case '001':
        emit(state.copyWith(message: ''));
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