import '../../../../util/resources/remote_base_repository.dart';
import '../../domain/models/request/transaction_request.dart';
import '../../domain/models/transaction_model.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../remote/transaction_source.dart';

class TransactionRepositoryImpl extends RemoteBaseRepository
    implements TransactionRepository {
  final TransactionSource _transactionSource;
  TransactionRepositoryImpl(this._transactionSource);

  @override
  Future<Transaction> createTransaction({required TransactionRequest request}) {
    return getDataOf(
      request: () => _transactionSource.createTransaction(request),
    );
  }
}
