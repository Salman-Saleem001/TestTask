
class CollectionEntity{
  late final List<CollectionItem> _collection;
  List<CollectionItem> get collection=> _collection;
  CollectionEntity({required List<CollectionItem> collection}): _collection=collection;
}

class CollectionItem {
  final int id;
  final String name;
  final int vintage;
  final String caskNumber;
  final String imageUrl;
  final int availableBottles;
  final int totalBottles;
  final String detailsKey;

  CollectionItem({
    required this.id,
    required this.name,
    required this.vintage,
    required this.caskNumber,
    required this.imageUrl,
    required this.availableBottles,
    required this.totalBottles,
    required this.detailsKey,
  });

  factory CollectionItem.fromJson(Map<String, dynamic> json) {
    return CollectionItem(
      id: json['id'],
      name: json['name'],
      vintage: json['vintage'],
      caskNumber: json['cask_number'],
      imageUrl: json['image_url'],
      availableBottles: json['available_bottles'],
      totalBottles: json['total_bottles'],
      detailsKey: json['details_key'],
    );
  }
}
