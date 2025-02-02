import 'package:model/model.dart';
import 'package:network/network.dart';

import 'requests/announcement_mapper.dart';

extension SubmissionMapping on Submission {
  SubmissionDto toDto() {
    return SubmissionDto(
      driverName: driverName,
      partnerId: partnerId,
      products: products.map((item)=> item.toItemDto()).toList(),
      comment: comment,
      longitude: longitude,
      latitude: latitude,
    );
  }
}

extension SubmissionIemMapping on AdTrash {
  SubmissionDtoItem toItemDto(){
    return SubmissionDtoItem(trashId: trashId.toString(), volume: price.toString());
  }
}
