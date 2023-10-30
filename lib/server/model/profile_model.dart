class profileModel {
  final String userId;
  final String name;
  final String email;
  final String mobile;
  final String type;
  final String address;
  final String city;
  final String pincode;
  final double latitude;
  final double longitude;
  final DateTime createdAt;
  final DateTime updatedAt;

  profileModel({
    required this.userId,
    required this.name,
    required this.email,
    required this.mobile,
    required this.type,
    required this.address,
    required this.city,
    required this.pincode,
    required this.latitude,
    required this.longitude,
    required this.createdAt,
    required this.updatedAt,
  });

  factory profileModel.fromJson(Map<String, dynamic> json) {
    return profileModel(
      userId: json['user_id'],
      name: json['name'],
      email: json['email'],
      mobile: json['mobile'],
      type: json['type'],
      address: json['address'],
      city: json['city'],
      pincode: json['pincode'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

/////////////// Hacker/////////////
