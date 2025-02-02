part of 'submission_cubit.dart';

@freezed
class SubmissionState with _$SubmissionState {
  const factory SubmissionState.success(PartnerData partnerData, DriverData driverData) = _SubmissionStateSuccess;
  const factory SubmissionState.error(String message) = _SubmissionStateError;
  const factory SubmissionState.loading() = _SubmissionStateLoading;
}