Wholesaler wholesalerFromMap(Map<String, dynamic> data) =>
    Wholesaler.fromMap(data);

class Wholesaler {
  Wholesaler({
    required this.uid,
    required this.name,
    required this.email,
    required this.aadharNo,
    required this.phoneNo,
  });

  String uid;
  String name;
  String email;
  String phoneNo;
  String aadharNo;

  factory Wholesaler.fromMap(Map<String, dynamic> map) => Wholesaler(
        uid: map['uid'],
        name: map['name'],
        email: map['email'],
        aadharNo: map['aadhar_no'],
        phoneNo: map['phone_no'],
      );
}
