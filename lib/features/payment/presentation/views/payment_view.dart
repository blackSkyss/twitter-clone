import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../config/themes/theme_export.dart';
import '../../../../util/constants/constants_export.dart';
import '../../../../util/enums/payment_enum.dart';
import '../widgets/amount_field.dart';
import '../widgets/label_text.dart';
import '../widgets/list_tile_payment.dart';

@RoutePage()
class PaymentView extends HookConsumerWidget {
  const PaymentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final amountController = useTextEditingController();
    final payMethod = useState(PaymentType.momo.type);

    // Change payment method
    void onchangePayMethod(int val) {
      payMethod.value = val;
    }

    // Handle Momo
    void handleMomo() {}

    // Handle Zalopay
    void handleZalopay() async {}

    // Handle Paypal
    void handlePaypal() {}

    // Payment order
    void paymentOrder() {
      switch (payMethod.value) {
        case 0:
          handleMomo;
          break;
        case 1:
          handleZalopay;
          break;
        case 2:
          handlePaypal;
          break;
        default:
          handleMomo;
      }
    }

    return Scaffold(
      backgroundColor: Pallete.backgroupPayment,
      appBar: AppBar(
        title: const Text('Payment'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LabelText(content: 'Balance: 10000000'),
              SizedBox(height: size.height * 0.02),
              const LabelText(content: 'Amount'),
              SizedBox(height: size.height * 0.02),
              AmountField(controller: amountController),
              SizedBox(height: size.height * 0.02),
              const LabelText(content: 'Payment Methods'),
              SizedBox(height: size.height * 0.02),
              // Momo-----------
              ListTilePayment(
                payMethod: payMethod.value,
                width: size.width * 0.1,
                path: AssetsConstants.momoLogo,
                title: 'Momo',
                value: PaymentType.momo.type,
                onChange: onchangePayMethod,
              ),
              SizedBox(height: size.height * 0.02),
              // ZaloPay-----------
              ListTilePayment(
                payMethod: payMethod.value,
                width: size.width * 0.1,
                path: AssetsConstants.zalopayLogo,
                title: 'Zalo Pay',
                value: PaymentType.zalopay.type,
                onChange: onchangePayMethod,
              ),
              SizedBox(height: size.height * 0.02),
              // Paypal-----------
              ListTilePayment(
                payMethod: payMethod.value,
                width: size.width * 0.1,
                path: AssetsConstants.paypalLogo,
                title: 'Paypal',
                value: PaymentType.paypal.type,
                onChange: onchangePayMethod,
              ),
              SizedBox(height: size.height * 0.2),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: paymentOrder,
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Pallete.whiteColor,
                      backgroundColor: Pallete.blueColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  child: const Text('Continue'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
