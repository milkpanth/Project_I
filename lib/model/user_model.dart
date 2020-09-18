//ทำงานเกี่ยวข้องกับ userTABLE
class UserModel {
  String id;
  String name;
  String user;
  String password;
  String phonenumber;

  UserModel({this.id, this.name, this.user, this.password, this.phonenumber});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['Name'];
    user = json['User'];
    password = json['Password'];
    phonenumber = json['Phonenumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Name'] = this.name;
    data['User'] = this.user;
    data['Password'] = this.password;
    data['Phonenumber'] = this.phonenumber;
    return data;
  }
}
