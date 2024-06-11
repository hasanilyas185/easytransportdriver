import 'dart:async';
import 'package:easy_transport_driver/models/general.dart';
import 'package:easy_transport_driver/models/user.dart';
import 'package:easy_transport_driver/services/api.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'data_provider.dart';
part 'repository.dart';
part 'state.dart';

class AuthCubit extends Cubit<AuthState> {
  static AuthCubit c(BuildContext context, [bool listen = false]) {
    return BlocProvider.of<AuthCubit>(context, listen: listen);
  }

  AuthCubit() : super(const AuthStateDefault());

  final repo = AuthRepository();

  Future<void> signUp(Map map) async {
    emit(state.copyWith(
      signUp: const SignUpLoading(),
    ));
    try {
      final data = await repo.signUp(map);
      emit(state.copyWith(
        signUp: SignUpSuccess(data: data),
      ));
    } catch (e) {
      emit(state.copyWith(
        signUp: SignUpFailed(message: e.toString()),
      ));
    }
  }

  Future<void> verifyOtp(Map? map) async {
    emit(state.copyWith(
      verifyOtp: const VerifyOtpLoading(),
    ));
    try {
      final data = await repo.verifyOtp(map);
      emit(state.copyWith(
        verifyOtp: VerifyOtpSuccess(data: data),
      ));
    } catch (e) {
      emit(state.copyWith(
        verifyOtp: VerifyOtpFailed(message: e.toString()),
      ));
    }
  }

  Future<void> createPassAndUser(Map? map) async {
    emit(state.copyWith(
      createPassAndUser: const CreatePassAndUserLoading(),
    ));
    try {
      final data = await repo.createPassAndUser(map);
      emit(state.copyWith(
        createPassAndUser: CreatePassAndUserSuccess(data: data),
      ));
    } catch (e) {
      emit(state.copyWith(
        createPassAndUser: CreatePassAndUserFailed(message: e.toString()),
      ));
    }
  }

  Future<void> forgotPassword() async {
    emit(state.copyWith(
      forgotPassword: const ForgotPasswordLoading(),
    ));
    try {
      final data = await repo.forgotPassword();
      emit(state.copyWith(
        forgotPassword: ForgotPasswordSuccess(data: data),
      ));
    } catch (e) {
      emit(state.copyWith(
        forgotPassword: ForgotPasswordFailed(message: e.toString()),
      ));
    }
  }

  Future<void> logIn(Map? map) async {
    emit(state.copyWith(
      logIn: const LogInLoading(),
    ));
    try {
      final data = await repo.logIn(map);
      emit(state.copyWith(
        logIn: LogInSuccess(data: data),
      ));
    } catch (e) {
      emit(state.copyWith(
        logIn: LogInFailed(message: e.toString()),
      ));
    }
  }
}
