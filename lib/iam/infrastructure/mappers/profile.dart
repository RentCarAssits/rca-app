import '../../domain/entities/profile.dart';

class ProfileMapper {
  static Profile profileJsonToEntity(Map<String, dynamic> json) => Profile(
    id: json['id'] as int,
    fullName: json['fullName'] as String? ?? '',
    address: json['address'] as String? ?? '',
    phone: json['phone'] as String? ?? '',
    dni: json['dni'] as String? ?? '',
    isActive: json['isActive'] as bool? ?? false,
  );
}