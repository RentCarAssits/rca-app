import '../../domain/entities/account.dart';

class AccountMapper {
  static Account accountJsonToEntity(Map<String, dynamic> json) => Account(
    id: json['id'] as int,
    name: json['name'] as String? ?? '',
  );
}
