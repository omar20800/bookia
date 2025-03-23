class HomeRequest {
  int? id;

  HomeRequest({this.id});

  Map<String, dynamic> toJson() {
    return {'product_id': id};
  }
}
