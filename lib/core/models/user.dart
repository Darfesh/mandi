import 'package:appwrite/models.dart' as models;

class User {
  final String id;
  final String email;
  final String? displayName;
  final String fullName;
  final String? avatarUrl;

  User({
    required this.id,
    required this.email,
    this.displayName,
    required this.fullName,
    this.avatarUrl,
  });

  // From Appwrite Auth (no avatar yet!)
  factory User.fromAppwriteUser(models.User appwriteUser) {
    return User(
      id: appwriteUser.$id,
      email: appwriteUser.email,
      displayName: appwriteUser.name,
      fullName: appwriteUser.name,
      avatarUrl: null,
    );
  }

  factory User.fromDocument(Map<String, dynamic> json) {
    return User(
      id: json['userId'],
      email: json['email'],
      displayName: json['displayName'],
      fullName: json['fullName'],
      avatarUrl: json['avatarUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': id,
      'email': email,
      'displayName': displayName,
      'fullName': fullName,
      'avatarUrl': avatarUrl,
    };
  }

  // Convenience getter
  String get name => displayName ?? 'fullName';
}
