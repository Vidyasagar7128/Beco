part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {}

class AuthInitial extends AuthState {
  final AuthStateModel user;

  AuthInitial(this.user);
  @override
  List<Object?> get props => [user];
}

class Loading extends AuthState {
  @override
  List<Object?> get props => [];
}

class Authenticated extends AuthState {
  @override
  List<Object?> get props => [];
}

class UnAuthenticated extends AuthState {
  @override
  List<Object?> get props => [];
}

// class GetUser extends AuthState {
//   final AuthStateModel user;

//   GetUser(this.user);
//   @override
//   List<Object?> get props => [user];
// }

class AuthError extends AuthState {
  final String error;

  AuthError(this.error);

  @override
  List<Object?> get props => [error];
}
