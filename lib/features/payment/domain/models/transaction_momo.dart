import 'dart:convert';

class TransactionMomo {
  final String rechargeID;
  final String rechargeTime;
  final double amount;
  final String content;
  final String transactionType;
  final int rechargeStatus;
  final String payUrl;
  final String deeplink;
  final String qrCodeUrl;
  final String applink;
  TransactionMomo({
    required this.rechargeID,
    required this.rechargeTime,
    required this.amount,
    required this.content,
    required this.transactionType,
    required this.rechargeStatus,
    required this.payUrl,
    required this.deeplink,
    required this.qrCodeUrl,
    required this.applink,
  });

  TransactionMomo copyWith({
    String? rechargeID,
    String? rechargeTime,
    double? amount,
    String? content,
    String? transactionType,
    int? rechargeStatus,
    String? payUrl,
    String? deeplink,
    String? qrCodeUrl,
    String? applink,
  }) {
    return TransactionMomo(
      rechargeID: rechargeID ?? this.rechargeID,
      rechargeTime: rechargeTime ?? this.rechargeTime,
      amount: amount ?? this.amount,
      content: content ?? this.content,
      transactionType: transactionType ?? this.transactionType,
      rechargeStatus: rechargeStatus ?? this.rechargeStatus,
      payUrl: payUrl ?? this.payUrl,
      deeplink: deeplink ?? this.deeplink,
      qrCodeUrl: qrCodeUrl ?? this.qrCodeUrl,
      applink: applink ?? this.applink,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'rechargeID': rechargeID});
    result.addAll({'rechargeTime': rechargeTime});
    result.addAll({'amount': amount});
    result.addAll({'content': content});
    result.addAll({'transactionType': transactionType});
    result.addAll({'rechargeStatus': rechargeStatus});
    result.addAll({'payUrl': payUrl});
    result.addAll({'deeplink': deeplink});
    result.addAll({'qrCodeUrl': qrCodeUrl});
    result.addAll({'applink': applink});

    return result;
  }

  factory TransactionMomo.fromMap(Map<String, dynamic> map) {
    return TransactionMomo(
      rechargeID: map['rechargeID'] ?? '',
      rechargeTime: map['rechargeTime'] ?? '',
      amount: map['amount']?.toDouble() ?? 0.0,
      content: map['content'] ?? '',
      transactionType: map['transactionType'] ?? '',
      rechargeStatus: map['rechargeStatus']?.toInt() ?? 0,
      payUrl: map['payUrl'] ?? '',
      deeplink: map['deeplink'] ?? '',
      qrCodeUrl: map['qrCodeUrl'] ?? '',
      applink: map['applink'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionMomo.fromJson(String source) =>
      TransactionMomo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TransactionMomo(rechargeID: $rechargeID, rechargeTime: $rechargeTime, amount: $amount, content: $content, transactionType: $transactionType, rechargeStatus: $rechargeStatus, payUrl: $payUrl, deeplink: $deeplink, qrCodeUrl: $qrCodeUrl, applink: $applink)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TransactionMomo &&
        other.rechargeID == rechargeID &&
        other.rechargeTime == rechargeTime &&
        other.amount == amount &&
        other.content == content &&
        other.transactionType == transactionType &&
        other.rechargeStatus == rechargeStatus &&
        other.payUrl == payUrl &&
        other.deeplink == deeplink &&
        other.qrCodeUrl == qrCodeUrl &&
        other.applink == applink;
  }

  @override
  int get hashCode {
    return rechargeID.hashCode ^
        rechargeTime.hashCode ^
        amount.hashCode ^
        content.hashCode ^
        transactionType.hashCode ^
        rechargeStatus.hashCode ^
        payUrl.hashCode ^
        deeplink.hashCode ^
        qrCodeUrl.hashCode ^
        applink.hashCode;
  }
}
