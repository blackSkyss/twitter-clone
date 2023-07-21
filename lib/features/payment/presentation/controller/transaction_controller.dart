import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../util/constants/constants_export.dart';
import '../../../auth/data/repositories/auth_repository.dart';
import '../../domain/models/request/transaction_request.dart';
import '../../domain/repositories/transaction_repository.dart';

part 'transaction_controller.g.dart';

@riverpod
class TransactionController extends _$TransactionController {
  @override
  FutureOr<void> build() {
    // nothing to do
  }

  // Create transaction
  Future<void> createTransaction(double amount) async {
    state = const AsyncValue.loading();
    final authRepository = ref.read(authRepositoryProvider);
    final transactionRepository = ref.read(transactionRepositoryProvider);

    final user = await authRepository.getUserData('');
    TransactionRequest request = TransactionRequest(
      email: user.email,
      amount: amount,
      redirectUrl: APIConstants.redirectUrl,
    );

    state = await AsyncValue.guard(
      () async {
        await transactionRepository.createTransaction(request: request);
      },
    );
  }
}
