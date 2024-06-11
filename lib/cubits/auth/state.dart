part of 'cubit.dart';

@immutable
class SignUpState extends Equatable {
  static bool match(a, b) => a.signUp != b.signUp;

  final GeneralResponse? data;
  final String? message;

  const SignUpState({
    this.data,
    this.message,
  });

  @override
  List<Object?> get props => [data, message];
}

@immutable
class SignUpDefault extends SignUpState {}

@immutable
class SignUpLoading extends SignUpState {
  const SignUpLoading() : super();
}

@immutable
class SignUpSuccess extends SignUpState {
  const SignUpSuccess({GeneralResponse? data}) : super(data: data);
}

@immutable
class SignUpFailed extends SignUpState {
  const SignUpFailed({String? message}) : super(message: message);
}

@immutable
class VerifyOtpState extends Equatable {
  static bool match(a, b) => a.verifyOtp != b.verifyOtp;

  final GeneralResponse? data;
  final String? message;

  const VerifyOtpState({
    this.data,
    this.message,
  });

  @override
  List<Object?> get props => [data, message];
}

@immutable
class VerifyOtpDefault extends VerifyOtpState {}

@immutable
class VerifyOtpLoading extends VerifyOtpState {
  const VerifyOtpLoading() : super();
}

@immutable
class VerifyOtpSuccess extends VerifyOtpState {
  const VerifyOtpSuccess({GeneralResponse? data}) : super(data: data);
}

@immutable
class VerifyOtpFailed extends VerifyOtpState {
  const VerifyOtpFailed({String? message}) : super(message: message);
}

@immutable
class CreatePassAndUserState extends Equatable {
  static bool match(a, b) => a.createPassAndUser != b.createPassAndUser;

  final GeneralResponse? data;
  final String? message;

  const CreatePassAndUserState({
    this.data,
    this.message,
  });

  @override
  List<Object?> get props => [data, message];
}

@immutable
class CreatePassAndUserDefault extends CreatePassAndUserState {}

@immutable
class CreatePassAndUserLoading extends CreatePassAndUserState {
  const CreatePassAndUserLoading() : super();
}

@immutable
class CreatePassAndUserSuccess extends CreatePassAndUserState {
  const CreatePassAndUserSuccess({GeneralResponse? data}) : super(data: data);
}

@immutable
class CreatePassAndUserFailed extends CreatePassAndUserState {
  const CreatePassAndUserFailed({String? message}) : super(message: message);
}

@immutable
class ForgotPasswordState extends Equatable {
  static bool match(a, b) => a.forgotPassword != b.forgotPassword;

  final GeneralResponse? data;
  final String? message;

  const ForgotPasswordState({
    this.data,
    this.message,
  });

  @override
  List<Object?> get props => [data, message];
}

@immutable
class ForgotPasswordDefault extends ForgotPasswordState {}

@immutable
class ForgotPasswordLoading extends ForgotPasswordState {
  const ForgotPasswordLoading() : super();
}

@immutable
class ForgotPasswordSuccess extends ForgotPasswordState {
  const ForgotPasswordSuccess({GeneralResponse? data}) : super(data: data);
}

@immutable
class ForgotPasswordFailed extends ForgotPasswordState {
  const ForgotPasswordFailed({String? message}) : super(message: message);
}

@immutable
class LogInState extends Equatable {
  static bool match(a, b) => a.logIn != b.logIn;

  final int? data;
  final String? message;

  const LogInState({
    this.data,
    this.message,
  });

  @override
  List<Object?> get props => [data, message];
}

@immutable
class LogInDefault extends LogInState {}

@immutable
class LogInLoading extends LogInState {
  const LogInLoading() : super();
}

@immutable
class LogInSuccess extends LogInState {
  const LogInSuccess({int? data}) : super(data: data);
}

@immutable
class LogInFailed extends LogInState {
  const LogInFailed({String? message}) : super(message: message);
}

@immutable
class AuthState extends Equatable {
  final SignUpState? signUp;
  final VerifyOtpState? verifyOtp;
  final CreatePassAndUserState? createPassAndUser;
  final ForgotPasswordState? forgotPassword;
  final LogInState? logIn;

  const AuthState({
    this.signUp,
    this.verifyOtp,
    this.createPassAndUser,
    this.forgotPassword,
    this.logIn,
  });

  @override
  List<Object?> get props => [
        signUp,
        verifyOtp,
        createPassAndUser,
        forgotPassword,
        logIn,
      ];

  AuthState copyWith({
    SignUpState? signUp,
    VerifyOtpState? verifyOtp,
    CreatePassAndUserState? createPassAndUser,
    ForgotPasswordState? forgotPassword,
    LogInState? logIn,
  }) {
    return AuthState(
      signUp: signUp ?? this.signUp,
      verifyOtp: verifyOtp ?? this.verifyOtp,
      createPassAndUser: createPassAndUser ?? this.createPassAndUser,
      forgotPassword: forgotPassword ?? this.forgotPassword,
      logIn: logIn ?? logIn,
    );
  }
}

@immutable
class AuthStateDefault extends AuthState {
  const AuthStateDefault()
      : super(
          signUp: const SignUpState(),
          verifyOtp: const VerifyOtpState(),
          createPassAndUser: const CreatePassAndUserState(),
          forgotPassword: const ForgotPasswordState(),
          logIn: const LogInState(),
        );
}
