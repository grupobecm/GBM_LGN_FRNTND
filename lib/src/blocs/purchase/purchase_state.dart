part of 'purchase_cubit.dart';

class PurchaseState extends Equatable {
  final PurchaseOrder orderData;

  static const PurchaseOrder emptyOrder = PurchaseOrder(
    phasesID: [],
    ticketsID: [],
    firstName: '',
    lastName: '',
    email: '',
    secret: '',
  );

  const PurchaseState({
    this.orderData = emptyOrder,
  });

  PurchaseState copyWith({
    PurchaseOrder? orderData,
  }) =>
      PurchaseState(
        orderData: PurchaseOrder(
          phasesID: orderData?.phasesID ?? this.orderData.phasesID,
          ticketsID: orderData?.ticketsID ?? this.orderData.ticketsID,
          firstName: orderData?.firstName ?? this.orderData.firstName,
          lastName: orderData?.lastName ?? this.orderData.lastName,
          email: orderData?.email ?? this.orderData.email,
          secret: orderData?.secret ?? this.orderData.secret,
        ),
      );

  @override
  List<Object> get props => [orderData];
}
