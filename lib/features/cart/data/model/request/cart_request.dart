class CartRequest {
  int? itemId;

  CartRequest({this.itemId});

  Map<String, dynamic> toJson() {
    return {'cart_item_id': itemId};
  }
}
