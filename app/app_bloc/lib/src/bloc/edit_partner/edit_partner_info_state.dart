part of 'edit_partner_info_cubit.dart';

@freezed
class EditPartnerInfoState with _$EditPartnerInfoState {
  const factory EditPartnerInfoState.initial() = _EditPartnerInfoInitialState;
  const factory EditPartnerInfoState.loading() = _EditPartnerInfoLoadingState;
  const factory EditPartnerInfoState.success() = _EditPartnerInfoSuccessState;
  const factory EditPartnerInfoState.error(String message) = _EditPartnerInfoErrorState;
}