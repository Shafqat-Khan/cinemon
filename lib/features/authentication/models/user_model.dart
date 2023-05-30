
class UserModel {
  final String? id;
  final String? email;
  final String? password;
  final String? fName;
  final String? sName;
  final String? phoneNo;
  final String? address;
  final String? gender;

  const UserModel ({
    this.id,
    required this.email,
    required this.password,
    required this.fName,
    required this.sName,
    required this.phoneNo,
    required this.address,
    required this.gender,
  });

  toJson(){
    return {
      "Email": email,
      "Password": password,
      "FullName": fName,
      "LastName": sName,
      "PhoneNumber": phoneNo,
      "Address": address,
      "Gender": gender
    };
  }
}