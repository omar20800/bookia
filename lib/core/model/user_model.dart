import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final dynamic address;
  @HiveField(4)
  final dynamic city;
  @HiveField(5)
  final dynamic phone;
  @HiveField(6)
  final bool emailVerified;
  @HiveField(7)
  final String image;
  @HiveField(8)
  final String token;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.city,
    required this.phone,
    required this.emailVerified,
    required this.image,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["user"]["id"],
    name: json["user"]["name"],
    email: json["user"]["email"],
    address: json["user"]["address"],
    city: json["user"]["city"],
    phone: json["user"]["phone"],
    emailVerified: json["user"]["email_verified"],
    image: json["user"]["image"],
    token: json["token"],
  );

  UserModel copyWith({
    int? id,
    String? name,
    String? email,
    dynamic address,
    dynamic city,
    dynamic phone,
    bool? emailVerified,
    String? image,
    String? token,
  }) => UserModel(
    id: id ?? this.id,
    name: name ?? this.name,
    email: email ?? this.email,
    address: address ?? this.address,
    city: city ?? this.city,
    phone: phone ?? this.phone,
    emailVerified: emailVerified ?? this.emailVerified,
    image: image ?? this.image,
    token: token ?? this.token,
  );
}
