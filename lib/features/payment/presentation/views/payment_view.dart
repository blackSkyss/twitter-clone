import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_zalopay_sdk/flutter_zalopay_sdk.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import '../../../../config/routes/app_router.dart';
import '../../../../config/themes/theme_export.dart';
import '../../../../util/commons/widgets/widget_common_export.dart';
import '../../../../util/constants/constants_export.dart';
import '../../../../util/enums/payment_enum.dart';
import '../../../../util/enums/payment_status_enum.dart';
import '../../../../util/extensions/extensions_export.dart';
import '../controller/transaction_controller.dart';
import '../widgets/amount_field.dart';
import '../widgets/label_text.dart';
import '../widgets/list_tile_payment.dart';

@RoutePage()
class PaymentView extends HookConsumerWidget {
  const PaymentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Init
    final size = MediaQuery.of(context).size;
    final amountController = useTextEditingController();
    final payMethod = useState(PaymentType.momo.type);
    final state = ref.watch(transactionControllerProvider);
    StreamSubscription? sub;

    // Handle error (Controller)
    ref.listen<AsyncValue>(
      transactionControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );

    // Handle deeplink (Momo, etc...)
    Future<void> initUniLinks() async {
      sub = linkStream.listen((String? link) {
        if (link != null) {
          var uri = Uri.parse(link);
          if (uri.queryParameters['amount'] != null &&
              uri.queryParameters['resultCode'] != null) {
            final status =
                int.parse(uri.queryParameters['resultCode'] as String);
            final amount = uri.queryParameters['amount'] as String;

            if (status == 9000) {
              context.router.push(
                PaymentResultViewRoute(
                  currency: 'VND',
                  status: PaymentStatusType.success,
                  title: 'SUCCESSFULLY',
                  message: 'Order has been successfully paid',
                  amount: amount,
                ),
              );

              amountController.text = '';
              payMethod.value = PaymentType.momo.type;
            } else if (status == 1006) {
              context.router.push(
                PaymentResultViewRoute(
                  currency: 'VND',
                  status: PaymentStatusType.cancel,
                  title: 'CANCELED!',
                  message: 'Order has been canceled!',
                  amount: amount,
                ),
              );
            } else {
              context.router.push(
                PaymentResultViewRoute(
                  currency: 'VND',
                  status: PaymentStatusType.fail,
                  title: 'FAILED!',
                  message: 'Order payment failed!',
                  amount: amount,
                ),
              );
            }
          }
        }
      }, onError: (err) {
        // Handle exception by warning the user their action did not succeed
      });
    }

    // Init and dispose stream
    useEffect(() {
      initUniLinks();
      return () async {
        await sub?.cancel();
      };
    }, const []);

    // Change payment method
    void onchangePayMethod(int val) {
      payMethod.value = val;
    }

    // Handle Momo
    void handleMomo() async {
      final link = await ref
          .read(transactionControllerProvider.notifier)
          .createTransaction(
            int.parse(amountController.text.trim()),
            payMethod.value,
          );

      if (await canLaunchUrl(Uri.parse(link))) {
        await launchUrl(Uri.parse(link));
      } else {
        showSnackBar(
          context: context,
          content: 'Cannot launch deeplink: $link',
        );
      }
    }

    // Handle Zalopay
    void handleZalopay() async {
      final token = await ref
          .read(transactionControllerProvider.notifier)
          .createTransaction(
            int.parse(amountController.text.trim()),
            payMethod.value,
          );

      FlutterZaloPaySdk.payOrder(zpToken: token).listen((event) {
        switch (event) {
          case FlutterZaloPayStatus.cancelled:
            context.router.push(
              PaymentResultViewRoute(
                currency: 'VND',
                status: PaymentStatusType.cancel,
                title: 'CANCELED!',
                message: 'Order has been canceled!',
                amount: amountController.text.trim(),
              ),
            );
            break;
          case FlutterZaloPayStatus.success:
            context.router.push(
              PaymentResultViewRoute(
                currency: 'VND',
                status: PaymentStatusType.success,
                title: 'SUCCESSFULLY',
                message: 'Order has been successfully paid',
                amount: amountController.text.trim(),
              ),
            );

            amountController.text = '';
            payMethod.value = PaymentType.momo.type;
            break;
          case FlutterZaloPayStatus.failed:
            context.router.push(
              PaymentResultViewRoute(
                currency: 'VND',
                status: PaymentStatusType.fail,
                title: 'FAILED!',
                message: 'Order payment failed!',
                amount: amountController.text.trim(),
              ),
            );
            break;
          default:
            context.router.push(
              PaymentResultViewRoute(
                currency: 'VND',
                status: PaymentStatusType.fail,
                title: 'FAILED!',
                message: 'Order payment failed!',
                amount: amountController.text.trim(),
              ),
            );
        }
      });
    }

    // Handle Paypal
    void handlePaypal() async {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => PaypalCheckout(
            sandboxMode: true,
            clientId: APIConstants.clientIdPaypal,
            secretKey: APIConstants.secretKeyPaypal,
            returnURL: "success.snippetcoder.com",
            cancelURL: "cancel.snippetcoder.com",
            transactions: [
              {
                "amount": {
                  "total": amountController.text,
                  "currency": "USD",
                  "details": {
                    "subtotal": amountController.text,
                    "shipping": '0',
                    "shipping_discount": 0
                  }
                },
                "description": "The payment transaction description.",
                // "payment_options": {
                //   "allowed_payment_method":
                //       "INSTANT_FUNDING_SOURCE"
                // },
                "item_list": {
                  "items": [
                    {
                      "name": "Twitter Blue",
                      "quantity": 1,
                      "price": amountController.text,
                      "currency": "USD"
                    },
                  ],

                  // shipping address is not required though
                  //   "shipping_address": {
                  //     "recipient_name": "Raman Singh",
                  //     "line1": "Delhi",
                  //     "line2": "",
                  //     "city": "Delhi",
                  //     "country_code": "IN",
                  //     "postal_code": "11001",
                  //     "phone": "+00000000",
                  //     "state": "Texas"
                  //  },
                }
              }
            ],
            note: "Contact us for any questions on your order.",
            onSuccess: (Map params) async {
              context.router.push(
                PaymentResultViewRoute(
                  currency: 'USD',
                  status: PaymentStatusType.success,
                  title: 'SUCCESSFULLY',
                  message: 'Order has been successfully paid',
                  amount: amountController.text.trim(),
                ),
              );

              amountController.text = '';
              payMethod.value = PaymentType.momo.type;
            },
            onError: (error) {
              context.router.push(
                PaymentResultViewRoute(
                  currency: 'USD',
                  status: PaymentStatusType.fail,
                  title: 'FAILED!',
                  message: 'Order payment failed!',
                  amount: amountController.text.trim(),
                ),
              );
            },
            onCancel: () {
              context.router.push(
                PaymentResultViewRoute(
                  currency: 'USD',
                  status: PaymentStatusType.cancel,
                  title: 'CANCELED!',
                  message: 'Order has been canceled!',
                  amount: amountController.text.trim(),
                ),
              );
            },
          ),
        ),
      );
    }

    // Payment order
    void paymentOrder() {
      if (amountController.text.isEmpty) {
        showSnackBar(context: context, content: 'Amount is empty');
        return;
      }

      final amount = int.parse(amountController.text.trim());

      if (payMethod.value == PaymentType.momo.type ||
          payMethod.value == PaymentType.zalopay.type) {
        if (amount < 10000 || amount > 1000000) {
          showSnackBar(
              context: context,
              content: 'Amount min is 10.000 VND and max is 1.000.000 VND');
          return;
        }
      } else {
        if (amount < 10 || amount > 1000) {
          showSnackBar(
              context: context,
              content: 'Amount min is 10 USD and max is 1.000 USD');
          return;
        }
      }

      if (payMethod.value == PaymentType.momo.type) {
        handleMomo();
      } else if (payMethod.value == PaymentType.zalopay.type) {
        handleZalopay();
      } else {
        handlePaypal();
      }
    }

    // UI-----
    return Scaffold(
      backgroundColor: Pallete.backgroupPayment,
      appBar: AppBar(
        title: const Text('Payment'),
        centerTitle: true,
      ),
      body: state.isLoading
          ? const Loader()
          : SingleChildScrollView(
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
                          ),
                        ),
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
