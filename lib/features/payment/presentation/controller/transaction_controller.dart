import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../util/constants/constants_export.dart';
import '../../../../util/enums/payment_enum.dart';
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
  Future<String> createTransaction(int amount, int type) async {
    var code = '';
    state = const AsyncValue.loading();
    final authRepository = ref.read(authRepositoryProvider);
    final transactionRepository = ref.read(transactionRepositoryProvider);
    final typeEnum = type.toPaymentTypeEnum();

    // ignore: unused_local_variable
    final user = await authRepository.getUserData('');
    TransactionRequest request = TransactionRequest(
      amount: amount,
      redirectUrl: typeEnum == PaymentType.zalopay
          ? 'Nothing'
          : APIConstants.redirectUrl,
    );

    state = await AsyncValue.guard(
      () async {
        switch (typeEnum) {
          case PaymentType.momo:
            final res = await transactionRepository.createTransactionMomo(
              request: request,
            );

            code = res.deeplink;
            break;

          case PaymentType.zalopay:
            final res = await transactionRepository.createTransactionZalo(
              request: request,
            );

            code = res.zp_trans_token;
            break;

          case PaymentType.paypal: // Coming soon
            break;

          default:
            final res = await transactionRepository.createTransactionMomo(
              request: request,
            );
            code = res.deeplink;
        }
      },
    );

    return code;
  }
}
