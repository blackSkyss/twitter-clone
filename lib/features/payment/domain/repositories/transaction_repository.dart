import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/remote/transaction_source.dart';
import '../../data/repositories/transaction_repository_impl.dart';
import '../models/request/transaction_request.dart';
import '../models/transaction_model.dart';

part 'transaction_repository.g.dart';

abstract class TransactionRepository {
  Future<Transaction> createTransaction({required TransactionRequest request});
}

@riverpod
TransactionRepository transactionRepository(TransactionRepositoryRef ref) {
  final transactionResource = ref.read(transactionSourceProvider);
  return TransactionRepositoryImpl(transactionResource);
}
