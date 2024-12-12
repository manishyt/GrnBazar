class FarmerHistoryModel {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String country;
  final String city;
  final String address;
  final String mobileNumber;
  final String orderNote;
  final String paymentMethod;
  final double totalBill;
  final String orderStatus;

  FarmerHistoryModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.country,
    required this.city,
    required this.address,
    required this.mobileNumber,
    required this.orderNote,
    required this.paymentMethod,
    required this.totalBill,
    required this.orderStatus,
  });

  // Factory to create model from JSON
  factory FarmerHistoryModel.fromJson(Map<String, dynamic> json) {
    return FarmerHistoryModel(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      country: json['country'],
      city: json['city'],
      address: json['address'],
      mobileNumber: json['mobile_number'].toString(),
      orderNote: json['order_note'],
      paymentMethod: json['payment_method'],
      totalBill: json['total_bill'].toDouble(),
      orderStatus: json['order_status'],
    );
  }
}
