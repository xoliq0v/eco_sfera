import 'package:repository/repository.dart';

import '../post_comment_use_case.dart';

class PostCommentUseCaseImpl implements PostCommentUseCase {
  final PartnerRepo partnerRepo;

  PostCommentUseCaseImpl(this.partnerRepo);

  @override
  Future<void> post(String comment, int productId) {
    return partnerRepo.addComment(productId,comment);
  }
}
