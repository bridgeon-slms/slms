import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:slms/services/auth/auth_services.dart';

class AuthenticationController extends ChangeNotifier {
  AuthServices authServices = AuthServices();
  bool hidePassword = true;
  bool isLogging = false;
  Future<String?> userlogin(
      {required String email, required String password}) async {
    isLogging = true;
    notifyListeners();
    try {
      final message = await authServices.userLogin(email, password);
      log(message);
      return message;
    } catch (e) {
      return "Something went wrong";
    } finally {
      isLogging = false;
      notifyListeners();
    }
  }

  Future<String?> emailVerify({required String email}) async {
    isLogging = true;
    notifyListeners();
    try {
      final message = await authServices.verifyEmail(email);
      if (message != null) {
        return message;
      }
    } catch (e) {
      log(e.toString());
    } finally {
      isLogging = false;
      notifyListeners();
    }
    return null;
  }

  Future<String?> verifyOtp(
      {required String code, required String email}) async {
    isLogging = true;
    notifyListeners();
    try {
      final message = await authServices.verifyOtp(email, code);
      if (message != null) {
        return message;
      }
    } catch (e) {
    } finally {
      isLogging = false;
      notifyListeners();
    }
  }

  void hidePasswordFunction() {
    hidePassword = !hidePassword;
    notifyListeners();
  }
}
