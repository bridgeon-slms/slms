import 'package:flutter/widgets.dart';
import 'package:slms/services/auth/auth_services.dart';

class AuthenticationController extends ChangeNotifier {
  AuthServices authServices = AuthServices();

  bool isLogging = false;
  Future<String?> userLogin({required String email, required String password}) async {
    isLogging = true;
    try {
      print(email);
      authServices.userLogin(email, password);
    } finally {
      isLogging = false;
    }
    return 'success';
  }
}
