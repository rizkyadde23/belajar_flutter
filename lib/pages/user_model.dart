class User {
  final int id;
  final String name;
  final String email;
  final String avatar;

  User({
    required this.avatar,
    required this.id,
    required this.name,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic>json){
    return User(
      id: json['id'], 
      name: "${json['first_name']} ${json['last_name']}", 
      email: json['email'],
      avatar: json['avatar'],
      );
  }
}