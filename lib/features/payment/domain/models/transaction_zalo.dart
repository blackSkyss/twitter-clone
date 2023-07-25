// ignore_for_file: non_constant_identifier_names
import 'dart:convert';

class TransactionZalo {
  final int? return_code;
  final String return_message;
  final int? sub_return_code;
  final String sub_return_message;
  final String zp_trans_token;
  final String order_url;
  final String order_token;
  TransactionZalo({
    this.return_code,
    required this.return_message,
    this.sub_return_code,
    required this.sub_return_message,
    required this.zp_trans_token,
    required this.order_url,
    required this.order_token,
  });

  TransactionZalo copyWith({
    int? return_code,
    String? return_message,
    int? sub_return_code,
    String? sub_return_message,
    String? zp_trans_token,
    String? order_url,
    String? order_token,
  }) {
    return TransactionZalo(
      return_code: return_code ?? this.return_code,
      return_message: return_message ?? this.return_message,
      sub_return_code: sub_return_code ?? this.sub_return_code,
      sub_return_message: sub_return_message ?? this.sub_return_message,
      zp_trans_token: zp_trans_token ?? this.zp_trans_token,
      order_url: order_url ?? this.order_url,
      order_token: order_token ?? this.order_token,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (return_code != null) {
      result.addAll({'return_code': return_code});
    }
    result.addAll({'return_message': return_message});
    if (sub_return_code != null) {
      result.addAll({'sub_return_code': sub_return_code});
    }
    result.addAll({'sub_return_message': sub_return_message});
    result.addAll({'zp_trans_token': zp_trans_token});
    result.addAll({'order_url': order_url});
    result.addAll({'order_token': order_token});

    return result;
  }

  factory TransactionZalo.fromMap(Map<String, dynamic> map) {
    return TransactionZalo(
      return_code: map['return_code']?.toInt(),
      return_message: map['return_message'] ?? '',
      sub_return_code: map['sub_return_code']?.toInt(),
      sub_return_message: map['sub_return_message'] ?? '',
      zp_trans_token: map['zp_trans_token'] ?? '',
      order_url: map['order_url'] ?? '',
      order_token: map['order_token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionZalo.fromJson(String source) =>
      TransactionZalo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TransactionZalo(return_code: $return_code, return_message: $return_message, sub_return_code: $sub_return_code, sub_return_message: $sub_return_message, zp_trans_token: $zp_trans_token, order_url: $order_url, order_token: $order_token)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TransactionZalo &&
        other.return_code == return_code &&
        other.return_message == return_message &&
        other.sub_return_code == sub_return_code &&
        other.sub_return_message == sub_return_message &&
        other.zp_trans_token == zp_trans_token &&
        other.order_url == order_url &&
        other.order_token == order_token;
  }

  @override
  int get hashCode {
    return return_code.hashCode ^
        return_message.hashCode ^
        sub_return_code.hashCode ^
        sub_return_message.hashCode ^
        zp_trans_token.hashCode ^
        order_url.hashCode ^
        order_token.hashCode;
  }
}
