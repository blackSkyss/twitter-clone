enum PaymentStatusType {
  fail(0),
  success(1),
  cancel(2);

  final int type;
  const PaymentStatusType(this.type);
}

extension ConvertPaymentStatus on int {
  PaymentStatusType toPaymentStatusTypeEnum() {
    switch (this) {
      case 0:
        return PaymentStatusType.fail;
      case 1:
        return PaymentStatusType.success;
      case 2:
        return PaymentStatusType.cancel;
      default:
        return PaymentStatusType.fail;
    }
  }
}
