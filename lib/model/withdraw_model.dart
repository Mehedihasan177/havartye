class WithDrawModel{
  late String amount;
  late String method_name;


  WithDrawModel({
    required this.amount,
    required this.method_name
});
}

class PaymentMethod{
  late String title;
  late String paymentMethod;

  PaymentMethod(
      this.title,
      this.paymentMethod
      );

}
final List<PaymentMethod> paymentmethod = <PaymentMethod>[
  PaymentMethod('Bkash', 'Bkash'),
  PaymentMethod('Rocket', 'Rocket'),
  PaymentMethod('Nagad', 'Nagad'),

];

