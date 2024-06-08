class Userr{
  int? id;
  String? name;
  String? email;
  String? password;

  Userr({this.id , this.name , this.email , this.password});

// from map to object(model)
  Userr.fromJson(Map json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    password = json["password"];
  }

// from object to map (we used it to send to databse)
  Map <String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
    };
  }
}