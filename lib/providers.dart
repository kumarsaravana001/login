import 'package:flutter/material.dart';
import 'package:flutter_application_loginscreen/api_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final emailControllerProvider = Provider<TextEditingController>((ref) {
  return TextEditingController();
});

final passwordControllerProvider = Provider<TextEditingController>((ref) {
  return TextEditingController();
});

final loginButtonStateNotifierProvider =
    StateNotifierProvider<LoginButtonStateNotifier, bool>((ref) {
  return LoginButtonStateNotifier();
});

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});

final loginResultProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  final emailController = ref.read(emailControllerProvider);
  final passwordController = ref.read(passwordControllerProvider);
  final apiService = ref.read(apiServiceProvider);

  final email = emailController.text;
  final password = passwordController.text;

  try {
    final result = await apiService.login(email, password);
    return result;
  } catch (e) {
    throw Exception('Failed to login');
  }
});

class LoginButtonStateNotifier extends StateNotifier<bool> {
  LoginButtonStateNotifier() : super(false);

  void setLoginButtonState(bool value) {
    state = value;
  }

  bool get loginButtonState => state;
}
