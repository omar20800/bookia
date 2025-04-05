class CartRequest {
  int? itemId;
  int? quantity;

  CartRequest({this.itemId, this.quantity});

  Map<String, dynamic> toJson() {
    return {'cart_item_id': itemId, 'quantity': quantity};
  }
}
