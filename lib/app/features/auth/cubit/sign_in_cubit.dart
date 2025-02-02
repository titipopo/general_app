import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:general_app/core/index.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(const SignInState.unknown());

  Future<void> signInWithEmail(
    String email,
    String password,
  ) async {
    emit(const SignInState.processing());

    final response =
        await _authenticationRepository.signInWithEmail(email, password);

    if (response.isFailure) {
      emit(SignInState.failed(message: response.errorMessage));
    } else {
      emit(const SignInState.done());
    }
  }

  Future<void> signInWithGithub() async {
    emit(const SignInState.processing());

    final response = await _authenticationRepository.signInWithGithub();

    if (response.isFailure) {
      emit(SignInState.failed(message: response.errorMessage));
    } else {
      emit(const SignInState.done());
    }
  }

  Future<void> signInWithGoogle() async {
    emit(const SignInState.processing());

    final response = await _authenticationRepository.signInWithGoogle();

    if (response.isFailure) {
      emit(SignInState.failed(message: response.errorMessage));
    } else {
      emit(const SignInState.done());
    }
  }
}
