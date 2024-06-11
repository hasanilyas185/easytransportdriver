part of 'cubit.dart';

class AuthDataProvider {
  static Future<GeneralResponse> signUp([Map? map]) async {
    try {
      final resp = await Api.ins.post("/auth/signup", data: map);
      final Map? raw = resp.data;
      return GeneralResponse.fromMap(raw as Map<String, dynamic>);
    } catch (e) {
      throw Exception("Internal Server Error");
    }
  }

  static Future<GeneralResponse> verifyOtp([Map? map]) async {
    try {
      final resp = await Api.ins.post("/auth/verifyCode", data: map);
      final Map? raw = resp.data;
      return GeneralResponse.fromMap(raw as Map<String, dynamic>);
    } catch (e) {
      throw Exception("Internal Server Error");
    }
  }

  static Future<GeneralResponse> createPassAndUser([Map? map]) async {
    try {
      final resp =
          await Api.ins.post("/auth/createPasswordAndCreateUser", data: map);
      final Map? raw = resp.data;
      return GeneralResponse.fromMap(raw as Map<String, dynamic>);
    } catch (e) {
      throw Exception("Internal Server Error");
    }
  }

  static Future<GeneralResponse> forgotPassword([Map? map]) async {
    try {
      final resp = await Api.ins.post("/auth/forgotPassword");
      final List raw = resp.data;
      return GeneralResponse.fromMap(raw as Map<String, dynamic>);
    } catch (e) {
      throw Exception("Internal Server Error");
    }
  }

  static Future<int?> logIn([Map? map]) async {
    try {
      final resp = await Api.ins.post("/admin/driverLoginReturnId", data: map);
      final int? raw = resp.data;
      return raw;
    } catch (e) {
      throw Exception("Internal Server Error");
    }
  }
}
