import 'package:model/model.dart';
import 'package:network/network.dart';

extension AnnouncementMapper on Announcement {
  AnnouncementDto toDto(){
    return AnnouncementDto(
      number: number,
      workTime: workTime,
      description: description,
      products: products.map((item)=> item.toDto()).toList(),
    );
  }
}

extension Ad on AdTrash {
  AdTrashDto toDto(){
    return AdTrashDto(trashId: trashId, price: price);
  }
}