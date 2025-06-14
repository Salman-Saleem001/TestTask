import 'package:bloc_demo/main_export.dart';
import 'package:bloc_demo/src/features/collection_detail_screen/collection_detail_export.dart';

class CollectionDetailModel extends CollectionDetailEntity implements Equatable{
  CollectionDetailModel({required super.collection});

  factory CollectionDetailModel.fromJson(Map<String, dynamic> json) {
    return CollectionDetailModel(
      collection: CollectionDetail.fromJson(json),
    );
  }

  @override

  List<Object?> get props => [super.collection];

  @override

  bool? get stringify => true;
}