import 'package:firebase_auth/firebase_auth.dart';
import 'package:taxi_app/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.name, required super.email, required super.uid});
  factory UserModel.fromUserEntity(UserEntity userEntity) {
    return UserModel(
      name: userEntity.name,
      email: userEntity.email,
      uid: userEntity.uid,
    );
  }

  factory UserModel.fromFirebaseUser(User user) => UserModel(
    name: user.displayName ?? '',
    email: user.email ?? '',
    uid: user.uid,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      uid: json['uid'],
    );
  }

  // Map<String, String> toJson() => {'uid': uid, 'name': name, 'email': email};
  Map<String, String> toJson() {
    return {'name': name, 'email': email, 'uid': uid};
  }
}
