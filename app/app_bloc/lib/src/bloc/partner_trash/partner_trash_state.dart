part of 'partner_trash_cubit.dart';

@freezed
class PartnerTrashState with _$PartnerTrashState {
  const factory PartnerTrashState.initial() = _PartnerTrashInitialState;
  const factory PartnerTrashState.success({
    @Default([]) List<PartnerTrash>? partners,
  }) = _PartnerTrashSuccessState;
  const factory PartnerTrashState.loading() = _PartnerTrashLoadingState;
  const factory PartnerTrashState.error(String message) = _PartnerTrashErrorState;
}