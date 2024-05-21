import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/utilities/enums.dart';
import 'package:ecommerce_app/features/forgotPassword&VerifyEmail/domain/entities/forgotpassword_entity.dart';
import 'package:ecommerce_app/features/forgotPassword&VerifyEmail/domain/usecases/forgotpassword_usecase.dart';
import 'package:equatable/equatable.dart';

part 'forgotpass&verifyemail_state.dart';
part 'forgotpassword_event.dart';

class ForgetpasswordAndeVerifyEmailBloc extends Bloc<
    ForgotpassAndVerifyEmailEvent, ForgetpasswordAndeVerifyEmailState> {
  final ForgotPassUsecase forgotPassUsecase;
  VerifyStatus status = VerifyStatus.forgotPassword;
  ForgetpasswordAndeVerifyEmailBloc(this.forgotPassUsecase)
      : super(ForgotStausState()) {
    on<SendLink>((event, emit) async {
      emit(ForgetpasswordLoadingState());
      final failureOrSuccess =
          await forgotPassUsecase(ForgetPasswordUsecaseParams(event.email));

      failureOrSuccess
          .fold((failure) => emit(ForgetpasswordErrorState(failure.message)),
              (success) {
        emit(ForgetpasswordFinishedState(success));
        status = VerifyStatus.verifyEmail;

        emit(VerifyStausState());
      });
    });
  }
}
