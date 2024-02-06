part of 'messages_cubit.dart';

class MessageState extends Equatable {
  final String message;
  final String code;
  final bool isLoading;

  const MessageState({
    required this.message,
    required this.code,
    this.isLoading = false,
  });

  MessageState copyWith({
    String? message,
    String? code,
    bool? isLoading,
  }) =>
      MessageState(
        message: message ?? this.message,
        code: code ?? this.code,
        isLoading: isLoading ?? this.isLoading,
      );

  @override
  List<Object> get props => [message, code, isLoading];
}
