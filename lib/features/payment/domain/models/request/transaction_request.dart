class TransactionRequest {
  final String email;
  final double amount;
  final String redirectUrl;
  TransactionRequest({
    required this.email,
    required this.amount,
    required this.redirectUrl,
  });
}
