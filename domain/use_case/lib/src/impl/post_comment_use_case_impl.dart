import 'package:repository/repository.dart';

import '../post_comment_use_case.dart';

class PostCommentUseCaseImpl implements PostCommentUseCase {
  final PartnerRepo partnerRepo;

  PostCommentUseCaseImpl(this.partnerRepo);

  @override
  Future<bool> post(String comment, int productId) async {
    final result = await partnerRepo.addComment(productId,comment);
    if(result.data != null){
      return result.data!;
    }
    return false;
  }
}
