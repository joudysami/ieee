import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ieee/Features/auth/repo/auth_repo.dart';
import 'package:ieee/Features/auth/repo/auth_repo_imple.dart';
import 'package:ieee/Features/cubits/auth_cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final AuthRepo _authRepo = FirebaseAuthRepoImpl();
  void login({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      await _authRepo.login(email, password);
      emit(AuthSuccess());
      log("success");
    } catch (e) {
      emit(AuthFailure(error: e.toString()));
      log("failure:$e");
    }
  }

  void register({
    required String email,
    required String name,
    required String password,
  }) async {
    emit(AuthLoading());
    try {
      await _authRepo.register(email, name, password);
      emit(AuthSuccess());
      log("AuthCubit.register: success for email=$email");
    } catch (e) {
      emit(AuthFailure(error: e.toString()));
      log("AuthCubit.register error: $e");
    }
  }
}
