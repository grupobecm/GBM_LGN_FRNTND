part of 'messages_cubit.dart';

class MessageState extends Equatable {
  final String message;
  final String code;

  const MessageState({
    required this.message,
    required this.code,
  });

  MessageState copyWith({
    String? message,
    String? code,
  }) =>
      MessageState(
        message: message ?? this.message,
        code: code ?? this.code,
      );

  @override
  List<Object> get props => [message, code];
}
