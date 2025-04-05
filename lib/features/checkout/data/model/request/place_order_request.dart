class PlaceOrderRequest {
  final int? governorateid;
  final String? name;
  final String? phone;
  final String? address;
  final String? email;

  PlaceOrderRequest({
    this.governorateid,
    this.name,
    this.phone,
    this.address,
    this.email,
  });

  Map<String, dynamic> toJson() => {
    'governorate_id': governorateid,
    'name': name,
    'phone': phone,
    'address': address,
    'email': email,
  };
}
