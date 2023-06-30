import 'package:rca_app/iam/domain/entities/account.dart';
import 'package:rca_app/iam/domain/entities/profile.dart';

class User {
  int id;
  String userName;
  String email;
  String password;
  List<String> roles;
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

  bool get isOwner {
    return roles.contains('owner');
  }
  bool get isRenter {
    return roles.contains('renter');
  }
  bool get isMechanic {
    return roles.contains('mechanic');
  }
}
