import 'package:core/core.dart';
import 'package:use_case/use_case.dart';

import '../../../app_bloc.dart';

part 'partner_comment_state.dart';
part 'partner_comment_cubit.freezed.dart';

class PartnerCommentCubit extends Cubit<PartnerCommentState> {
  PartnerCommentCubit(this._postComment) : super(const PartnerCommentState.initial());

  final PostCommentUseCase _postComment;

  Future<void> postComment(int partnerId, String comment) async{
    emit(const PartnerCommentState.loading());
    final result = await _postComment.post(comment, partnerId);
    if(result){
      emit(const PartnerCommentState.success());
    }else{
      emit(const PartnerCommentState.error(LocaleKeys.tryAgain));
    }
  }
}