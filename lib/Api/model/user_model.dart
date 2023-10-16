class User {
  String fullname;
  String username;
  String email;

  User({
    required this.fullname,
    required this.username,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    fullname: json["Fullname"],
    username: json["Username"],
    email: json["Email"],
  );
}
