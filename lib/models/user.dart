class User {
  final int? driverId;
  final String? driverName;
  final String? status;
  final String? phoneNo;
  final String? licenseNo;
  final String? image;
  final String? userName;
  final String? password;

  User({
    this.driverId,
    this.driverName,
    this.status,
    this.phoneNo,
    this.licenseNo,
    this.image,
    this.userName,
    this.password,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      driverId: map['driverId'],
      driverName: map['driverName'],
      status: map['status'],
      phoneNo: map['phoneNo'],
      licenseNo: map['licenseNo'],
      image: map['image'],
      userName: map['userName'],
      password: map['password'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'driverId': driverId,
      'driverName': driverName,
      'status': status,
      'phoneNo': phoneNo,
      'licenseNo': licenseNo,
      'image': image,
      'userName': userName,
      'password': password,
    };
  }
}
