class UserModel {
  String id;
  String name;
  String email;
  String address;
  String? image;
  UserModel({
    required this.id,
    required this.name,
    required this.address,
    required this.email,
    this.image,
  });
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "address": address,
      "image": image,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      email: json['email'],
      image: json['image'],
    );
  }
}
