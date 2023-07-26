import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../../config/themes/theme_export.dart';
import '../../../../util/constants/constants_export.dart';
import '../../../../util/enums/enums_export.dart';

@RoutePage()
class PaymentResultView extends StatelessWidget {
  final String currency;
  final PaymentStatusType status;
  final String title;
  final String message;
  final String amount;
  const PaymentResultView({
    super.key,
    required this.status,
    required this.title,
    required this.message,
    required this.amount,
    required this.currency,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Pallete.blueColor,
      appBar: UIConstants.appBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.05),
              Text(
                title,
                style: const TextStyle(
                  color: Pallete.whiteColor,
                  fontSize: 30,
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Text(
                message,
                style: const TextStyle(
                  color: Pallete.whiteColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                currency.endsWith('VND') ? '$amount VND' : '$amount USD',
                style: const TextStyle(
                  color: Pallete.whiteColor,
                  fontSize: 30,
                ),
              ),
              status == PaymentStatusType.success
                  ? Lottie.network(
                      LottieConstants.paymentSuccess,
                    )
                  : Lottie.network(LottieConstants.paymentFail),
              ElevatedButton(
                onPressed: () => context.router.pop(),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Pallete.blueColor,
                  backgroundColor: Pallete.whiteColor,
                ),
                child: const Text('OK'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
