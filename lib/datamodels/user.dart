class PublicUser {
  final String id;
  final String fullName;
  final String email;

  PublicUser({this.id, this.fullName, this.email});

  PublicUser.fromData(Map<String, dynamic> data)
      : id = data['id'],
        fullName = data['fullName'],
        email = data['email'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
    };
  }
}
