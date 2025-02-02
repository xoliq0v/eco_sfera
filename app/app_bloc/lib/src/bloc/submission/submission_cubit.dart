import 'package:core/core.dart';
import 'package:model/model.dart';
import 'package:use_case/use_case.dart';

import '../../../app_bloc.dart';

part 'submission_state.dart';
part 'submission_cubit.freezed.dart';

class SubmissionCubit extends Cubit<SubmissionState> {
  SubmissionCubit(this.getPartnerDataUseCase, this.createPartnerOrderUseCase, this.getDriverDataUseCase) : super(const SubmissionState.loading());

  final GetPartnerDataUseCase getPartnerDataUseCase;
  final CreatePartnerOrderUseCase createPartnerOrderUseCase;
  final GetUserProfile getDriverDataUseCase;

  Future<void> getPartnerData(int partnerId) async {
    emit(const SubmissionState.loading());
    final partnerData = await getPartnerDataUseCase.getPartnerData(partnerId);
    if (partnerData != null) {
      final driverData = await getDriverDataUseCase.get();
      if(driverData != null) {
        emit(SubmissionState.success(partnerData, driverData));
      } else {
        emit(const SubmissionState.error(LocaleKeys.tryAgain));
      }
    } else {
      emit(const SubmissionState.error(LocaleKeys.tryAgain));
    }
  }

  Future<bool> createOrder(Submission submission) async {
    final order = await createPartnerOrderUseCase.createOrder(submission);
    if (order.data != null) {
      return order.data ?? false;
    }
    return false;
  }
}
