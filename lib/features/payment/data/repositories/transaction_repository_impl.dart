import '../../../../util/constants/constants_export.dart';
import '../../../../util/resources/remote_base_repository.dart';
import '../../domain/models/request/transaction_request.dart';
import '../../domain/models/transaction_momo.dart';
import '../../domain/models/transaction_zalo.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../remote/transaction_source.dart';

class TransactionRepositoryImpl extends RemoteBaseRepository
    implements TransactionRepository {
  final TransactionSource _transactionSource;
  TransactionRepositoryImpl(this._transactionSource);

  @override
  Future<TransactionMomo> createTransactionMomo({
    required TransactionRequest request,
  }) {
    return getDataOf<TransactionMomo>(
      request: () => _transactionSource.createTransactionMomo(
        request,
        APIConstants.contentType,
      ),
    );
  }

  @override
  Future<TransactionZalo> createTransactionZalo({
    required TransactionRequest request,
  }) {
    return getDataOf<TransactionZalo>(
      request: () => _transactionSource.createTransactionZalo(
        request,
        APIConstants.contentType,
      ),
    );
  }
}
