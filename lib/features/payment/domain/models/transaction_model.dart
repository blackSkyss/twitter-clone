// ignore_for_file: non_constant_identifier_names
import 'dart:convert';

class Transaction {
  final String RechargeID;
  final String RechargeTime;
  final double Amount;
  final String Content;
  final String TransactionType;
  final int RechargeStatus;
  final String PayUrl;
  final String Deeplink;
  final String QrCodeUrl;
  final String Applink;
  Transaction({
    required this.RechargeID,
    required this.RechargeTime,
    required this.Amount,
    required this.Content,
    required this.TransactionType,
    required this.RechargeStatus,
    required this.PayUrl,
    required this.Deeplink,
    required this.QrCodeUrl,
    required this.Applink,
  });

  Transaction copyWith({
    String? RechargeID,
    String? RechargeTime,
    double? Amount,
    String? Content,
    String? TransactionType,
    int? RechargeStatus,
    String? PayUrl,
    String? Deeplink,
    String? QrCodeUrl,
    String? Applink,
  }) {
    return Transaction(
      RechargeID: RechargeID ?? this.RechargeID,
      RechargeTime: RechargeTime ?? this.RechargeTime,
      Amount: Amount ?? this.Amount,
      Content: Content ?? this.Content,
      TransactionType: TransactionType ?? this.TransactionType,
      RechargeStatus: RechargeStatus ?? this.RechargeStatus,
      PayUrl: PayUrl ?? this.PayUrl,
      Deeplink: Deeplink ?? this.Deeplink,
      QrCodeUrl: QrCodeUrl ?? this.QrCodeUrl,
      Applink: Applink ?? this.Applink,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'RechargeID': RechargeID});
    result.addAll({'RechargeTime': RechargeTime});
    result.addAll({'Amount': Amount});
    result.addAll({'Content': Content});
    result.addAll({'TransactionType': TransactionType});
    result.addAll({'RechargeStatus': RechargeStatus});
    result.addAll({'PayUrl': PayUrl});
    result.addAll({'Deeplink': Deeplink});
    result.addAll({'QrCodeUrl': QrCodeUrl});
    result.addAll({'Applink': Applink});

    return result;
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      RechargeID: map['RechargeID'] ?? '',
      RechargeTime: map['RechargeTime'] ?? '',
      Amount: map['Amount']?.toDouble() ?? 0.0,
      Content: map['Content'] ?? '',
      TransactionType: map['TransactionType'] ?? '',
      RechargeStatus: map['RechargeStatus']?.toInt() ?? 0,
      PayUrl: map['PayUrl'] ?? '',
      Deeplink: map['Deeplink'] ?? '',
      QrCodeUrl: map['QrCodeUrl'] ?? '',
      Applink: map['Applink'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Transaction.fromJson(String source) =>
      Transaction.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Transaction(RechargeID: $RechargeID, RechargeTime: $RechargeTime, Amount: $Amount, Content: $Content, TransactionType: $TransactionType, RechargeStatus: $RechargeStatus, PayUrl: $PayUrl, Deeplink: $Deeplink, QrCodeUrl: $QrCodeUrl, Applink: $Applink)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Transaction &&
        other.RechargeID == RechargeID &&
        other.RechargeTime == RechargeTime &&
        other.Amount == Amount &&
        other.Content == Content &&
        other.TransactionType == TransactionType &&
        other.RechargeStatus == RechargeStatus &&
        other.PayUrl == PayUrl &&
        other.Deeplink == Deeplink &&
        other.QrCodeUrl == QrCodeUrl &&
        other.Applink == Applink;
  }

  @override
  int get hashCode {
    return RechargeID.hashCode ^
        RechargeTime.hashCode ^
        Amount.hashCode ^
        Content.hashCode ^
        TransactionType.hashCode ^
        RechargeStatus.hashCode ^
        PayUrl.hashCode ^
        Deeplink.hashCode ^
        QrCodeUrl.hashCode ^
        Applink.hashCode;
  }
}
