import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rca_app/iam/domain/domain.dart';
import 'package:rca_app/iam/infrastructure/infrastructure.dart';
import 'package:rca_app/shared/infrastructure/services/key_value_storage_service.dart';
import 'package:rca_app/shared/infrastructure/services/key_value_storage_service_impl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authRepository = AuthRepositoryImpl();
  final keyValueStorageService = KeyValueStorageServiceImpl();

  return AuthNotifier(
      authRepository: authRepository,
      keyValueStorageService: keyValueStorageService);
});

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository authRepository;

  final KeyValueStorageService keyValueStorageService;

  AuthNotifier({
    required this.authRepository,
    required this.keyValueStorageService,
  }) : super(AuthState()) {
    checkAuthStatus();
  }

  Future<void> loginUser(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      final user = await authRepository.login(email, password);

      _setLoggedUser(user);
    } on CustomError catch (e) {
     /// print('Error personalizado: ${e.message}');
      logout(e.message);
    } catch (e) {
      ///print('Error no controlado 5: $e');
      logout('Error no controlado 6');
    }
  }

  void registerUser(String email, String password, String name, String lastName,
      String role) async {
    await Future.delayed(const Duration(milliseconds: 500));
    try {
      print('REGISTERRR');
      final user = await authRepository.register(email, password, name, lastName, role);
      print('Error : ${user}');
      _setLoggedUser(user);
    } on CustomError catch (e) {
      logout(e.message);
    } catch (e) {
      //logout('Error no controlado');
    }
  }

  void checkAuthStatus() async {
    final token = await keyValueStorageService.getValue<String>('token');
    if (token == null) return logout();

    try {} catch (e) {
      logout();
    }
  }

  void _setLoggedUser(User user) async {
    print('user ${user.token}');
    await keyValueStorageService.setKeyValue('token', user.token);
    await keyValueStorageService.setKeyValue('currentUser', user);
    state = state.copyWith(
      user: user,
      authStatus: AuthStatus.authenticated,
      errorMessage: '',
    );
  }

  Future<void> logout([String? errorMessage]) async {
    await keyValueStorageService.removeKey('token');
    state = state.copyWith(
        authStatus: AuthStatus.notAuthenticated,
        user: null,
        errorMessage: errorMessage);
  }
}

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthState {
  final AuthStatus authStatus;
  final User? user;
  final String errorMessage;

  AuthState(
      {this.authStatus = AuthStatus.checking,
      this.user,
      this.errorMessage = ''});

  AuthState copyWith({
    AuthStatus? authStatus,
    User? user,
    String? errorMessage,
  }) =>
      AuthState(
          authStatus: authStatus ?? this.authStatus,
          user: user ?? this.user,
          errorMessage: errorMessage ?? this.errorMessage);
}
