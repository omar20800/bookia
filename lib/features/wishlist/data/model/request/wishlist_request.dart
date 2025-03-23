class WishlistRequest {
  int? id;

  WishlistRequest({this.id});

  Map<String, dynamic> toJson() => {
    'product_id': id,
  };
  
}