import 'package:objectbox/objectbox.dart';

import '../../entity/partner_entity.dart';

class PartnerProfileDAO {
  PartnerProfileDAO(Store store) : _box = store.box<PartnerEntity>();
  final Box<PartnerEntity> _box;

  int saveProfile(PartnerEntity userProfileEntity) {
    return _box.put(userProfileEntity);
  }

  PartnerEntity? getProfile() {
    final builder = _box.query().build();
    final profile = builder.findFirst();
    builder.close();
    return profile;
  }

  Stream<PartnerEntity?> watchProfile() {
    return _box.query().watch().map((event) {
      return event.findFirst();
    });
  }
}
