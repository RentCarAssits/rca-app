import 'package:rca_app/aim/infrastructure/mappers/profile.dart';
import 'package:rca_app/aim/domain/domain.dart';

import '../../domain/entities/user.dart';
import 'account.dart';

class UserMapper {
  static User userJsonToEntity(Map<String, dynamic> json) => User(
    id: json['id'] as int,
    userName: json['userName'] as String? ?? '',
    email: json['email'] as String? ?? '',
    password: json['password'] as String? ?? '',
    roles: json['roles'] as String ?? '',
    profile: json['profile'] != null ? ProfileMapper.profileJsonToEntity(json['profile'] as Map<String, dynamic>) : null,
    account: json['account'] != null ? AccountMapper.accountJsonToEntity(json['account'] as Map<String, dynamic>) : null,
    token: json['token'] as String? ?? '',
  );
}

