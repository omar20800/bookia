class AuthStates {}

class AuthInitial extends AuthStates {}

class AuthLoading extends AuthStates {}

class AuthSuccess extends AuthStates {}

class AuthCodeResent extends AuthStates {}

class AuthError extends AuthStates {
  final String message;
  AuthError({required this.message});
}
