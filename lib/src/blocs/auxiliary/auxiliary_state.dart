part of 'auxiliary_cubit.dart';

enum Layout { auth, dashboard, shop }

class AuxiliaryState extends Equatable {
  final String message;
  final String code;
  final bool isLoading;
  final Layout actualLayout;

  const AuxiliaryState({
    required this.message,
    required this.code,
    required this.isLoading,
    required this.actualLayout,
  });

  AuxiliaryState copyWith({
    String? message,
    String? code,
    bool? isLoading,
    Layout? actualLayout,
  }) =>
      AuxiliaryState(
        message: message ?? this.message,
        code: code ?? this.code,
        isLoading: isLoading ?? this.isLoading,
        actualLayout: actualLayout ?? this.actualLayout,
      );

  @override
  List<Object> get props => [message, code, isLoading, actualLayout];
}
