import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/features/shop/domain/entities/reviews_entity.dart';
import 'package:ecommerce_app/features/shop/domain/usecases/getAllReviews.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/response_entity.dart';
import '../../domain/usecases/sendReview_usecase.dart';

part 'send_review_event.dart';
part 'send_review_state.dart';

class SendReviewBloc extends Bloc<SendReviewEvent, SendReviewState> {
  final SendReviewUsecase sendReviewUsecase;
  final GetReviewsUsecase getReviewsUsecase;
  SendReviewBloc(this.sendReviewUsecase, this.getReviewsUsecase)
      : super(SendReviewInitial()) {
    on<SendReview>((event, emit) async {
      emit(SendReviewLoadingState());
      final failurOrSuccess = await sendReviewUsecase(
        SendReviewUsecaseParams(
          event.productId,
          event.comment,
          event.rating,
        ),
      );

      failurOrSuccess.fold(
          (failure) => emit(SendReviewErrorState(failure.message)), (success) {
        emit(SendReviewLoadedState(success));
        add(GetReviews(event.productId));
      });
    });

    on<GetReviews>((event, emit) async {
      emit(GetAllReviewsLoadingState());

      final failurOrSuccess =
          await getReviewsUsecase(GetReviewsUsecaseParams(event.productId));
      failurOrSuccess
          .fold((failure) => emit(GetAllReviewsErrorState(failure.message)),
              (success) {
        emit(GetAllReviewsLoadedState(success));
      });
    });
  }
}
