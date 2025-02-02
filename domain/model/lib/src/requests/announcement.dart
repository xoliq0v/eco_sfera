import 'package:core/core.dart';

class Announcement extends Equatable{

  Announcement({
    required this.number,
    required this.workTime,
    required this.description,
    required this.products
  });

  final String number;
  final String workTime;
  final String description;
  final List<AdTrash> products;
  
  @override
  List<Object?> get props => [number,workTime,description,products];

}

class AdTrash extends Equatable{

  AdTrash({required this.trashId,required this.price});

  final int trashId;
  final int price;
  
  @override
  List<Object?> get props => [trashId,price];

  
}