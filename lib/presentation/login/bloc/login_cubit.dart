import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  Future<void> submit({required String email, required String password}) async {
    emit(state.copyWith(status: LoginStatus.loading));

    if (email.isEmpty) {
      emit(
        state.copyWith(
          status: LoginStatus.failure,
          errorMessage: 'Informe o e-mail',
        ),
      );
      return;
    }

    emit(state.copyWith(status: LoginStatus.success));
  }
}
