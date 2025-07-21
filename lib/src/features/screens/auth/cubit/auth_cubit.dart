import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_decor/src/core/services/auth_service.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService authService;

  AuthCubit(this.authService) : super(AuthInitial());

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      final token = await authService.login(email, password);
      emit(AuthSuccess(token));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> register(
    String fullName,
    String username,
    String email,
    String password,
    String confirm_password,
    String mobile,
    String dateOfBirth,
  ) async {
    emit(AuthLoading());
    try {
      final token = await authService.register(
        username,
        email,
        password,
        confirm_password,
        mobile,
        dateOfBirth,
        fullName,
      );
      emit(AuthSuccess(token));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> logout() async {
    emit(AuthLoading());
    try {
      await authService.logout();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailure('Logout failed: ${e.toString()}'));
    }
  }
}
