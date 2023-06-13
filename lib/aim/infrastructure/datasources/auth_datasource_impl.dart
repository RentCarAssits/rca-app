import 'package:dio/dio.dart';
import 'package:rca_app/shared/config/config.dart';
import 'package:rca_app/aim/domain/domain.dart';
import 'package:rca_app/aim/infrastructure/infrastructure.dart';import 'package:shared_preferences/shared_preferences.dart';


class AuthDataSourceImpl extends AuthDataSource {
  final dio = Dio(BaseOptions(
    baseUrl: ('http://192.168.18.17:8080/api/v1'),
  ));

  @override
  Future<User> checkAuthStatus(String token) {
    // TODO: implement checkAuthStatus
    throw UnimplementedError();
  }

  @override
  Future<User> login(String email, String password) async {
    print('email  ${email}');
    try {
      final response = await dio
          .post('/auth/login', data: {'email': email, 'password': password});
      print('response.data ${response}');
      final user = UserMapper.userJsonToEntity(response.data);
      print(response.data);
      return user;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        print(
            'Error de autenticación: ${e.response?.data['message'] ?? 'Credenciales incorrectas'}');
        throw CustomError(
            e.response?.data['message'] ?? 'Credenciales incorrectas');
      }
      if (e.type == DioErrorType.connectionTimeout) {
        print('Error de conexión: Revisar conexión a internet');
        throw CustomError('Revisar conexión a internet');
      }
      print('Error no controlado 1: $e');
      throw Exception();
    } catch (e) {
      print('Error no controlado 2: $e');
      throw Exception();
    }
  }

  @override
  Future<User> register(String email, String password, String name,
      String lastName, String role) async {


    print('${email},${password},${name},${lastName},${role} ');
    try {
      final response = await dio.post('/users/sign-up', data: {
        'name': name,
        'lastName': lastName,
        'email': email,
        'role': role,
        'password': password,
      });
      print('response.data ${response}');
      final user = UserMapper.userJsonToEntity(response.data);
      print(response.data);
      return user;
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        print(
            'Error de autenticación: ${e.response?.data['message'] ?? 'Credenciales incorrectas'}');
        throw CustomError(
            e.response?.data['message'] ?? 'Credenciales incorrectas');
      }
      if (e.type == DioErrorType.connectionTimeout) {
        print('Error de conexión: Revisar conexión a internet');
        throw CustomError('Revisar conexión a internet');
      }
      print('Error no controlado 3: $e');
      throw Exception();
    } catch (e) {
      print('Error no controlado 4: $e');
      throw Exception();
    }
  }
}
