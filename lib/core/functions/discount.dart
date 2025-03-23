discountCalculate({required double price, required int discount}) {
  return ((price * discount) / 100).toInt();
}
