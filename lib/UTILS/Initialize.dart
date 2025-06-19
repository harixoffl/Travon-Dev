import 'package:get/get.dart';
import 'package:travon/API/invoker.dart';
import 'package:travon/IAM/controllers/IAM_actions.dart';

void initialize_IAM() {
  Get.lazyPut<IAMController>(() => IAMController());
  Get.lazyPut<SessiontokenController>(() => SessiontokenController());
  Get.lazyPut<LoginController>(() => LoginController());
  Get.lazyPut<RegisterController>(() => RegisterController());
  Get.lazyPut<ForgotpasswordController>(() => ForgotpasswordController());
  Get.lazyPut<NewpasswordController>(() => NewpasswordController());
  Get.lazyPut<Invoker>(() => Invoker());
  Get.lazyPut<VerifyOTPControllers>(() => VerifyOTPControllers());
}

// void initialize_others() {
//   Get.lazyPut<NotificationController>(() => NotificationController());
// ////////////////////////////----SALES----////////////////////////////////////
//   Get.lazyPut<SalesController>(() => SalesController());
//   Get.lazyPut<ClientreqController>(() => ClientreqController());
//   Get.lazyPut<InvoiceController>(() => InvoiceController());
//   Get.lazyPut<QuoteController>(() => QuoteController());
//   Get.lazyPut<RfqController>(() => RfqController());
//   Get.lazyPut<DcController>(() => DcController());
//   Get.lazyPut<CustomPDF_InvoiceController>(() => CustomPDF_InvoiceController());
//   Get.lazyPut<CustomPDF_QuoteController>(() => CustomPDF_QuoteController());
//   Get.lazyPut<CustomPDF_DcController>(() => CustomPDF_DcController());

//   ////////////////////////--------HIERARCHY-------/////////////////////////////
//   Get.lazyPut<HierarchyController>(() => HierarchyController());
//   ////////////////////////////----SUBSCRIPTION----////////////////////////////////////
//   Get.lazyPut<SubscriptionController>(() => SubscriptionController());
//   Get.lazyPut<SUBSCRIPTION_CustomPDF_InvoiceController>(() => SUBSCRIPTION_CustomPDF_InvoiceController());
//   Get.lazyPut<SUBSCRIPTION_QuoteController>(() => SUBSCRIPTION_QuoteController());
//   Get.lazyPut<SUBSCRIPTION_ClientreqController>(() => SUBSCRIPTION_ClientreqController());

//   ////////////////////////////----BILLING----////////////////////////////////////
//   Get.lazyPut<MainBilling_Controller>(() => MainBilling_Controller());
//   Get.lazyPut<VoucherController>(() => VoucherController());
//   Get.lazyPut<View_LedgerController>(() => View_LedgerController());
//   Get.lazyPut<Account_LedgerController>(() => Account_LedgerController());
//   Get.lazyPut<TDS_LedgerController>(() => TDS_LedgerController());
//   Get.lazyPut<GST_LedgerController>(() => GST_LedgerController());
// }
