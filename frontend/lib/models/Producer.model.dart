class User {
  String id;
  String username;
  String email;

  User({
    this.id,
    this.username,
    this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
    );
  }
}

class Producer {
  String id;
  User user;

  Producer({
    this.user, this.id
  });

  factory Producer.fromJson(Map<String, dynamic> json) {
    return Producer(
      id: json['id'],
      user: User.fromJson(json['user']),
    );
  }
}