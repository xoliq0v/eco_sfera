import 'package:model/model.dart';
import 'package:network/network.dart';

extension CustomerRegionMapper on RegionDTO {

  Region toModel(){

    return Region(id: id ?? -1, name: name ?? '-1');

  }

}