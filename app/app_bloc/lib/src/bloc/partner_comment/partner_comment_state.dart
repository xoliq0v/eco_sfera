part of 'partner_comment_cubit.dart';

@freezed
class PartnerCommentState with _$PartnerCommentState {
  const factory PartnerCommentState.initial() = _PartnerCommentInitialState;
  const factory PartnerCommentState.success() = _PartnerCommentSuccessState;
  const factory PartnerCommentState.loading() = _PartnerCommentLoadingState;
  const factory PartnerCommentState.error(String message) = _PartnerCommentErrorState;
}