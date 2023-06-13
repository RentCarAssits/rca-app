import 'package:rca_app/aim/domain/entities/account.dart';
import 'package:rca_app/aim/domain/entities/profile.dart';

class User {
  int id;
  String userName;
  String email;
  String password;
  String roles;
  Profile? profile;
  Account? account;
  String token;

  User({
    required this.id,
    required this.userName,
    required this.email,
    required this.password,
    required this.roles,
    required this.profile,
    required this.account,
    required this.token,
  });

  bool get isAdmin {
    return roles.contains('admin');
  }
}
