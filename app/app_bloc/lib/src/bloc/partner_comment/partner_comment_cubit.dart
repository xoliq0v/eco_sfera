import 'package:core/core.dart';
import 'package:model/model.dart';
import 'package:use_case/use_case.dart';

import '../../../app_bloc.dart';

part 'partner_comment_state.dart';
part 'partner_comment_cubit.freezed.dart';

class PartnerCommentCubit extends Cubit<PartnerCommentState> {
  PartnerCommentCubit(this._postComment,this._getPartnerComments,this._getAllProducts) : super(const PartnerCommentState.initial());

  final PostCommentUseCase _postComment;
  final GetPartnerComments _getPartnerComments;
  final GetAllProducts _getAllProducts;

  Future<bool> postComment(int partnerId, String comment) async{
    final result = await _postComment.post(comment, partnerId);
    if(result){
      return true;
    }else{
      return false;
    }
  }

  Future<void> getComments() async{
    emit(const PartnerCommentState.loading());
    final result = await _getPartnerComments.call();
    if(result.data != null){
      emit(PartnerCommentState.success(result.data!));
    }else{
      emit(const PartnerCommentState.error(LocaleKeys.tryAgain));
    }
  }

  Future<List<Product>> getAllProducts() async{
    final result = await _getAllProducts.get();
    if(result.data != null){
      return result.data!;
    }
    return [];
  }
}
