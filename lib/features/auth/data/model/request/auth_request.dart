class AuthRequest {
  String? name;
  String? email;
  String? password;
  String? passwordConfirmation;
  int? verifyCode;
  int? newPassword;
  int? newPasswordConfirmation;

  AuthRequest({
    this.name,
    this.email,
    this.password,
    this.passwordConfirmation,
    this.verifyCode,
    this.newPassword,
    this.newPasswordConfirmation,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
      'verify_code': verifyCode,
      'new_password': newPassword,
      'new_password_confirmation': newPasswordConfirmation,
    };
  }
}
