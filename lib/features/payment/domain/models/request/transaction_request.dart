import 'dart:convert';

class TransactionRequest {
  final String email;
  final int amount;
  final String redirectUrl;
  TransactionRequest({
    required this.email,
    required this.amount,
    required this.redirectUrl,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'email': email});
    result.addAll({'amount': amount});
    result.addAll({'redirectUrl': redirectUrl});

    return result;
  }

  factory TransactionRequest.fromMap(Map<String, dynamic> map) {
    return TransactionRequest(
      email: map['email'] ?? '',
      amount: map['amount']?.toInt() ?? 0,
      redirectUrl: map['redirectUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionRequest.fromJson(String source) =>
      TransactionRequest.fromMap(json.decode(source));
}
