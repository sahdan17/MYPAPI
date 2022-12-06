class User {
  String? rc;
  String? message;
  String? idStore;
  String? username;
  String? accessToken;

  User({
    this.rc,
    this.message,
    this.idStore,
    this.username,
    this.accessToken,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      rc : json['rc'],
      message : json['message'],
      idStore : json['user']['id_store'],
      username : json['user']['username'],
      accessToken : json['accessToken'],
    );
  }
}
