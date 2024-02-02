part of "./contact.dart";

class ContactModel {
  String fullname;
  String email;
  String phoneNumber;
  String status;

  ContactModel({
    required this.fullname,
    required this.email,
    required this.phoneNumber,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      "fullname": fullname,
      "email": email,
      "phoneNumber": phoneNumber,
      "status": status,
    };
  }

  factory ContactModel.fromMap(Map<String, dynamic> map) {
    return ContactModel(
      fullname: map['fullname'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      status: map['status'],
    );
  }

  String toJson() => json.encode(toMap());
}
