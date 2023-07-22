enum PaymentType {
  momo(0),
  zalopay(1),
  paypal(2);

  final int type;
  const PaymentType(this.type);
}

extension ConvertPayment on int {
  PaymentType toPaymentTypeEnum() {
    switch (this) {
      case 0:
        return PaymentType.momo;
      case 1:
        return PaymentType.zalopay;
      case 2:
        return PaymentType.paypal;
      default:
        return PaymentType.momo;
    }
  }
}
