import 'eco_service_item.dart';

class GridItem {
  final String title;
  final String image;
  final ItemType itemType;

  const GridItem({
    required this.title,
    required this.image,
    this.itemType = ItemType.medium,
  });
}
