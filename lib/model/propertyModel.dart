class PropertyModel {
  final String propertyId;
  final String vendorId;
  final String propertyName;
  final String propertyType;
  final List<String> roomType;
  final String streetAddress;
  final String landmark;
  final String pincode;
  final String description;
  final String price;
  final String status;
  final String statusVendor;
  final String gender;
  final List<String> features;
  final List<String> roomImages;
  final List<String> propertyImages;
  final double latitude;
  final double longitude;

  PropertyModel({
    required this.propertyId,
    required this.vendorId,
    required this.propertyName,
    required this.propertyType,
    required this.roomType,
    required this.streetAddress,
    required this.landmark,
    required this.pincode,
    required this.description,
    required this.price,
    required this.status,
    required this.statusVendor,
    required this.gender,
    required this.features,
    required this.roomImages,
    required this.propertyImages,
    required this.latitude,
    required this.longitude,
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
      propertyId: json['property_id'],
      vendorId: json['vendor_id'],
      propertyName: json['property_name'],
      propertyType: json['property_type'],
      roomType: (json['roomType'] as List).cast<String>(),
      streetAddress: json['street_address'],
      landmark: json['landmark'],
      pincode: json['pincode'],
      description: json['description'],
      price: json['price'],
      status: json['status'],
      statusVendor: json['status_vendor'],
      gender: json['gender'],
      features: (json['features'] as List).cast<String>(),
      roomImages: (json['room_images'] as List).cast<String>(),
      propertyImages: (json['property_image'] as List).cast<String>(),
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}
