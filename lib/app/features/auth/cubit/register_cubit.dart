
import 'package:general_app/core/utils/data_response.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:general_app/core/index.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(
  )  :
        super(const RegisterState.unknown());

  Future<void> registerWithEmail(
    String email,
    String password,
  ) async {
    emit(const RegisterState.processing());

    final response =
        await _authenticationRepository.registerWithEmail(email, password);

    if (response.isFailure) {
      emit(RegisterState.failed(message: response.errorMessage));
    } else {
      emit(const RegisterState.done());
    }
  }
}
