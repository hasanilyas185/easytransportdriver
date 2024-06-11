part of 'cubit.dart';

class AuthRepository {
  Future<GeneralResponse> signUp([Map? map]) => AuthDataProvider.signUp(map);

  Future<GeneralResponse> verifyOtp([Map? map]) =>
      AuthDataProvider.verifyOtp(map);

  Future<GeneralResponse> createPassAndUser([Map? map]) =>
      AuthDataProvider.createPassAndUser(map);

  Future<GeneralResponse> forgotPassword([Map? map]) =>
      AuthDataProvider.forgotPassword(map);

  Future<int?> logIn([Map? map]) => AuthDataProvider.logIn(map);
}
