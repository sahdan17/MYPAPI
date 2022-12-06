class User {
  int? id;
  String? rc;
  String? message;
  String? idStore;
  String? username;
  String? password;
  String? email;
  String? role;
  String? status;
  String? accessToken;
  String? tokenType;

  User({
    this.id,
    this.rc,
    this.message,
    this.idStore,
    this.username,
    this.password,
    this.email,
    this.role,
    this.status,
    this.accessToken,
    this.tokenType
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id : json['id'],
      rc : json['rc'],
      message : json['message'],
      idStore : json['id_store'],
      username : json['username'],
      password : json['password'],
      email : json['email'],
      role : json['role'],
      status : json['status'],
      accessToken : json['accessToken'],
      tokenType : json['tokenType']
    );
  }
}