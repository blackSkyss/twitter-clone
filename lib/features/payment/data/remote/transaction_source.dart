import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../util/constants/constants_export.dart';
import '../../../../util/providers/firebase_providers.dart';
import '../../domain/models/request/transaction_request.dart';
import '../../domain/models/transaction_momo.dart';
import '../../domain/models/transaction_zalo.dart';

part 'transaction_source.g.dart';

@RestApi(baseUrl: APIConstants.baseUrl, parser: Parser.MapSerializable)
abstract class TransactionSource {
  factory TransactionSource(Dio dio, {String baseUrl}) = _TransactionSource;

  @POST('/walletTransactions/createMomoTransaction')
  Future<HttpResponse<TransactionMomo>> createTransactionMomo(
    @Body() TransactionRequest request,
    @Header("Content-Type") String contentType,
  );

  @POST('/wallettransactions/createZalopayTransaction')
  Future<HttpResponse<TransactionZalo>> createTransactionZalo(
    @Body() TransactionRequest request,
    @Header("Content-Type") String contentType,
  );
}

@riverpod
TransactionSource transactionSource(TransactionSourceRef ref) {
  final dio = ref.read(dioProvider);
  return TransactionSource(dio);
}
