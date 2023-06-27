part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignInWithEmailAndPassword extends AuthEvent {
  final String userName;
  final String password;

  SignInWithEmailAndPassword(this.userName, this.password);
}

class SignInWithGoogle extends AuthEvent {}

class CheckAuthEvent extends AuthEvent {
  final String userId;

  CheckAuthEvent(this.userId);
}

class SignOut extends AuthEvent {}
