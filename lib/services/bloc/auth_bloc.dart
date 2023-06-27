import 'package:beco/repositories/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/auth_state_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  AuthBloc(this._authRepository)
      : super(AuthInitial(AuthStateModel('user', true, true))) {
    on<CheckAuthEvent>((event, emit) {
      emit(Loading());
      try {
        _authRepository.getUser();
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });
    on<SignInWithGoogle>((event, emit) {
      emit(Loading());
      try {
        _authRepository.signInWithGoogle();
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });
    on<SignInWithEmailAndPassword>((event, emit) {
      emit(Loading());
      try {
        _authRepository.signInWithEmailAndPassword(
            event.userName, event.password);
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });
    on<SignOut>((event, emit) {
      emit(Loading());
      try {
        _authRepository.signOut();
        emit(UnAuthenticated());
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });
  }
}
