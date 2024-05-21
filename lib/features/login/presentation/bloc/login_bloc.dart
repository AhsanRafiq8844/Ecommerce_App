import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/login/domain/usecases/login_usecase.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/login_entity.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase loginUsecase;

  LoginBloc(
    this.loginUsecase,
  ) : super(LoginInitialState()) {
    on<UserLogin>((event, emit) async {
      emit(LoginLoadingState());

      final failureOrSuccess = await loginUsecase(
          LoginUsecaseParams(email: event.email, password: event.password));
      failureOrSuccess.fold((failure) => emit(LoginErrorState(failure.message)),
          (success) => emit(LoginFinishedState(data: success)));
    });
  }
}
