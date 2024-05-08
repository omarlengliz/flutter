class UserModel {
  final String id;
  final String firstname;
  final String lastname;
  final String username;
  final String email;
  final String phone;
  final String password;
  final String status;
  final String verificationCode;
  final String fcmToken;

  UserModel({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.username,
    required this.email,
    required this.phone,
    required this.password,
    required this.status,
    required this.verificationCode,
    required this.fcmToken,
  });

  static UserModel empty() {
    return UserModel(
      id: '',
      firstname: '',
      lastname: '',
      username: '',
      email: '',
      phone: '',
      password: '',
      status: '',
      verificationCode: '',
      fcmToken: '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstname': firstname,
      'lastname': lastname,
      'username': username,
      'email': email,
      'phone': phone,
      'password': password,
      'status': status,
      'verificationCode': verificationCode,
      'fcmToken': fcmToken,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      password: json['password'],
      status: json['status'],
      verificationCode: json['verificationCode'],
      fcmToken: json['fcmToken'],
    );
  }
}
