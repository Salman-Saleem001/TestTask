import 'package:bloc_demo/main_export.dart';

class CollectionModel extends CollectionEntity implements Equatable{
  CollectionModel({required super.collection});


  factory CollectionModel.fromJson(List<dynamic> json) {
    return CollectionModel(
      collection:  List<CollectionItem>.from(json.map((x) => CollectionItem.fromJson(x))),
    );
  }

  @override

  List<Object?> get props => [super.collection];

  @override

  bool? get stringify => true;
}